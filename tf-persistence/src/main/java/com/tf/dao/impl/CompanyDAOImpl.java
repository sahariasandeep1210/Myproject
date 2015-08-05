package com.tf.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.tf.dao.CompanyDAO;
import com.tf.model.Company;


@Repository
public class CompanyDAOImpl  extends BaseDAO implements CompanyDAO{
	
	@SuppressWarnings("unchecked")
	public List<Company> getCompanies() {
		_log.debug("Inside getCompanies ");
		try {
			
			List<Company> results = (List<Company>) sessionFactory.getCurrentSession().createQuery("from Company").list();;
			_log.debug("GetCompanies successful, result size: "
					+ results.size());
			return results;
		} catch (RuntimeException re) {
			_log.error("GetCompanies failed", re);
			throw re;
		}
	}
	
	public void addCompany(Company company) {
		_log.debug("persisting Company instance");
		try {
			sessionFactory.getCurrentSession().saveOrUpdate(company);
			_log.debug("persist successful"+company);
		} catch (RuntimeException re) {
			_log.error("persist failed", re);
			throw re;
		}
	}
	
	public Company findById(long id) {
		_log.debug("getting Pizza instance with id: " + id);
		try {
			Company instance = (Company) sessionFactory.getCurrentSession().get(
					"com.tf.model.Company", id);
			if (instance == null) {
				_log.debug("get successful, no instance found");
			} else {
				_log.debug("get successful, instance found");
			}
			return instance;
		} catch (RuntimeException re) {
			_log.error("get failed", re);
			throw re;
		}
	}


}
