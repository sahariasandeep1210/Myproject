package com.tf.util;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.liferay.portal.kernel.log.Log;
import com.liferay.portal.kernel.log.LogFactoryUtil;
import com.tf.service.CompanyService;
import com.tf.service.UserService;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

@Component
public class ValidationUtil {

	protected Log _log = LogFactoryUtil.getLog(LiferayUtility.class.getName());

	@Autowired
	protected UserService userService;

	@Autowired
	private CompanyService companyService;

	public boolean isNumeric(String s) {
		_log.info("isNumeric funcation");
		return java.util.regex.Pattern.matches("\\d+", s);
	}
	
	public boolean containsSpecialCharacter(String s) {
	    return (s == null) ? false : s.matches("[^A-Za-z0-9 ]");
	}

	public boolean isThisDateValid(String dateToValidate, String dateFromat) {
		
		_log.info("isThisDateValid funcation");

		if (dateToValidate == null) {
			return false;
		}

		SimpleDateFormat sdf = new SimpleDateFormat(dateFromat);
		sdf.setLenient(false);

		try {

			// if not valid, it will throw ParseException
			Date date = sdf.parse(dateToValidate);
			_log.info("isThisDateValid funcation Date - "+date);

		} catch (ParseException e) {

			e.printStackTrace();
			return false;
		}

		return true;
	}
}