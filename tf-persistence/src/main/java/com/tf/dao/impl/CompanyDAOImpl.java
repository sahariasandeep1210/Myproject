package com.tf.dao.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.tf.dao.CompanyDAO;
import com.tf.model.Company;
import com.tf.model.User;
import com.tf.persistance.util.CompanyStatus;
import com.tf.persistance.util.WorkflowConstants;


@Repository
@Transactional
public class CompanyDAOImpl  extends BaseDAOImpl<Company, Long>   implements CompanyDAO{
	
	@SuppressWarnings("unchecked")

	public List<Company> getCompanies(Integer status) {
		_log.debug("Inside getCompanies ");
		try {
			
			List<Company> results = (List<Company>) sessionFactory.getCurrentSession().createCriteria(Company.class).add(Restrictions.ne("activestatus", status)).list();
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
	
	public List<Long> deleteCompany(Long id) {
		_log.debug("persisting Company instance");
		List<Long> liferayUserIds=new ArrayList<Long>();
		try {
			Company company=findById(id);
			company.setActivestatus(CompanyStatus.DELETED.getValue());
			 Set<User> users=company.getUsers();
			 for(User user : users){
				 user.setActive(WorkflowConstants.STATUS_INACTIVE);
				 liferayUserIds.add(user.getLiferayUserId());
			 }
			sessionFactory.getCurrentSession().saveOrUpdate(company);
			_log.debug("persist successful"+company);
		} catch (RuntimeException re) {
			_log.error("persist failed", re);
			throw re;
		}
		return liferayUserIds;
	}
	
	public Company registerCompany(Company company) {
		_log.debug("persisting Company instance");
		try {
			long id=(Long) sessionFactory.getCurrentSession().save(company);
			company.setId(id);
			_log.debug("persist successful"+company);
		} catch (RuntimeException re) {
			_log.error("persist failed", re);
			throw re;
		}
		return company;
	}
	
	public Company findById(long id) {
		_log.debug("getting User instance with id: " + id);
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
	

	public String  getCompanyTypebyID(long id) {
		_log.debug("getting User instance with id: " + id);
		String companyType="";
		try {
			if(id!=0){
				
				companyType = (String) sessionFactory.getCurrentSession().createQuery("select cmp.companyType from Company cmp where cmp.id = :id").setLong("id",id).uniqueResult();
				if (companyType == null) {
					_log.debug("get successful, no instance found");
				} else {
					_log.debug("get successful, instance found");
				}
			}
			return companyType;
		} catch (RuntimeException re) {
			_log.error("get failed", re);
			throw re;
		}
	}


}
