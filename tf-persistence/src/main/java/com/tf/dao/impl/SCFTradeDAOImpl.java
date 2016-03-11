package com.tf.dao.impl;

import com.tf.dao.SCFTradeDAO;
import com.tf.model.Allotment;
import com.tf.model.InvestorTransaction;
import com.tf.model.Invoice;
import com.tf.model.SCFTrade;

import java.io.Serializable;
import java.math.BigDecimal;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;

import org.hibernate.Criteria;
import org.hibernate.FetchMode;
import org.hibernate.Hibernate;
import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.criterion.CriteriaSpecification;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Distinct;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Projection;
import org.hibernate.criterion.ProjectionList;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

@Repository
@Transactional
public class SCFTradeDAOImpl extends BaseDAOImpl<SCFTrade, Serializable> implements SCFTradeDAO {	
	
	public SCFTradeDAOImpl() {
		super(SCFTrade.class);
	}

	
	@SuppressWarnings("unchecked")
	public List<SCFTrade>  getScfTrades(int startIndex,int pageSize){
		_log.debug("Inside getScfTrades  ");
		try {
			List<SCFTrade> results = (List<SCFTrade>) sessionFactory.getCurrentSession().createCriteria(SCFTrade.class).setFetchMode("invoices",FetchMode.JOIN).setFetchMode("allotments", FetchMode.JOIN)
					.setResultTransformer(CriteriaSpecification.DISTINCT_ROOT_ENTITY).setFirstResult(startIndex).setMaxResults(pageSize).list();
			_log.debug("getScfTrades successful, result size: "
					+ results.size());
			return results;
		} catch (RuntimeException re) {
			_log.error("getScfTrades failed", re);
			throw re;
		}
	}
	
	public Long getScfTradesCount() {
		_log.debug("Inside getScfTradesCount ");
		try {
			
			Long resultCount = (Long) sessionFactory.getCurrentSession().createCriteria(SCFTrade.class).setProjection(Projections.rowCount()).uniqueResult();
			_log.info("getScfTradesCount Count:: "	+ resultCount);
			return resultCount;
		} catch (RuntimeException re) {
			_log.error("getScfTradesCount Count failed", re);
			throw re;
		}
	}
	
	public SCFTrade save(SCFTrade scfTrade) {
		try {
			Long id=(Long)sessionFactory.getCurrentSession().save(scfTrade);
			scfTrade.setId(id);
			_log.debug("persist successful"+scfTrade);
		} catch (RuntimeException re) {
			_log.error("persist failed", re);
			throw re;
		}
		
		return scfTrade;
	}
	
	@SuppressWarnings("unchecked")
	public List<SCFTrade> getScfTrades(Long companyID){		
		_log.debug("Inside getScfTrades ");
		try {
			
			List<SCFTrade> results = (List<SCFTrade>) sessionFactory.getCurrentSession().createCriteria(SCFTrade.class).add(Restrictions.eq("company.id", companyID)).setFetchMode("invoices",FetchMode.JOIN).
					setResultTransformer(CriteriaSpecification.DISTINCT_ROOT_ENTITY).list();
			_log.debug("getScfTrades successful, result size: "
					+ results.size());
		return results;
		} catch (RuntimeException re) {
			_log.error("getScfTrades failed", re);
			throw re;
		}
		
	}
	
	public SCFTrade findById(long id) {
		_log.debug("getting Trade instance with id: " + id);
		try {
			SCFTrade instance = (SCFTrade) sessionFactory.getCurrentSession().get(
					"com.tf.model.SCFTrade", id);
			Hibernate.initialize(instance.getInvoices());
			
			if (instance == null) {
				_log.debug("get successful, no instance found");
			} else {
				_log.debug("get successful, instance found");
			}
			return instance;
		} catch (RuntimeException re) {
			_log.error("get failed", re);
			throw re;
		}
	}
	
