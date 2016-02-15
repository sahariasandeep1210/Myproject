package com.tf.dao;

import com.tf.model.InvestorTransaction;

import java.util.List;

public interface InvestorTransactionDAO extends BaseDAO<InvestorTransaction, Long> {
	public void saveInvestorBalance(InvestorTransaction investorBalanceModel);
	public List<InvestorTransaction> getInvestorTransactions() ;
}
