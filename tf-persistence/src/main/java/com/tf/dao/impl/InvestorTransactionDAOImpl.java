package com.tf.dao.impl;

import com.tf.dao.InvestorTransactionDAO;
import com.tf.dao.impl.BaseDAOImpl;
import com.tf.model.InvestorTransaction;

import org.hibernate.Session;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
@Transactional
public class InvestorTransactionDAOImpl extends BaseDAOImpl<InvestorTransaction, Long>   implements InvestorTransactionDAO {

	public InvestorTransactionDAOImpl(){
		super(InvestorTransaction.class);
	}
	
	public void saveInvestorBalance(InvestorTransaction investorBalanceModel) {
		_log.debug("persisting InvestorBalance instance");
		try{
		Session session=sessionFactory.getCurrentSession();
		session.saveOrUpdate(investorBalanceModel);
		_log.debug("persist successful"+investorBalanceModel);

		}catch(RuntimeException re) {
			_log.error("persist failed", re);
			throw re;
			
		}

	}
	
}
