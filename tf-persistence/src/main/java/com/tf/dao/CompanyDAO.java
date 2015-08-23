package com.tf.dao;

import java.util.List;

import com.tf.model.Company;

public interface CompanyDAO {
	
	public List<Company> getCompanies(Integer status);
	
	public void addCompany(Company company);
	
	public Company findById(long id);
	
	public String  getCompanyTypebyID(long id);
	
	public Company registerCompany(Company company);
	
	public List<Long> deleteCompany(Long id);
}
