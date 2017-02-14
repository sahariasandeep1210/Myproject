package com.tf.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tf.dao.CompanyDocumentDAO;
import com.tf.dao.UserDAO;
import com.tf.model.Company;
import com.tf.model.CompanyDocument;
import com.tf.service.CompanyDocumentService;


@Service
public class CompanyDocumentServiceImpl implements CompanyDocumentService {
	
	@Autowired
	private CompanyDocumentDAO companyDocumentDAO;
	
	@Autowired
	private UserDAO userDAO;
	
	public void addCompanyDocument(CompanyDocument companyDocument){
		companyDocumentDAO.addCompanyDocument(companyDocument);		
	}
	public List<CompanyDocument> getCompanyDocuments(){
		return companyDocumentDAO.getCompanyDocuments();
	}
	
	public List<CompanyDocument> getCompanyDocumentsWithId(long userId){
		long companyId=userDAO.getCompanyIDbyUserID(userId);
		return companyDocumentDAO.getCompanyDocumentsWithId(companyId);	
	}
	public Company getCompanyDetail(String regNumber, String name) {
		return companyDocumentDAO.getCompanyDetail(regNumber,name);	
	}
	public void addCompanyDetailList(List<Company> companyList) {
		companyDocumentDAO.addCompanyDetailList(companyList);
		
	}

}
