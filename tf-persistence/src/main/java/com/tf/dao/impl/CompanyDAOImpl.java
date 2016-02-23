package com.tf.dao.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import org.hibernate.Query;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.hibernate.transform.Transformers;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.tf.dao.CompanyDAO;
import com.tf.model.Company;
import com.tf.model.User;
import com.tf.persistance.util.CompanyStatus;
import com.tf.persistance.util.InvestorDTO;


@Repository
@Transactional
public class CompanyDAOImpl  extends BaseDAOImpl<Company, Long>   implements CompanyDAO {
	
	
	public CompanyDAOImpl() {
		super(Company.class);
	}
	
	@SuppressWarnings("unchecked")
	public List<Company> getCompaniesByStatus(String status,int startIndex,int pageSize) {
		_log.debug("Inside getCompanies ");
		try {
			
			List<Company> results = (List<Company>) sessionFactory.getCurrentSession().createCriteria(Company.class).add(Restrictions.ne("activestatus", status)).setFirstResult(startIndex).setMaxResults(pageSize).list();
			_log.debug("GetCompanies successful, result size: "
					+ results.size());
			return results;
		} catch (RuntimeException re) {
			_log.error("GetCompanies failed", re);
			throw re;
		}
	}
	
	@SuppressWarnings("unchecked")
	public Long getCompaniesCount(String status) {
		_log.debug("Inside getCompanies ");
		try {
			
			Long resultCount = (Long) sessionFactory.getCurrentSession().createCriteria(Company.class).add(Restrictions.ne("activestatus", status)).setProjection(Projections.rowCount()).uniqueResult();
			_log.info("Companies Count:: "	+ resultCount);
			return resultCount;
		} catch (RuntimeException re) {
			_log.error("Companies Count failed", re);
			throw re;
		}
	}
	
	
	
	public List<Company> getCompaniesByStatus(String status,long companyId){
		_log.debug("Inside getCompanies ");
		try {
			
			List<Company> results = (List<Company>) sessionFactory.getCurrentSession().createCriteria(Company.class)
					.add(Restrictions.ne("activestatus", status))
					.add(Restrictions.eq("id", companyId)).list();
			_log.debug("GetCompanies successful, result size: "
					+ results.size());
			return results;
		} catch (RuntimeException re) {
			_log.error("GetCompanies failed", re);
			throw re;
		}
	}
	
	@SuppressWarnings("unchecked")
	public List<Company> getCompanies(String companyType) {
		_log.debug("Inside getCompanies ");
		try {
			
			List<Company> results = (List<Company>) sessionFactory.getCurrentSession().createCriteria(Company.class)
				   .setProjection(Projections.projectionList()
				   .add(Projections.property("id"), "id")
				   .add(Projections.property("name"), "name"))
				   .add(Restrictions.eq("companyType", companyType))
				   .setResultTransformer(Transformers.aliasToBean(Company.class)).list();
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
			company.getAddress().setCompany(company);
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
			Company company=findByCompanyId(id);
			company.setActivestatus(CompanyStatus.DELETED.getValue());
			 Set<User> users=company.getUsers();
			 for(User user : users){
				 user.setActive(Boolean.FALSE);
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
	
	private Company findByCompanyId(Long id) {
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
	
	public Company  loadCompanyId(long id){
		try{
		Company company =(Company)sessionFactory.getCurrentSession().load("com.tf.model.Company", id); 
		if (company == null) {
			_log.debug("get successful, no company found");
		} else {
			_log.debug("get successful, company found");
		}
		return company;	
	} catch (RuntimeException re) {
		_log.error("get failed", re);
		throw re;
	}
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
	
	
	public List<Company> getCompaniesById(Long id){		
		_log.debug("Inside getCompaniesById ");
		try {
			
			List<Company>  results = (List<Company>) sessionFactory.getCurrentSession().createCriteria(Company.class).add(Restrictions.eq("id", id)).list();
			_log.debug("getCompaniesById successful, result size: "
					+ results.size());
			return results;
		} catch (RuntimeException re) {
			_log.error("getCompaniesById failed", re);
			throw re;
		}
		
	}
	@SuppressWarnings("unchecked")
	public List<InvestorDTO> getInvestors(){
		_log.debug("Inside getInvestors  ");
		List<InvestorDTO> investors=new ArrayList<InvestorDTO>();
		InvestorDTO investorDTO;
		List<Object[]> rows=new ArrayList<Object[]>();      
		try{
			String sql="select  inv.investor_id, company.name from  tf_investor inv ,tf_company company where inv.company_id=company.idcompany";
			Query query = sessionFactory.getCurrentSession().createSQLQuery(sql);
		    rows=query.list();
		    for(Object[] row : rows){
		    	 investorDTO=new InvestorDTO();
		    	 investorDTO.setInvestorID(Long.valueOf(row[0].toString()));
		    	 investorDTO.setName(row[1].toString());
		    	 investors.add(investorDTO);
		     }
		_log.debug("getInvestors successful, result size: "
				+ investors.size());
		return investors;
	} catch (RuntimeException re) {
		_log.error("getInvestors failed", re);
		throw re;
	}
	}

}
