package com.tf.dao;

import com.tf.model.InvestorPortfolio;

public interface InvestorDAO extends BaseDAO<InvestorPortfolio, Long> {
	
	public InvestorPortfolio  getInvestorByCompanyId(long id) ;

}
