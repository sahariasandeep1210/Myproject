package com.tf.dao;

import java.math.BigDecimal;
import java.text.ParseException;
import java.util.List;
import java.util.Map;

import com.tf.model.AllInvestorsBalanceSummary;
import com.tf.model.Investor;
import com.tf.model.InvestorPortfolio;
import com.tf.persistance.util.DashboardModel;
import com.tf.persistance.util.InvestorDTO;
import com.tf.persistance.util.InvestorProtfolioDTO;

public interface InvestorDAO extends BaseDAO<InvestorPortfolio, Long> {
	
	public InvestorPortfolio  getInvestorByCompanyId(long id);
	
	public DashboardModel  getDashBoardInformation(DashboardModel dasboardModel,Long scfCompanyID);
	
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
	
	public List<InvestorDTO> getInvestorDetails();

	public void updateInvestorDetails(List<InvestorDTO> investors);
	
	public BigDecimal  getWhiteHallShare(long id);
	
	public Map<String,BigDecimal>  getProtfolioTotals();	
	
	
	public Long getInvestorIDByCompanyId(long companyId);
	
	public Investor findByInvestorId(long id);
	
	public void updateInvestor(Investor investor);	
	
	
	public List<Investor> getCashPoition();
	
	public List<Object[]> getInvestorPortfolioDataForGraph(Long scfCompanyId);
	
	public Long getInvestorCount() ;
	
	public List<Investor> getInvestorsByCashPosition() ;
	
	public BigDecimal getTotalCreditAvailForGraph(long scfCompanyId);
	
	public List<Object[]> getInvestorPortfolioDataForInvestorGraph(Long investorID);
	
	public BigDecimal getTotalCreditAvailForInvestorGraph(Long investorID);
	
	public List<Object[]> getCreditAvailForSCFCompany(Long companyId);
	
	public List<Object[]> getAllScfCompaniesFromInvestorPortfolio();
	
	public List<AllInvestorsBalanceSummary> getAllInvestorSCFBalanceSummary( String search, int startIndex, int pageSize, String columnName, String order )throws ParseException;
	public Map<String,Long>getAllInvestorsBalanceTotalValues()throws ParseException ;
	public List<AllInvestorsBalanceSummary> getAllInvestorsBalanceSummary(String search, int indexPage, int pageSize, String order,String Column) throws ParseException ;

	public Map<String,Long>getAllInvestorsSCFTotalValues()throws ParseException;
}
