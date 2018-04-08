package com.tf.dao;

import java.util.List;

import com.tf.model.Company;
import com.tf.model.CompanyDocument;

public interface CompanyDocumentDAO {
	
	public void addCompanyDocument(CompanyDocument companyDocuments);
	
	public List<CompanyDocument> getCompanyDocuments();
	
	public List<CompanyDocument> getCompanyDocumentsWithId(long companyId);

	public Company getCompanyDetail(String regNumber, String name);

	public void addCompanyDetailList(List<Company> companyList);

	public List<CompanyDocument> getCompanyDocumentsBasedOnUploadedBy(String uploadedBy);
}
