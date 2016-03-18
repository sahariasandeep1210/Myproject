package com.tf.util;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.liferay.portal.kernel.log.Log;
import com.liferay.portal.kernel.log.LogFactoryUtil;
import com.tf.service.CompanyService;
import com.tf.service.UserService;

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
}