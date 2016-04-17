package com.tf.service;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;

import com.tf.model.Investor;
import com.tf.model.InvestorPortfolio;
import com.tf.persistance.util.DashboardModel;
import com.tf.persistance.util.InvestorDTO;

public interface InvestorService {
	
	public void save(InvestorPortfolio investor);
	
	public InvestorPortfolio  getInvestorByCompanyId(long id) ;
	
	public InvestorPortfolio findById(long id);
	
	public void updatePortfiloDetails(InvestorPortfolio investorActual,InvestorPortfolio investorChnaged,String username);
	
	public DashboardModel  getDashBoardInformation();
	
	public Map<Long,List<InvestorPortfolio>>  getInvestorPortfolioByUserId(long id);
	
	public void addInvestorPortfolios(List<InvestorPortfolio> invoices,long investorId);
	
	public void updateInvestorPortfolios(List<InvestorPortfolio> investors,long investorId);
	
	public Map<String,BigDecimal>  getProtfolioTotals(long id) ;
	
	public Map<Long,BigDecimal>  findTotalCreditLine(long investorID);
	
	public 	List<InvestorPortfolio>  findTotalCreditLineBreakDown(long scfCompany);
	
	public 	List<InvestorPortfolio>  findAllInvestorProtFolios();
	
	public List<InvestorDTO> getInvestorDetails();
	
	public void updateInvestorDetails(List<InvestorDTO> investors); 
	
	public BigDecimal  getWhiteHallShare(long id);
	
	public Map<String,BigDecimal>  getProtfolioTotals();
	
	public Long getInvestorIDByCompanyId(long companyId);
	
	public Investor findByInvestorId(long id);
	
	public List<Investor> getCashPoition();
	
	public List<InvestorPortfolio> getInvestorPortfolioDataForGraph(Long scfCompanyId);

}
