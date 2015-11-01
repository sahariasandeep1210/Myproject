package com.tf.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tf.dao.InvestorHistoryDAO;
import com.tf.model.InvestorPortfolioHistory;
import com.tf.service.InvestorHistoryService;


@Service
public class InvestorHistoryServiceImpl implements InvestorHistoryService {
	
	@Autowired
	private InvestorHistoryDAO investorHistoryDAO;
	
	public void save(InvestorPortfolioHistory investorHistory){
		investorHistoryDAO.saveEntity(investorHistory);
	}
	
	public List<InvestorPortfolioHistory> getInvestorHistory(long investorID){
		return investorHistoryDAO.getInvestorHistory(investorID);
	}

}
