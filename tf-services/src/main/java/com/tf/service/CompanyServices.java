package com.tf.service;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import com.tf.model.CompanyList;
import com.tf.model.CompanyModel;
import com.tf.model.OfficerList;
import com.tf.util.RestServiceConsumerUtil;
import com.tf.util.ServiceResponseException;
import com.tf.util.ServicesConstants;

@Service
public class CompanyServices  extends BaseService{
	
	public CompanyList getCompaniesInfo(String query,Integer itemsPerPage,Integer startIndex)
		    throws ServiceResponseException {
		    String url = getCompanySearchURL(query,itemsPerPage,startIndex);
		    HttpEntity<String> request = new HttpEntity<String>(createHeaders(restServiceConsumerUtil.getProperty(ServicesConstants.API_KEY)));
		    ResponseEntity<CompanyList> response   = RestServiceConsumerUtil.restTemplate.exchange(url, HttpMethod.GET, request, CompanyList.class);
		    return response.getBody(); 
		  }
	

	public CompanyModel getCompanyInfo(String companyNumber)
		    throws ServiceResponseException {
		    String url = getCompanyInfoURL(companyNumber);
		    HttpEntity<String> request = new HttpEntity<String>(createHeaders(restServiceConsumerUtil.getProperty(ServicesConstants.API_KEY)));
		    ResponseEntity<CompanyModel> response   = RestServiceConsumerUtil.restTemplate.exchange(url, HttpMethod.GET, request, CompanyModel.class);
		    return response.getBody(); 
		  }
	
	public OfficerList getOfficersInfo(String companyNumber)
		    throws ServiceResponseException {
		    String url = getOfficersURL(companyNumber);
		    HttpEntity<String> request = new HttpEntity<String>(createHeaders(restServiceConsumerUtil.getProperty(ServicesConstants.API_KEY)));
		    ResponseEntity<OfficerList> response   = RestServiceConsumerUtil.restTemplate.exchange(url, HttpMethod.GET, request, OfficerList.class);
		    return response.getBody(); 
		  }

	private String getCompanySearchURL(String query, Integer itemsPerPage,
			Integer startIndex) {
		StringBuilder url=new StringBuilder(SERVICE_BASE_URL);
		url.append(restServiceConsumerUtil.getProperty(ServicesConstants.COMPANY_SEARCH));
		url.append(query);
		if(itemsPerPage !=null){
			url.append("&items_per_page=");
			url.append(itemsPerPage);
		}if(startIndex !=null){
			url.append("&start_index=");
			url.append(startIndex);
		}		
		return url.toString();
	}
	
	private String getCompanyInfoURL(String number) {
		StringBuilder url=new StringBuilder(SERVICE_BASE_URL);
		url.append(restServiceConsumerUtil.getProperty(ServicesConstants.COMPANY_DETAILS));
		url.append(number);			
		return url.toString();
	}
	
	private String getOfficersURL(String number) {
		StringBuilder url=new StringBuilder(SERVICE_BASE_URL);
		url.append(restServiceConsumerUtil.getProperty(ServicesConstants.COMPANY_DETAILS));
		url.append(number);
		url.append(restServiceConsumerUtil.getProperty(ServicesConstants.OFFICERS));
		return url.toString();
	}
		  

}
