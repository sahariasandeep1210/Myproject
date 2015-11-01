package com.tf.service;

import java.util.List;

import com.tf.model.InvestorPortfolioHistory;

public interface InvestorHistoryService {
	
	public void save(InvestorPortfolioHistory investorHistory);
	
	public List<InvestorPortfolioHistory> getInvestorHistory(long investorID);

}
