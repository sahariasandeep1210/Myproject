package com.tf.dao;

import java.util.List;

import com.tf.model.InvestorPortfolioHistory;

public interface InvestorHistoryDAO extends BaseDAO<InvestorPortfolioHistory, Long>  {
	
	public List<InvestorPortfolioHistory> getInvestorHistory(long investorID);

}
