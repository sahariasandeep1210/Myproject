package com.tf.util;

import java.io.IOException;
import java.io.InputStream;
import java.util.LinkedList;
import java.util.List;
import java.util.Properties;

import org.springframework.http.MediaType;
import org.springframework.http.converter.json.MappingJackson2HttpMessageConverter;
import org.springframework.web.client.RestTemplate;

public class RestServiceConsumerUtil {
	
	public static  RestTemplate restTemplate = getRestTemplate();
	
	public static final  Properties prop =initializePropoerties();
	
	

	public  String getProperty(String key) {
		String value = null;
		value = prop.getProperty(key);
		return value;
	}

	private static Properties initializePropoerties() {
		Properties prop = new Properties();
		
		try {
			InputStream in = RestServiceConsumerUtil.class.getClassLoader()
					.getResourceAsStream("resource_en.properties");
			prop.load(in);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return prop;
	}

	public  static RestTemplate getRestTemplate() {	
		RestTemplate restTemplate = new RestTemplate();
		ServiceResponseErrorHandler responseErrorHanler = new ServiceResponseErrorHandler();
		restTemplate.setErrorHandler(responseErrorHanler);
		MappingJackson2HttpMessageConverter converter = new MappingJackson2HttpMessageConverter();
		List<MediaType> supportedMediaTypes = new LinkedList(
				converter.getSupportedMediaTypes());
		MediaType textJavascriptMediaType = new MediaType("application",
				"*+json", MappingJackson2HttpMessageConverter.DEFAULT_CHARSET);
		supportedMediaTypes.add(textJavascriptMediaType);
		converter.setSupportedMediaTypes(supportedMediaTypes);
		restTemplate.getMessageConverters().add(converter);
		return restTemplate;
	}
	
	

	

}
