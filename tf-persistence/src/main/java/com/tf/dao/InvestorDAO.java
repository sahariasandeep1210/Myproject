package com.tf.dao;

import java.util.List;
import java.util.Map;

import com.tf.model.Investor;
import com.tf.model.InvestorPortfolio;
import com.tf.persistance.util.DashboardModel;

public interface InvestorDAO extends BaseDAO<InvestorPortfolio, Long> {
	
	public InvestorPortfolio  getInvestorByCompanyId(long id);
	
	public DashboardModel  getDashBoardInformation();
	
	public Map<Long,List<InvestorPortfolio>>  getInvestorPortfolioByUserId(long id);

	public void addInvestorPortfolios(List<InvestorPortfolio> investors,long investorId);

}
