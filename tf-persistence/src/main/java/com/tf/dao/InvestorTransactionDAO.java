package com.tf.dao;

import com.tf.model.InvestorTransaction;

import java.util.Date;
import java.util.List;

public interface InvestorTransactionDAO extends BaseDAO<InvestorTransaction, Long> {
	public void saveInvestorBalance(InvestorTransaction investorBalanceModel);
	public List<InvestorTransaction> getInvestorTransactions() ;
	public List<InvestorTransaction> getInvestorTransaction(long investorId);
	public List<InvestorTransaction> getInvestors(long investorId,int startIndex,int pageSize);
	public Long getInvestorsCount(long investorId);
	public List<InvestorTransaction> getInvestorTransactionByTransactionType(long investorId,String transactionType,Date frmDate,Date toDate,int startIndex,int pageSize);
	public Long getInvestorsCounts(String transactionType,Date frmDate,Date toDate);
}
