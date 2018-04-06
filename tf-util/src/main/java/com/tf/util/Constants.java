package com.tf.util;

import java.util.LinkedHashMap;
import java.util.Map;

public class Constants {
    
    public static final String DATE_FORMAT 			= "dd-MM-yyyy";
    public static final Map<String,String> COMPANY_EXPORT_HEADERS = getCompanyHeaders();
    
    private static Map<String,String> getCompanyHeaders() {
	// TODO Auto-generated method stub
	Map<String,String> headerMap = new LinkedHashMap<String, String>();
	return headerMap;
    }

}
