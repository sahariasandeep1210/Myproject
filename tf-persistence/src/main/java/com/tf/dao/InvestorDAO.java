package com.tf.dao;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;

import com.tf.model.InvestorPortfolio;
import com.tf.persistance.util.DashboardModel;
import com.tf.persistance.util.InvestorProtfolioDTO;

public interface InvestorDAO extends BaseDAO<InvestorPortfolio, Long> {
	
	public InvestorPortfolio  getInvestorByCompanyId(long id);
	
	public DashboardModel  getDashBoardInformation();
	
	public Map<Long,List<InvestorPortfolio>>  getInvestorPortfolioByUserId(long id);

	public void addInvestorPortfolios(List<InvestorPortfolio> investors,long investorId);
	
	public void updateInvestorPortfolios(List<InvestorPortfolio> investors,long investorId);
	
	public Map<String,BigDecimal>  getProtfolioTotals(long id);
	
	public List<Long> getInvestorsScfCompanies(long investorID);
	
	public InvestorPortfolio getInvestorProtfolio(long investorID,long scfCompany);
	
	public Map<Long,BigDecimal>  findTotalCreditLine(long investorID);
	
	public 	List<InvestorPortfolio>  findTotalCreditLineBreakDown(long scfCompany);
	
	public List<InvestorProtfolioDTO> findInvestorByRate(long comapanyId);
	
	public InvestorPortfolio  loadInvestorPortfolio(long protfolioID);
	
	public 	List<InvestorPortfolio>  findAllInvestorProtFolios();

}
