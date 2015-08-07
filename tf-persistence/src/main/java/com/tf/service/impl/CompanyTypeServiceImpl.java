package com.tf.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tf.dao.CompanyTypeDAO;
import com.tf.model.CompanyType;
import com.tf.service.CompanyTypeService;


@Service
public class CompanyTypeServiceImpl  implements CompanyTypeService{
	
	@Autowired
	private CompanyTypeDAO companyTypeDAO;

	public List<CompanyType> getAllCompanyType() {
		// TODO Auto-generated method stub
		return companyTypeDAO.getAllCompanyType();
	}

}
