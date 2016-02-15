package com.tf.service;

import com.tf.model.InvestorTransaction;

import java.util.List;

public interface InvestorTransactionService {
	public void saveInvestorBalance(InvestorTransaction investorBalanceModel);
	public List<InvestorTransaction> getInvestorTransactions(); }