	public List<SCFTrade> getScfTradesByTradeId(Long tradeId){		
		_log.debug("Inside getScfTrades ");
		try {
			
			List<SCFTrade> results = (List<SCFTrade>) sessionFactory.getCurrentSession().createCriteria(SCFTrade.class).add(Restrictions.eq("id", tradeId)).list();
			_log.debug("getScfTrades successful, result size: "
					+ results.size());
			return results;
		} catch (RuntimeException re) {
			_log.error("getScfTrades failed", re);
			throw re;
		}
		
	}
	@SuppressWarnings("unchecked")
	public List<SCFTrade> getScfTradeList(String RegNum,int startIndex,int pageSize){		
		_log.debug("Inside getScfTrades ");
		try {
			Criteria criteria = sessionFactory.getCurrentSession().createCriteria(SCFTrade.class);
			criteria.createAlias("invoices", "inv");
			ProjectionList prList = Projections.projectionList();
             prList.add((Projections.distinct(Projections.property("inv.scfTrade"))));
             criteria.setProjection(prList);
			List<SCFTrade> scftrades=(List<SCFTrade>)criteria.add(Restrictions.eq("inv.sellerCompanyRegistrationNumber", RegNum))
					.setFirstResult(startIndex)
					.setMaxResults(pageSize).list();
			
			
			/*Set<SCFTrade> tradeSet = new LinkedHashSet<SCFTrade>();
             SCFTrade scfTrade=null;
			for (Invoice inv : invoice) {
				scfTrade = inv.getScfTrade();
				System.out.println("Dhanush:"+scfTrade);
			List<SCFTrade> results = (List<SCFTrade>) sessionFactory.getCurrentSession().createCriteria(SCFTrade.class).add(Restrictions.eq("id", scfTrade.getId())).setFirstResult(startIndex).setMaxResults(pageSize).list();
			for (SCFTrade trade : results) {
				tradeSet.add(trade);
			}
		}	
			scftrades = new ArrayList<SCFTrade>(tradeSet);
*/
			_log.debug("getScfTrades successful, result size: "
					
					+ scftrades.size());
			return scftrades;
		} catch (RuntimeException re) {
			_log.error("getScfTrades failed", re);
			throw re;
		}
		
	}
	
	@SuppressWarnings("unchecked")
	public List<SCFTrade> getScfTrades(Long companyID,int startIndex,int pageSize) {
		_log.debug("Inside getScfTrades ");
		try {
			
			List<SCFTrade> results = (List<SCFTrade>) sessionFactory.getCurrentSession().createCriteria(SCFTrade.class).add(Restrictions.ne("company.id", companyID)).setFetchMode("invoices",FetchMode.JOIN).
					setResultTransformer(CriteriaSpecification.DISTINCT_ROOT_ENTITY).setFirstResult(startIndex).setMaxResults(pageSize).list();
			_log.debug("getScfTrades successful, result size: "
					+ results.size());
			return results;
		} catch (RuntimeException re) {
			_log.error("getScfTrades failed", re);
			throw re;
		}
	}
	public Long getScfTradesCountByCompanyId(Long companyID) {
		_log.debug("Inside getScfTradesCountByCompanyId ");
		try {
			
			Long resultCount = (Long) sessionFactory.getCurrentSession().createCriteria(SCFTrade.class).add(Restrictions.ne("company.id", companyID)).setProjection(Projections.rowCount()).uniqueResult();
			_log.info("getScfTradesCountByCompanyId Count:: "	+ resultCount);
			return resultCount;
		} catch (RuntimeException re) {
			_log.error("getScfTradesCountByCompanyId Count failed", re);
			throw re;
		}
	}
	
	public Long getScfTradesCount(Long companyID) {
		_log.debug("Inside getCompanies ");
		try {
			
			Long resultCount = (Long) sessionFactory.getCurrentSession().createCriteria(SCFTrade.class).add(Restrictions.ne("company.id", companyID)).setProjection(Projections.rowCount()).uniqueResult();
			_log.debug("Companies Count "	+ resultCount);
			return resultCount;
		} catch (RuntimeException re) {
			_log.error("Companies Count failed", re);
			throw re;
		}
	}
	
	public Long getScfTradeCount(Long tradeId) {
		_log.debug("Inside getCompanies ");
		try {
			
			Long resultCount = (Long) sessionFactory.getCurrentSession().createCriteria(SCFTrade.class).add(Restrictions.eq("id", tradeId)).setProjection(Projections.rowCount()).uniqueResult();
			_log.debug("Companies Count "	+ resultCount);
			return resultCount;
		} catch (RuntimeException re) {
			_log.error("Companies Count failed", re);
			throw re;
		}
	}
	
	
	
