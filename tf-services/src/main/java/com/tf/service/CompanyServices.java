package com.tf.service;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;

import com.tf.model.CompanyList;
import com.tf.util.RestServiceConsumerUtil;
import com.tf.util.ServiceResponseException;
import com.tf.util.ServicesConstants;

public class CompanyServices  extends BaseService{
	
	public CompanyList getCompanyInfo(String query,Integer itemsPerPage,Integer startIndex)
		    throws ServiceResponseException
		  {
		    String url = getCompanySearchURL(query,itemsPerPage,startIndex);
		    HttpEntity<String> request = new HttpEntity<String>(createHeaders(restServiceConsumerUtil.getProperty(ServicesConstants.API_KEY)));
		    ResponseEntity<CompanyList> response   = RestServiceConsumerUtil.restTemplate.exchange(url, HttpMethod.GET, request, CompanyList.class);
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
		  

}
