package com.tf.persistance.util;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.apache.commons.lang.StringUtils;

public class WhitehallUtility {
    
    public static Date stringToDate(String inputString, String inputFormat, String outputFormat) throws ParseException {	
	if (!StringUtils.isEmpty(inputString)) {
	    DateFormat dateFormat = new SimpleDateFormat(outputFormat);
	    Date date = new SimpleDateFormat(inputFormat).parse(inputString);
	    String outputDateString = dateFormat.format(date);
	    return dateFormat.parse(outputDateString);
	}
	return null;	
    }

}
