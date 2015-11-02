package com.tf.service.impl;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tf.dao.InvestorDAO;
import com.tf.dao.InvestorHistoryDAO;
import com.tf.model.InvestorPortfolio;
import com.tf.model.InvestorPortfolioHistory;
import com.tf.persistance.util.DashboardModel;
import com.tf.service.InvestorService;

@Service
@Transactional
public class InvestorServiceImpl implements InvestorService {
	
	@Autowired
	private InvestorDAO investorDAO;
	
	@Autowired
	private InvestorHistoryDAO investorHistoryDAO;
	
	public void save(InvestorPortfolio investor){
		investorDAO.saveEntity(investor);
	}
	
	public InvestorPortfolio  getInvestorByCompanyId(long id) {
		return investorDAO.getInvestorByCompanyId(id);
	}
	
	public InvestorPortfolio findById(long id){
		return investorDAO.findById(id);
	}

	public void updatePortfiloDetails(InvestorPortfolio investor,InvestorPortfolio investorModel,String userName) {
		
		Date currentDate =new Date();
		System.out.println("Current Date"+currentDate);
		//adding history
		InvestorPortfolioHistory investorHistory =new InvestorPortfolioHistory();
		investorHistory.setInvestorPortfolio(investor);
		investorHistory.setDiscountRate(investor.getDiscountRate());
		investorHistory.setInvestmentCap(investor.getInvestmentCap());
		investorHistory.setStartDate(investor.getStartDate());
		investorHistory.setEndDate(currentDate);
		investorHistory.setUpdatedBy(userName);
		investorHistoryDAO.saveEntity(investorHistory);
		
		//updating investor Portfolio
		investor.setDiscountRate(investorModel.getDiscountRate());
		investor.setInvestmentCap(investorModel.getInvestmentCap());
		investor.setStartDate(currentDate);
		investorDAO.update(investor);
		
	}
	
	public DashboardModel  getDashBoardInformation(){
		return investorDAO.getDashBoardInformation();
	}

}
