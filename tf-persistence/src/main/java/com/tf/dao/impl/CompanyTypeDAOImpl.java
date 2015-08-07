package com.tf.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.tf.dao.CompanyTypeDAO;
import com.tf.model.CompanyType;


@Repository
public class CompanyTypeDAOImpl  extends BaseDAO implements CompanyTypeDAO{
	
	@SuppressWarnings("unchecked")
	@Transactional
	public List<CompanyType> getAllCompanyType() {
		_log.debug("Inside get Companies Type");
		try {
			
			List<CompanyType> results = (List<CompanyType>) sessionFactory.getCurrentSession().createQuery("from CompanyType").list();;
			_log.debug("GetCompanies Type successful, result size: "
					+ results.size());
			return results;
		} catch (RuntimeException re) {
			_log.error("GetCompanies type failed", re);
			throw re;
		}
	}

}
