package com.tf.dao;

import java.util.List;

import com.tf.model.Company;

public interface CompanyDAO {
	
	public List<Company> getCompanies();
	
	public void addCompany(Company company);
	
	public Company findById(long id);

}
