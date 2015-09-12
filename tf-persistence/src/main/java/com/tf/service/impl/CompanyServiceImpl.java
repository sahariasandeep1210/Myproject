package com.tf.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tf.dao.CompanyDAO;
import com.tf.model.Company;
import com.tf.service.CompanyService;


@Service
public class CompanyServiceImpl implements CompanyService {
	
	@Autowired
	private CompanyDAO companyDAO;

	@Transactional
	public List<Company> getCompanies(Integer status) {
		return companyDAO.getCompanies(status);
	}

	public void addCompany(Company company) {
		 companyDAO.addCompany(company);		
	}

	public Company findById(long id) {
		// TODO Auto-generated method stub
		return companyDAO.findById(id);
	}
	
	public String  getCompanyTypebyID(long id)	{
	return companyDAO.getCompanyTypebyID(id);
}

	public Company registerCompany(Company company) {
		// TODO Auto-generated method stub
		return companyDAO.registerCompany(company);
	}
	
	public List<Long> deleteCompany(Long id){
		 return companyDAO.deleteCompany(id);
	}
	
	public List<Company> getCompanies(String companyType){
		return companyDAO.getCompanies(companyType);
		
	}

}
