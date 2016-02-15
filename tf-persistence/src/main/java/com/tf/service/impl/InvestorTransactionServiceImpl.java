package com.tf.service.impl;

import com.tf.dao.InvestorTransactionDAO;
import com.tf.model.InvestorTransaction;
import com.tf.service.InvestorTransactionService;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class InvestorTransactionServiceImpl implements InvestorTransactionService {
	
	@Autowired
	private InvestorTransactionDAO investorTransactionDAO; 

	public void saveInvestorBalance(InvestorTransaction investorBalanceModel){
		 investorTransactionDAO.saveInvestorBalance(investorBalanceModel);
	}
	public List<InvestorTransaction> getInvestorTransactions() {
		return investorTransactionDAO.getInvestorTransactions();
	}
}
