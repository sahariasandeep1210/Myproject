package com.tf.service;

import java.util.List;

import com.tf.model.Company;
import com.tf.persistance.util.InvestorDTO;

public interface CompanyService {
	
	public List<Company> getCompaniesByStatus(String status,int startIndex,int pageSize);
	
	public List<Company> getCompaniesByStatusFilter(String status,int startIndex,int pageSize,String searchValue);
	
	public List<Company> getCompaniesByStatus(String status,long userID);
	
	public void addCompany(Company company);

	public Company findById(long id);
	
	public String  getCompanyTypebyID(long id);
	
	public Company registerCompany(Company company);
	
	public List<Long> deleteCompany(Long id);
	
	public List<Company> getCompanies(String companyType);
	
	public Long getCompaniesCount(String status) ;

	public Company  loadCompanyId(long id);
	
	public List<Company> getCompaniesById(Long id);

	public List<InvestorDTO> getInvestors();
	
	public Company loadById(long id);
	
	public Company getCompaniesByRegNum(String RegNum);
	
	public Company getCompaniesByName(String name);
	
	public long validateCompanyName(Company cmp);
	
	public long validateCompanyRegNo(Company cmp);
	
	public List<Company> getSellerCompanies(String companyType);
	
	
	public List<Company> getSellerCompaniesUsingJoinForAdmin();
	
	public List<Company> getSellerCompaniesUsingJoin(String value,long companyId);
	
	public List<Company> getCompaniesByStatus(String status);
	
	public Long getCompaniesCountByStatus(String status) ;
}
