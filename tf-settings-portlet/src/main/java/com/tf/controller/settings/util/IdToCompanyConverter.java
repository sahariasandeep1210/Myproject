package com.tf.controller.settings.util;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.convert.converter.Converter;
import org.springframework.stereotype.Component;

import com.tf.model.Company;
import com.tf.service.CompanyService;



@Component
public class IdToCompanyConverter implements Converter<Long, Company>{
	
	@Autowired
	private CompanyService companyService;

	

	public Company convert(Long id) {
		// TODO Auto-generated method stub
		return companyService.findById(id);
	}

	

}
