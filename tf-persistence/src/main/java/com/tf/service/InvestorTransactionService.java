package com.tf.service;

import com.tf.model.InvestorTransaction;

import java.util.List;

public interface InvestorTransactionService {
	public void saveInvestorBalance(InvestorTransaction investorTransaction);
	public List<InvestorTransaction> getInvestorTransactions(); 
	public InvestorTransaction getInvestorTransaction(long investorId);
	public List<InvestorTransaction> getInvestors(Long investorId,int startIndex,int pageSize);
	public Long getInvestorsCount(Long investorId);
	
}
