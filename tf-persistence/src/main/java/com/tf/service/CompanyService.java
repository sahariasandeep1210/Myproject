package com.tf.service;

import java.util.List;

import com.tf.model.Company;

public interface CompanyService {
	
	public List<Company> getCompaniesByStatus(String status);
	
	public void addCompany(Company company);

	public Company findById(long id);
	
	public String  getCompanyTypebyID(long id);
	
	public Company registerCompany(Company company);
	
	public List<Long> deleteCompany(Long id);
	
	public List<Company> getCompanies(String companyType);
}
