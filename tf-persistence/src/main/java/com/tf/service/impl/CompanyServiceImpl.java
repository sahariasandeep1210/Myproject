package com.tf.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tf.dao.CompanyDAO;
import com.tf.model.Company;
import com.tf.service.CompanyService;


@Service
public class CompanyServiceImpl implements CompanyService {
	
	@Autowired
	private CompanyDAO companyDAO;

	public List<Company> getCompanies() {
		return companyDAO.getCompanies();
	}

	public void addCompany(Company company) {
		 companyDAO.addCompany(company);		
	}

	public Company findById(long id) {
		// TODO Auto-generated method stub
		return companyDAO.findById(id);
	}

}
