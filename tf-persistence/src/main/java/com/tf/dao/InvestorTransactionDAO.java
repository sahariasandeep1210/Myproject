package com.tf.dao;

import com.tf.model.InvestorTransaction;

import java.util.List;

public interface InvestorTransactionDAO extends BaseDAO<InvestorTransaction, Long> {
	public void saveInvestorBalance(InvestorTransaction investorTransaction);
	public List<InvestorTransaction> getInvestorTransactions() ;
	public InvestorTransaction getInvestorTransaction(long investorId);
}
