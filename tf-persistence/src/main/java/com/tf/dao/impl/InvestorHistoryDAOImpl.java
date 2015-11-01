package com.tf.dao.impl;

import java.util.List;

import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.tf.dao.InvestorHistoryDAO;
import com.tf.model.InvestorPortfolioHistory;

@Repository
@Transactional
public class InvestorHistoryDAOImpl extends BaseDAOImpl<InvestorPortfolioHistory, Long>   implements InvestorHistoryDAO{
	
	@SuppressWarnings("unchecked")
	public List<InvestorPortfolioHistory> getInvestorHistory(long investorID) {
		_log.debug("Inside getCompanies ");
		try {
			
			List<InvestorPortfolioHistory> results = (List<InvestorPortfolioHistory>) sessionFactory.getCurrentSession().createCriteria(InvestorPortfolioHistory.class).add(Restrictions.eq("investorPortfolio.investorId", investorID)).list();
			_log.debug("getInvestorHistory successful, result size: "
					+ results.size());
			return results;
		} catch (RuntimeException re) {
			_log.error("getInvestorHistory failed", re);
			throw re;
		}
	}

}
