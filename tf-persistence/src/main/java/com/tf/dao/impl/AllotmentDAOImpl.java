package com.tf.dao.impl;

import com.tf.dao.AllotmentDAO;
import com.tf.model.Allotment;

import java.math.BigDecimal;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.ProjectionList;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
@Transactional
public class AllotmentDAOImpl extends BaseDAOImpl<Allotment, Long>   implements AllotmentDAO {
	
	@SuppressWarnings("unchecked")
	public List<Allotment> getALlotmentsbyTrade(long tradeID){
		_log.debug("Inside getALlotmentsbyTrade ");
		try {
			
			List<Allotment> allotmentList = (List<Allotment>)sessionFactory.getCurrentSession().createCriteria(Allotment.class).add(Restrictions.eq("scfTrade.id", tradeID)).list();
			              
			
			_log.debug("getALlotmentsbyTrade successful, result size: "
					+ allotmentList.size());
			return allotmentList;

		} catch (RuntimeException re) {
			_log.error("getALlotmentsbyTrade failed", re);
			throw re;
		}
		
		
		
	}
	
	@SuppressWarnings("unchecked")
	public List<Allotment> getALlotmentByPortId(long portId,int startIndex,int pageSize){
		_log.debug("Inside getALlotmentByPortId ");
		try {
			
			List<Allotment> allotmentList = (List<Allotment>)sessionFactory.getCurrentSession().createCriteria(Allotment.class).add(Restrictions.eq("investorPortfolio.investorProtId", portId)).setFirstResult(startIndex).setMaxResults(pageSize).list();
			              
			
			_log.debug("getALlotmentByPortId successful, result size: "
					+ allotmentList.size());
			return allotmentList;

		} catch (RuntimeException re) {
			_log.error("getALlotmentByPortId failed", re);
			throw re;
		}
		
		
		
	}
	@SuppressWarnings("unchecked")
	public List<Allotment> getAllotmentByStatus(String status){
		_log.debug("Inside getAllotmentByStatus ");
		try {
			
			List<Allotment> results = (List<Allotment>) sessionFactory.getCurrentSession().createCriteria(Allotment.class)
					.add(Restrictions.eq("status", status)).list();
			_log.debug("getAllotmentByStatus successful, result size: "
					+ results.size());
			return results;
		} catch (RuntimeException re) {
			_log.error("getAllotmentByStatus failed", re);
			throw re;
		}
	}

	@SuppressWarnings("unchecked")
	public List<Allotment> groupAllotmentbyBps(long tradeID) {
		List<Allotment>  allotmentList=new ArrayList<Allotment>();
		Allotment allotment;
		List<Object[]> rows=new ArrayList<Object[]>();
		
		_log.debug("Inside getALlotmentsbyTrade ");
		try {
			
			Criteria cr = sessionFactory.getCurrentSession().createCriteria(Allotment.class).add(Restrictions.eq("scfTrade.id", tradeID));
			              
			ProjectionList prList = Projections.projectionList();
			prList.add(Projections.groupProperty("marketDiscount"));
			prList.add(Projections.sum("allotmentAmount"));
			prList.add(Projections.sum("whitehallProfitShare"));
			prList.add(Projections.sum("investorNetProfit"));
			prList.add(Projections.property("noOfdays"));
			prList.add(Projections.property("allotmentDate"));
			cr.setProjection(prList);
			rows = (List<Object[]>) cr.list();
			DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSSSSS");
			for(Object[] row:rows){
				allotment=new Allotment();
				allotment.setMarketDiscount(Integer.valueOf(row[0].toString()));
				allotment.setAllotmentAmount(new BigDecimal (row[1].toString()));
				allotment.setWhitehallProfitShare(new BigDecimal(row[2].toString()) );
				allotment.setInvestorNetProfit(new BigDecimal (row[3].toString()));
				allotment.setNoOfdays(Integer.valueOf(row[4].toString()));
				allotment.setAllotmentDate(formatter.parse(row[5].toString()));
				allotmentList.add(allotment);
			}
			_log.debug("getALlotmentsbyTrade successful, result size: "
					+ allotmentList.size());
			
		} catch (RuntimeException re) {
			_log.error("getALlotmentsbyTrade failed", re);
			throw re;
		}
		catch (ParseException pe ) {
			_log.error("getALlotmentsbyTrade failed" +pe.getMessage());
			
		}
		
		return allotmentList;
	}

	public Long getAllotsCount(long allotId) {
		_log.debug("Inside getAllotsCount ");
		try {
			
			Long resultCount = (Long) sessionFactory.getCurrentSession().createCriteria(Allotment.class).add(Restrictions.eq("allotmentId", allotId)).setProjection(Projections.rowCount()).uniqueResult();
			_log.debug("getAllotsCount  "	+ resultCount);
			return resultCount;
		} catch (RuntimeException re) {
			_log.error("getAllotsCount failed", re);
			throw re;
		}
	}
	
	@SuppressWarnings("unchecked")
	public List<Allotment> getAllotmentByInvestorAndStatus(long invId,String status){
		_log.debug("Inside getALlotmentByPortId ");
		try {
			
			Criteria criteria  = sessionFactory.getCurrentSession().createCriteria(Allotment.class);
			criteria.createAlias("investorPortfolio", "prot");  // here i changed 
			criteria.createAlias("prot.investor", "investor");  //  here i have changed 			
			List<Allotment> allotmentList=(List<Allotment>)criteria.add(Restrictions.eq("investor.investorId", invId)).add(Restrictions.eq("status", status)).list();		
			_log.debug("getALlotmentByPortId successful, result size: "
					+ allotmentList.size());
			return allotmentList;

		} catch (RuntimeException re) {
			_log.error("getALlotmentByPortId failed", re);
			throw re;
		}	
		
	}
	
	
	@SuppressWarnings("unchecked")
	public BigDecimal getTotalInvestorProfitForTrade(long tradeID) {
		
		BigDecimal totalNetProfit=BigDecimal.ZERO;
		
		List<Object[]> rows=new ArrayList<Object[]>();
		
		_log.debug("Inside getTotalInvestorProfitForTrade ");
		try {
			
			Criteria cr = sessionFactory.getCurrentSession().createCriteria(Allotment.class).add(Restrictions.eq("scfTrade.id", tradeID));			              
			ProjectionList prList = Projections.projectionList();		
			prList.add(Projections.sum("investorNetProfit"));			
			cr.setProjection(prList);
			rows = (List<Object[]>) cr.list();
			for(Object[] row:rows){
				totalNetProfit=row[1] !=null ?new BigDecimal(row[1].toString()):BigDecimal.ZERO;
			}			
			
		} catch (RuntimeException re) {
			_log.error("getTotalInvestorProfitForTrade failed", re);
			throw re;
		}		
		
		return totalNetProfit;
	}
	
}
