package com.tf.service;

import java.nio.charset.Charset;

import org.apache.commons.codec.binary.Base64;
import org.springframework.http.HttpHeaders;

import com.tf.util.RestServiceConsumerUtil;
import com.tf.util.ServicesConstants;

public class BaseService {


	RestServiceConsumerUtil restServiceConsumerUtil = new RestServiceConsumerUtil();

	public String SERVICE_BASE_URL = restServiceConsumerUtil.getProperty(ServicesConstants.SERVICE_BASE_URL);
	
	public HttpHeaders createHeaders(String username){	
		 String auth = username;
        byte[] encodedAuth = Base64.encodeBase64(auth.getBytes(Charset.forName("US-ASCII")) );
        String authHeader = "Basic " + new String( encodedAuth );
        HttpHeaders headers = new HttpHeaders();
        headers.add("Authorization", authHeader);   
        return headers;
	}

}
