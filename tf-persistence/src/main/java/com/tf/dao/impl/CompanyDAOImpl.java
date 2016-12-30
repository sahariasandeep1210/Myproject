package com.tf.dao.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Disjunction;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.hibernate.transform.Transformers;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.tf.dao.CompanyDAO;
import com.tf.model.Company;
import com.tf.model.Invoice;
import com.tf.model.User;
import com.tf.persistance.util.CompanyStatus;
import com.tf.persistance.util.InvestorDTO;


@Repository
@Transactional
public class CompanyDAOImpl  extends BaseDAOImpl<Company, Long>   implements CompanyDAO {
	
	
	public CompanyDAOImpl() {
		super(Company.class);
	}
	
	@SuppressWarnings({ "unchecked", "unused" })
	public List<Company> getCompaniesByStatus(String status,int startIndex,int pageSize) {
		_log.debug("Inside getCompanies ");
		try {
			List<Company>	 results = (List<Company>) sessionFactory.getCurrentSession().createCriteria(Company.class).add(Restrictions.ne("activestatus", status)).setFirstResult(startIndex).setMaxResults(pageSize).list();
			_log.debug("GetCompanies successful, result size: "
					+ results.size());
			return results;
		} catch (RuntimeException re) {
			_log.error("GetCompanies failed", re);
			throw re;
		}
	}
	
	
	@SuppressWarnings("unchecked")
	 public List<Company> getCompaniesByStatusFilter(String status,
	   int startIndex, int pageSize, String searchValue) {
	  _log.debug("Inside getCompanies ");
	  List<Company>	 results = null;
	  try {
		  
	      DetachedCriteria criteria = DetachedCriteria.forClass(Company.class); 
	      Disjunction or = Restrictions.disjunction();
	      
		       or.add(Restrictions.like("regNumber",searchValue,MatchMode.ANYWHERE));
		       or.add(Restrictions.like("name", searchValue, MatchMode.ANYWHERE));
	   
	     results = (List<Company>) criteria.getExecutableCriteria(sessionFactory.getCurrentSession()).add(or).setFirstResult(startIndex).setMaxResults(pageSize).list();
		 /* if(searchValue.matches("[0-9]+") == true){
			   results = (List<Company>) sessionFactory.getCurrentSession().createQuery("from Company c where c.regNumber like :"+searchValue+"").setFirstResult(startIndex).setMaxResults(pageSize).list(); 
		  }else{
			  results = (List<Company>) sessionFactory.getCurrentSession().createQuery("from Company c where c.name like :"+searchValue+"").setFirstResult(startIndex).setMaxResults(pageSize).list();
		  }*/
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
	
	
	
	@SuppressWarnings("unchecked")
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
				   .add(Restrictions.ne("activestatus", CompanyStatus.DELETED.getValue()))
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
	
	
	
	@SuppressWarnings("unchecked")
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
			String sql="select  inv.investor_id, company.name from  tf_investor inv ,tf_company company where inv.company_id=company.idcompany and  company.active_status !=:cmpStatus";
			Query query = sessionFactory.getCurrentSession().createSQLQuery(sql).setString("cmpStatus", CompanyStatus.DELETED.getValue());
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
	
	public Company getCompaniesByRegNum(String RegNum){
		try{
			Company company = (Company)sessionFactory.getCurrentSession().createCriteria(Company.class).add(Restrictions.eq("regNumber", RegNum)).uniqueResult();
		_log.debug("getCompaniesByRegNum successful, result size: "
				+ company);
		return company;

	} catch (RuntimeException re) {
		_log.error("getCompaniesByRegNum failed", re);
		throw re;
	 }
	}
	public Company getCompaniesByName(String name){
		try{
			Company company = (Company)sessionFactory.getCurrentSession().createCriteria(Company.class).add(Restrictions.eq("name", name)).uniqueResult();
		_log.debug("getCompaniesByName successful, result size: "
				+ company);
		return company;

	} catch (RuntimeException re) {
		_log.error("getCompaniesByName failed", re);
		throw re;
	 }
	}
	
	public long validateCompanyName(Company cmp){
		
		Long resultCount;
		try {
			resultCount =
				(Long) sessionFactory.getCurrentSession().createCriteria(Company.class).add(Restrictions.eq("name", cmp.getName())).setProjection(
					Projections.rowCount()).uniqueResult();
			_log.info("Companies Count:: " + resultCount);
		}
		catch (Exception e) {
			resultCount=0l;
		}
		return resultCount;
		
	}
	
	public long validateCompanyRegNo(Company cmp){
		
		Long resultCount;
		try {
			resultCount =
				(Long) sessionFactory.getCurrentSession().createCriteria(Company.class).add(Restrictions.eq("regNumber", cmp.getRegNumber())).setProjection(
					Projections.rowCount()).uniqueResult();
			_log.info("Companies Count:: " + resultCount);
		}
		catch (Exception e) {
			resultCount=0l;
		}
		return resultCount;
		
	}

	@SuppressWarnings("unchecked")
	public List<Company> getSellerCompanies(String companyType) {
		_log.debug("Inside getSellerCompanies ");
		try {

			List<Company> results = (List<Company>) sessionFactory
					.getCurrentSession()
					.createCriteria(Company.class)
					.setProjection(
							Projections.projectionList()
									.add(Projections.property("id"), "id")
									.add(Projections.property("name"), "name")
									.add(Projections.property("regNumber"), "regNumber"))
					.add(Restrictions.eq("companyType", companyType))
					.add(Restrictions.ne("activestatus", CompanyStatus.DELETED.getValue()))
					.setResultTransformer(
							Transformers.aliasToBean(Company.class)).list();
			_log.debug("GetCompanies successful, result size: "
					+ results.size());
			return results;
		} catch (RuntimeException re) {
			_log.error("getSellerCompanies failed", re);
			throw re;
		}
	}
	
	@SuppressWarnings("unchecked")
	public List<Company> getSellerCompaniesUsingJoin(String companyType,long scfCcompany) {
		_log.debug("Inside getSellerCompanies ");
		try {
			StringBuilder sb = new StringBuilder();
			List<Company> results = new ArrayList<Company>();
			sb.append("SELECT idcompany,NAME,regnumber FROM tf_company tf INNER JOIN tf_seller_scfcompany_mapping tfs ON tf.idcompany = tfs.seller_company");
			sb.append(" WHERE tf.company_type ='" + companyType+"' AND tf.active_status <> '"+ CompanyStatus.DELETED.getValue()+ "' AND tfs.scf_company ='" + scfCcompany + "'");
			SQLQuery query = (SQLQuery) sessionFactory.getCurrentSession()
					.createSQLQuery(sb.toString());
			query.setResultTransformer(Criteria.ALIAS_TO_ENTITY_MAP);
			List data = query.list();
			if (null != data || data.size() > 0) {
				for (Object companyObj : data) {
					Map row = (Map) companyObj;
					Company company = new Company();
					company.setId(Long.parseLong(row.get("idcompany")
							.toString()));
					company.setName(row.get("NAME").toString());
					company.setRegNumber(row.get("regnumber").toString());
					results.add(company);
				}
			}

			_log.debug("GetCompanies successful, result size: "
					+ results.size());
			return results;
		} catch (RuntimeException re) {
			_log.error("getSellerCompanies failed", re);
			throw re;
		}
	}

}
