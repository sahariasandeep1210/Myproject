package com.tf.service;

import java.util.List;

import com.tf.model.Company;

public interface CompanyService {
	
	public List<Company> getCompanies();
	
	public void addCompany(Company company);

	public Company findById(long id);
	
	public String  getCompanyTypebyID(long id);
}
