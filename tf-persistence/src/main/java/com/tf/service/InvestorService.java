package com.tf.service;

import com.tf.model.InvestorPortfolio;
import com.tf.persistance.util.DashboardModel;

public interface InvestorService {
	
	public void save(InvestorPortfolio investor);
	
	public InvestorPortfolio  getInvestorByCompanyId(long id) ;
	
	public InvestorPortfolio findById(long id);
	
	public void updatePortfiloDetails(InvestorPortfolio investorActual,InvestorPortfolio investorChnaged,String username);
	
	public DashboardModel  getDashBoardInformation();

}
