package com.tf.service;

import com.tf.model.InvestorTransaction;

import java.util.Date;
import java.util.List;

public interface InvestorTransactionService {
	public void saveInvestorBalance(InvestorTransaction investorBalanceModel);
	public List<InvestorTransaction> getInvestorTransactions(); 
	public List<InvestorTransaction> getInvestorTransaction(long investorId);
	public List<InvestorTransaction> getInvestors(Long investorId,int startIndex,int pageSize);
	public Long getInvestorsCount(Long investorId);
	public List<InvestorTransaction> getInvestorTransactionByTransactionType(long investorId,String transactionType,Date frmDate,Date toDate);	
}
