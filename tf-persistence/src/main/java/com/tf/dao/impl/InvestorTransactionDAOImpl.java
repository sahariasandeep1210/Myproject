package com.tf.dao.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

import com.tf.dao.InvestorTransactionDAO;
import com.tf.model.InvestorPortfolio;
import com.tf.model.InvestorTransaction;

@Repository
@Transactional
public class InvestorTransactionDAOImpl extends BaseDAOImpl<InvestorTransaction, Long>   implements InvestorTransactionDAO {

	public InvestorTransactionDAOImpl(){
		super(InvestorTransaction.class);
	}
	public List<InvestorTransaction> getInvestorTransactions() {
		try{
			List<InvestorTransaction> list =(List<InvestorTransaction>) sessionFactory.getCurrentSession().createCriteria(InvestorTransaction.class).list();
			_log.debug("getGeneralSettings successful, result size: "+ list);
			return list;
		}
		catch(RuntimeException re) {
			_log.error("getGeneralSettings failed", re);
			throw re;
		}
}
	public void saveInvestorBalance(InvestorTransaction investorBalanceModel) {
		_log.debug("persisting InvestorBalance instance");
		try{
		Session session=sessionFactory.getCurrentSession();
		session.save(investorBalanceModel);
		_log.debug("persist successful"+investorBalanceModel);

		}catch(RuntimeException re) {
			_log.error("persist failed", re);
			throw re;
			
		}

	}
	public List<InvestorTransaction> getInvestorTransaction(long investorId) {
		_log.debug("Inside getInvestorTransaction ");
		try {			
			List<InvestorTransaction>  investorTransaction = (List<InvestorTransaction>) sessionFactory.getCurrentSession().createCriteria(InvestorTransaction.class).add(Restrictions.eq("investorID", investorId)).list();		
			return investorTransaction;
		} catch (RuntimeException re) {
			_log.error("getInvestorTransaction failed", re);
			throw re;
		}
	}
	
	@SuppressWarnings("unchecked")
	public List<InvestorTransaction> getInvestors(long investorId,int startIndex,int pageSize) {
		_log.debug("Inside getInvestors ");
		try {
			String type="Alloted";
			Criteria criteria=sessionFactory.getCurrentSession().createCriteria(InvestorTransaction.class);

			List<InvestorTransaction> results =(List<InvestorTransaction>) criteria
					.add(Restrictions.eq("investorID", investorId))
	                .add(Restrictions.ne("transcationType", type))
					.addOrder(Order.desc("transcationDate"))
					.setFirstResult(startIndex).setMaxResults(pageSize).list();
			
			
			
/*			List<InvestorTransaction> results = (List<InvestorTransaction>) sessionFactory.getCurrentSession().createCriteria(InvestorTransaction.class).add(Restrictions.eq("investorID", investorId)).setFirstResult(startIndex).setMaxResults(pageSize).list();
*/			_log.debug("getInvestors successful, result size: "
					+ results.size());
			return results;
		} catch (RuntimeException re) {
			_log.error("getInvestors failed", re);
			throw re;
		}
	}
	public Long getInvestorsCount(long investorId) {
		_log.debug("Inside getInvestorsCount ");
		try {
			
			Long resultCount = (Long) sessionFactory.getCurrentSession().createCriteria(InvestorTransaction.class).add(Restrictions.eq("investorID", investorId)).setProjection(Projections.rowCount()).uniqueResult();
			_log.debug("getInvestorsCount  "	+ resultCount);
			return resultCount;
		} catch (RuntimeException re) {
			_log.error("getInvestorsCount failed", re);
			throw re;
		}
	}
	public Long getInvestorsCounts(long investorId,String transactionType,Date frmDate,Date toDate) {
		_log.debug("Inside getInvestorsCount ");
		try {
			
			Criteria cr = sessionFactory.getCurrentSession().createCriteria(InvestorTransaction.class);
	        cr.add(Restrictions.eq("investorID", investorId));

			if(!StringUtils.isEmpty(transactionType)){
				_log.info("Transaction Type is " + transactionType);
				cr.add(Restrictions.eq("transcationType", transactionType));
			}
			if(!StringUtils.isEmpty(frmDate)){
				_log.info("From Date " + frmDate);
				cr.add(Restrictions.ge("transcationDate", frmDate));
	         }
			if(!StringUtils.isEmpty(toDate)){
				_log.info("To Date"+toDate);
				
				cr.add(Restrictions.le("transcationDate",toDate));
			}
			Long resultCount=(Long) cr.setProjection(Projections.rowCount()).uniqueResult();
					
					
			_log.debug("getInvestorsCount  "	+ resultCount);
			return resultCount;
		} catch (RuntimeException re) {
			_log.error("getInvestorsCount failed", re);
			throw re;
		}
	}
	
	@SuppressWarnings("unchecked")
	public List<InvestorTransaction> getInvestorTransactionByTransactionType(long investorId,String transactionType,Date frmDate,Date toDate,int startIndex,int pageSize){
		_log.debug("Inside getInvestorTransactionByTransactionType  ");
		List<InvestorTransaction> investorTransactionList=new ArrayList<InvestorTransaction>();
		
		try {
		Criteria cr = sessionFactory.getCurrentSession().createCriteria(InvestorTransaction.class);
        cr.add(Restrictions.eq("investorID", investorId));
		if(!StringUtils.isEmpty(transactionType)){
			_log.info("Transaction Type is " + transactionType);
			cr.add(Restrictions.eq("transcationType", transactionType));
         }
		
		if(!StringUtils.isEmpty(frmDate)){
			_log.info("From Date " + frmDate);
			cr.add(Restrictions.ge("transcationDate", frmDate));
         }
		if(!StringUtils.isEmpty(toDate)){
			_log.info("To Date"+toDate);
			
			cr.add(Restrictions.le("transcationDate",toDate));
		}
		
		investorTransactionList = cr.setFirstResult(startIndex).setMaxResults(pageSize).list();
	     _log.debug("getInvestorTransactionByTransactionType, result size: "
					+ investorTransactionList.size());
	     
       } catch (RuntimeException re) {
			_log.error("getInvestorTransactionByTransactionType failed", re);
			throw re;
		}
		
		return investorTransactionList;
	
	}
	
	@SuppressWarnings("unchecked")
	public List<InvestorPortfolio> getInvestorPortfolioId(long investorId) {
		_log.debug("Inside getInvestorPortfolioId  ");
		try{
			
			List<InvestorPortfolio> InvestorPortfolioList = (List<InvestorPortfolio>)sessionFactory.getCurrentSession().createCriteria(InvestorPortfolio.class).add(Restrictions.eq("investor.id", investorId)).list();

		_log.debug("getInvestorPortfolioId  "	+ InvestorPortfolioList);
		return InvestorPortfolioList;
	} catch (RuntimeException re) {
		_log.error("getInvestorPortfolioId failed", re);
		throw re;
	}
}
	public List<InvestorTransaction> getInvestorTransactionByTrade(long tradeID) {
		_log.debug("Inside getInvestorTransaction ");
		try {			
			List<InvestorTransaction>  investorTransaction = (List<InvestorTransaction>) sessionFactory.getCurrentSession().createCriteria(InvestorTransaction.class).add(Restrictions.eq("tradeID", tradeID)).list();		
			return investorTransaction;
		} catch (RuntimeException re) {
			_log.error("getInvestorTransaction failed", re);
			throw re;
		}
	}
	
}
