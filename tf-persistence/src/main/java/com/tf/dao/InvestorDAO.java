package com.tf.dao;

import com.tf.model.InvestorPortfolio;
import com.tf.persistance.util.DashboardModel;

public interface InvestorDAO extends BaseDAO<InvestorPortfolio, Long> {
	
	public InvestorPortfolio  getInvestorByCompanyId(long id);
	
	public DashboardModel  getDashBoardInformation();

}
