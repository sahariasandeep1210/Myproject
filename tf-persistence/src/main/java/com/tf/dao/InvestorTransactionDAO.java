package com.tf.dao;

import com.tf.model.InvestorTransaction;

public interface InvestorTransactionDAO extends BaseDAO<InvestorTransaction, Long> {
	public void saveInvestorBalance(InvestorTransaction investorBalanceModel);
}
