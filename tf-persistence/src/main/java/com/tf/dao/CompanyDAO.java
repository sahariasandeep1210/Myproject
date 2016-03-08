package com.tf.dao;

import java.util.List;

import com.tf.model.Company;
import com.tf.persistance.util.InvestorDTO;

public interface CompanyDAO extends BaseDAO<Company, Long>{
	
	public List<Company> getCompaniesByStatus(String status,int startIndex,int pageSize);
	
	public List<Company> getCompaniesByStatus(String status,long companyId);
	
	public void addCompany(Company company);
	
	public Company findById(long id);
	
	public String  getCompanyTypebyID(long id);
	
	public Company registerCompany(Company company);
	public Company getCompaniesByRegNum(String RegNum);
	public List<Long> deleteCompany(Long id);
	
	public List<Company> getCompanies(String companyType);
	
	public Long getCompaniesCount(String status);
	
	public Company  loadCompanyId(long id);
	
	public List<Company> getCompaniesById(Long id);
	
	public List<InvestorDTO> getInvestors();
}
