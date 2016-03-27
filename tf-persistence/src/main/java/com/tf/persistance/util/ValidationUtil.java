package com.tf.persistance.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.stereotype.Component;

@Component
public class ValidationUtil {	

	public boolean isNumeric(String s) {
		return java.util.regex.Pattern.matches("\\d+", s);
	}
	
	public boolean containsSpecialCharacter(String s) {
	    return (s == null) ? false : s.matches("[^A-Za-z0-9 ]");
	}

	public boolean isThisDateValid(String dateToValidate, String dateFromat) {
		if (dateToValidate == null) {
			return false;
		}
		SimpleDateFormat sdf = new SimpleDateFormat(dateFromat);
		sdf.setLenient(false);
		try {
			// if not valid, it will throw ParseException
			Date date = sdf.parse(dateToValidate);
		}
		catch (ParseException e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}
}