package com.tf.service;

import java.util.List;

import com.tf.model.Company;

public interface CompanyService {
	
	public List<Company> getCompaniesByStatus(String status,int startIndex,int pageSize);
	
	public List<Company> getCompaniesByStatus(String status,long userID);
	
	public void addCompany(Company company);

	public Company findById(long id);
	
	public String  getCompanyTypebyID(long id);
	
	public Company registerCompany(Company company);
	
	public List<Long> deleteCompany(Long id);
	
	public List<Company> getCompanies(String companyType);
	
	public Long getCompaniesCount(String status) ;

	public Company  loadCompanyId(long id);
	public List<Company> getCompaniesById(Long id);

	
	public Company loadById(long id);
	

}
