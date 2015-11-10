package com.tf.service;

import java.util.List;
import java.util.Map;

import com.tf.model.InvestorPortfolio;
import com.tf.persistance.util.DashboardModel;

public interface InvestorService {
	
	public void save(InvestorPortfolio investor);
	
	public InvestorPortfolio  getInvestorByCompanyId(long id) ;
	
	public InvestorPortfolio findById(long id);
	
	public void updatePortfiloDetails(InvestorPortfolio investorActual,InvestorPortfolio investorChnaged,String username);
	
	public DashboardModel  getDashBoardInformation();
	
	public Map<Long,List<InvestorPortfolio>>  getInvestorPortfolioByUserId(long id);
	
	public void addInvestorPortfolios(List<InvestorPortfolio> invoices,long investorId);

}