	public Long getScfTradeCounts(String regNum) {
		_log.debug("Inside getScfTradeCounts ");
		try {
			Criteria criteria  = sessionFactory.getCurrentSession().createCriteria(SCFTrade.class);
			criteria.createAlias("invoices", "inv");
			Long resultCount = (Long) criteria.add(Restrictions.eq("inv.sellerCompanyRegistrationNumber", regNum))
					            .setResultTransformer(CriteriaSpecification.DISTINCT_ROOT_ENTITY)
					            .setProjection(Projections.rowCount()).uniqueResult();
				
			_log.debug("getScfTradeCounts Count "	+ resultCount);
			return resultCount;
		} catch (RuntimeException re) {
			_log.error("getScfTradeCounts Count failed", re);
			throw re;
		}
	}
	
	public String findByQueryId(String tradeId) {
		_log.debug("Inside findByQueryId ");
        try{
        	String scfTrade=null;
          String sql="select scf_id from scf_trade where scf_id = (select max(scf_id) from scf_trade where scf_id like'%" + tradeId +"%\')";
		  Query query = sessionFactory.getCurrentSession().createSQLQuery(sql);
		  scfTrade = (String) query.uniqueResult();
		  _log.debug("findByQueryId: " + scfTrade);

		  return scfTrade;
	} catch (RuntimeException re) {
		_log.error("findByQueryId  failed", re);
		throw re;
	}
		
	}
	
	
	@SuppressWarnings("unchecked")
	public List<SCFTrade> getTradeHistoryByComapnyId(long companyId,int startIndex,int pageSize){
		_log.debug("Inside getTradeHistoryByComapnyId ");
		List<SCFTrade>  scfTrades=new ArrayList<SCFTrade>();
	    SCFTrade scfTrade;
		try {
			String query = "select distinct trd.id as TradeID, trd.company_id as CompanyID, (select name from tf_company where idcompany = company_id) as Company, trd.status Status,trd.trade_amount, (select count(trade_id) from scf_invoice where trade_id = trd.id) Invocies, cmp.name SellerCompany from scf_trade trd, scf_invoice inv, tf_company cmp where company_id = "+companyId+" and inv.trade_id = trd.id and cmp.regnumber =  inv.seller_company_registration_number LIMIT " + startIndex + "," + pageSize; 
			List<Object[]> resultscheck = (List<Object[]>) sessionFactory.getCurrentSession().createSQLQuery(query).list();
			 for(Object[] row:resultscheck){
					scfTrade = new SCFTrade();
					scfTrade.setId(Long.valueOf((row[0].toString())));
					scfTrade.setTradeNotes(row[2].toString());
                    scfTrade.setStatus(row[3].toString());
					scfTrade.setTradeAmount(new BigDecimal (row[4].toString()));
					scfTrade.setDuration(Integer.valueOf(row[5].toString()));
					scfTrade.setInsuranceDocName(row[6].toString());
					scfTrades.add(scfTrade);
				}
			
			_log.debug("getTradeHistoryByComapnyId successful, result size: "
					+ scfTrades.size());
			return scfTrades;

		} catch (RuntimeException re) {
			_log.error("getTradeHistoryByComapnyId failed", re);
			throw re;
		}
		
		
	}
	 @SuppressWarnings("unchecked")
	public List<SCFTrade> getTradeHistoryList(int startIndex,int pageSize){
		 _log.debug("Inside getTradeHistoryList ");

		    List<SCFTrade>  scfTrades=new ArrayList<SCFTrade>();
		    SCFTrade scfTrade;
		 try{
		 String qry = "select (select name from tf_company where idcompany = company_id) as company, "
				 		+"sum(trade_amount) as trade_amount, (select count(trade_id) from scf_invoice where scf_company= company_id) as trades, "
				 		+"company_id from tradedb.scf_trade group by company_id LIMIT " + startIndex + "," + pageSize;
/*		 Criteria criteria = (Criteria) sessionFactory.getCurrentSession().createSQLQuery(qry);
*/		 
		 List<Object[]> resultscheck = (List<Object[]>) sessionFactory.getCurrentSession().createSQLQuery(qry).list();
			for(Object[] row:resultscheck){
				scfTrade = new SCFTrade();
				scfTrade.setTradeNotes(row[0].toString());
				scfTrade.setTradeAmount(new BigDecimal (row[1].toString()));
				scfTrade.setDuration(Integer.valueOf(row[2].toString()));
				scfTrade.setInsuranceDocId(Long.valueOf(row[3].toString()));
				scfTrades.add(scfTrade);
			}

	     _log.debug("getTradeHistoryList successful, result size: "
					+ scfTrades.size());
	     return scfTrades;
		 }catch(RuntimeException re){
			 _log.error("getTradeHistoryList failed", re);
				throw re;
		 }
	 }
	 public Long getScfTradesHistoryCount() {
			_log.debug("Inside getScfTradesHistoryCount ");
			try {
				
				String qry = "select (select name from tf_company where idcompany = company_id) as company, "
				 		+"sum(trade_amount) as trade_amount, (select count(trade_id) from scf_invoice where scf_company= company_id) as trades, "
				 		+"company_id from tradedb.scf_trade group by company_id;";
				Long resultscheck = Long.valueOf(( sessionFactory.getCurrentSession().createSQLQuery(qry)).list().size());
				_log.info("getScfTradesHistoryCount Count:: "	+ resultscheck);
				return resultscheck;
			} catch (RuntimeException re) {
				_log.error("getScfTradesHistoryCount Count failed", re);
				throw re;
			}
		}
	 public Long getHistoryCount(long companyId) {
			_log.debug("Inside getScfTradesHistoryCount ");
			try {
				
				String query = "select distinct trd.id as TradeID, trd.company_id as CompanyID, (select name from tf_company where idcompany = company_id) as Company, trd.status Status,trd.trade_amount, (select count(trade_id) from scf_invoice where trade_id = trd.id) Invocies, cmp.name SellerCompany from scf_trade trd, scf_invoice inv, tf_company cmp where company_id = "+companyId+" and inv.trade_id = trd.id and cmp.regnumber =  inv.seller_company_registration_number "; 
				Long resultscheck = Long.valueOf((sessionFactory.getCurrentSession().createSQLQuery(query)).list().size());
				_log.info("getScfTradesHistoryCount Count:: "	+ resultscheck);
				return resultscheck;
			} catch (RuntimeException re) {
				_log.error("getScfTradesHistoryCount Count failed", re);
				throw re;
			}
		}
	 
	 
	 @SuppressWarnings("unchecked")
		public List<SCFTrade> getScfTradeByScfCompany(long scfCompany,Date frmDate,Date toDate){
			_log.debug("Inside getScfTradeByScfCompany  ");
			List<SCFTrade> historyList=new ArrayList<SCFTrade>();
			
			try {
				String qry = "select (select name from tf_company where idcompany = company_id) as company, "
				 		+"sum(trade_amount) as trade_amount, (select count(trade_id) from scf_invoice where scf_company= company_id) as trades, "
				 		+"company_id from tradedb.scf_trade group by company_id"; 
		  Query resultscheck =  (Query) sessionFactory.getCurrentSession().createSQLQuery(qry);
			if(!StringUtils.isEmpty(scfCompany)){
				_log.info("scfCompany is " + scfCompany);
/*				  resultscheck.setParameter("company_id", scfCompany);
*/	         }
			
			if(!StringUtils.isEmpty(frmDate)){
				_log.info("From Date " + frmDate);
				  resultscheck.setParameter("openingDate", frmDate);
	         }
			if(!StringUtils.isEmpty(toDate)){
				_log.info("To Date"+toDate);
				
                resultscheck.setParameter("closingDate",toDate);
			}
			
			historyList = resultscheck.list();
		     _log.debug("getScfTradeByScfCompany, result size: "
						+ historyList.size());
		     
	       } catch (RuntimeException re) {
				_log.error("getScfTradeByScfCompany failed", re);
				throw re;
			}
			
			return historyList;
		
		}
}
