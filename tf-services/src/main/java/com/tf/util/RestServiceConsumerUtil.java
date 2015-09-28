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

	public static String getServiceURL(int serviceName, long contactId) {
		Properties prop = new Properties();
		ClassLoader loader = Thread.currentThread().getContextClassLoader();
		InputStream in = loader
				.getResourceAsStream("");
		String baseUrl = null;
		try {
			prop.load(in);
			baseUrl = prop.getProperty("SERVICE_BASE_URL");
			in.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return baseUrl;
	}

	public static RestTemplate getRestTemplate() {
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
