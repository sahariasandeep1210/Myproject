package com.tf.dao.impl;

import com.tf.dao.InvestorTransactionDAO;
import com.tf.dao.impl.BaseDAOImpl;
import com.tf.model.GeneralSetting;
import com.tf.model.InvestorTransaction;
import com.tf.model.SCFTrade;
import com.tf.model.SellerSetting;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

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
	public void saveInvestorBalance(InvestorTransaction investorTransaction) {
		_log.debug("persisting InvestorBalance instance");
		try{
		Session session=sessionFactory.getCurrentSession();
		session.saveOrUpdate(investorTransaction);
		_log.debug("persist successful"+investorTransaction);

		}catch(RuntimeException re) {
			_log.error("persist failed", re);
			throw re;
			
		}

	}
	public InvestorTransaction getInvestorTransaction(long investorId) {
		_log.debug("Inside getInvestorTransaction ");
		try {			
			InvestorTransaction investorTransaction = (InvestorTransaction) sessionFactory.getCurrentSession().createCriteria(InvestorTransaction.class).add(Restrictions.eq("investorID", investorId)).uniqueResult();		
			return investorTransaction;
		} catch (RuntimeException re) {
			_log.error("getInvestorTransaction failed", re);
			throw re;
		}
	}
	
	@SuppressWarnings("unchecked")
	public List<InvestorTransaction> getInvestors(Long investorId,int startIndex,int pageSize) {
		_log.debug("Inside getInvestors ");
		try {
			
			List<InvestorTransaction> results = (List<InvestorTransaction>) sessionFactory.getCurrentSession().createCriteria(InvestorTransaction.class).add(Restrictions.ne("investorID", investorId)).setFirstResult(startIndex).setMaxResults(pageSize).list();
			_log.debug("getInvestors successful, result size: "
					+ results.size());
			return results;
		} catch (RuntimeException re) {
			_log.error("getInvestors failed", re);
			throw re;
		}
	}
	public Long getInvestorsCount(Long investorId) {
		_log.debug("Inside getInvestorsCount ");
		try {
			
			Long resultCount = (Long) sessionFactory.getCurrentSession().createCriteria(InvestorTransaction.class).add(Restrictions.ne("investorID", investorId)).setProjection(Projections.rowCount()).uniqueResult();
			_log.debug("getInvestorsCount  "	+ resultCount);
			return resultCount;
		} catch (RuntimeException re) {
			_log.error("getInvestorsCount failed", re);
			throw re;
		}
	}
	
}
