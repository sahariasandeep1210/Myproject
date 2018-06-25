package com.tf.service;

import java.util.List;

import com.tf.model.Company;
import com.tf.model.CompanyDocument;

public interface CompanyDocumentService {
	
	public void addCompanyDocument(CompanyDocument companyDocument);
	
	public List<CompanyDocument> getCompanyDocuments();
	
	public List<CompanyDocument> getCompanyDocumentsWithId(long userId);

	public Company getCompanyDetail(String regNumber, String name);

	public void addCompanyDetailList(List<Company> companyList);
	
	public List<CompanyDocument> getCompanyDocumentsBasedOnUploadedBy(String uploadedBy);
	
	public void chnageSellerScfMappingStatus(long scfCompanyId,String status);
	
	public void addCompanyDetailsAndSCFSellerMaping(List<Company> companyList,long scfCompanyId);

}
