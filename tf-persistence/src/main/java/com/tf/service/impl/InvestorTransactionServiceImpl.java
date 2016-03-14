package com.tf.service.impl;

import com.tf.dao.InvestorDAO;
import com.tf.dao.InvestorTransactionDAO;
import com.tf.model.Investor;
import com.tf.model.InvestorPortfolio;
import com.tf.model.InvestorTransaction;
import com.tf.persistance.util.TranscationStatus;
import com.tf.service.InvestorTransactionService;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class InvestorTransactionServiceImpl implements InvestorTransactionService {
	
	@Autowired
	private InvestorTransactionDAO investorTransactionDAO; 
	
	@Autowired
	private InvestorDAO investorDAO; 

	public void saveInvestorBalance(InvestorTransaction investorBalanceModel){
		if(TranscationStatus.DEPOSIT.getValue().equals(investorBalanceModel.getTranscationType())){
			Investor inv=investorDAO.findByInvestorId(investorBalanceModel.getInvestorID());
			inv.setCashPosition(inv.getCashPosition()!=null?inv.getCashPosition().add(investorBalanceModel.getAmount()) :investorBalanceModel.getAmount());
			investorDAO.updateInvestor(inv);
		}else if(TranscationStatus.WITHDRAWAL.getValue().equals(investorBalanceModel.getTranscationType())){
			Investor inv=investorDAO.findByInvestorId(investorBalanceModel.getInvestorID());
			inv.setCashPosition(inv.getCashPosition()!=null?inv.getCashPosition().subtract(investorBalanceModel.getAmount()) :investorBalanceModel.getAmount());
			investorDAO.updateInvestor(inv);
		}
		 investorTransactionDAO.saveInvestorBalance(investorBalanceModel);
	}
	
	public List<InvestorTransaction> getInvestorTransactions() {
		return investorTransactionDAO.getInvestorTransactions();
	}
	
	public List<InvestorTransaction> getInvestorTransaction(long investorId){
		return investorTransactionDAO.getInvestorTransaction(investorId);
	}
	
	public List<InvestorTransaction> getInvestors(long investorId,int startIndex,int pageSize){
		return investorTransactionDAO.getInvestors(investorId, startIndex, pageSize);
	}
	
	public Long getInvestorsCount(long investorId){
		return investorTransactionDAO.getInvestorsCount(investorId);
	}
	
	public List<InvestorTransaction> getInvestorTransactionByTransactionType(long investorId,String transactionType,Date frmDate,Date toDate,int startIndex,int pageSize){
		return investorTransactionDAO.getInvestorTransactionByTransactionType(investorId, transactionType, frmDate, toDate, startIndex, pageSize);
	}
	
	public Long getInvestorsCounts(long investorId,String transactionType,Date frmDate,Date toDate){
		return investorTransactionDAO.getInvestorsCounts(investorId,transactionType, frmDate, toDate);
	}
	
	public List<InvestorPortfolio> getInvestorPortfolioId(long investorId){
		return investorTransactionDAO.getInvestorPortfolioId(investorId);
	}
}
