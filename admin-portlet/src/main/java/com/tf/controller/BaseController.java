package com.tf.controller;

import java.beans.PropertyEditorSupport;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;

import com.liferay.portal.kernel.log.Log;
import com.liferay.portal.kernel.log.LogFactoryUtil;
import com.tf.model.CompanyType;
import com.tf.service.CompanyService;
import com.tf.service.CompanyTypeService;
import com.tf.util.MyCustomNumberEditor;

public class BaseController {

	protected Log _log = LogFactoryUtil.getLog(BaseController.class.getName());
	
	@Autowired
	protected CompanyService companyService;
	
	@Autowired
	private  CompanyTypeService companyTypeService;

	public static Map<String, String> orgTypeMap = initialzeOrgTypeMap();

	@InitBinder
	public void binder(WebDataBinder binder) {
		
		binder.registerCustomEditor(Date.class, new PropertyEditorSupport() {
			public void setAsText(String value) {
				try {
					setValue(new SimpleDateFormat("MM/dd/yyyy").parse(value));
				} catch (Exception e) {
					setValue(null);
				}
			}

			public String getAsText() {
				if (getValue() != null) {
					return new SimpleDateFormat("MM/dd/yyyy")
							.format((Date) getValue());
				} else {
					return null;
				}
			}
		});

		binder.registerCustomEditor(Long.class, new MyCustomNumberEditor(
				Long.class, true));
	}

	protected  Map<Long, String> initialzeCompanyTypeMap() {
		List<CompanyType> companyTypes= companyTypeService.getAllCompanyType();
		Map<Long,String> cmpTypeMap=new LinkedHashMap<Long, String>();
		for(CompanyType companyType : companyTypes){
			cmpTypeMap.put(companyType.getId(), companyType.getName());
		}
		return cmpTypeMap;
	}

	private static Map<String, String> initialzeOrgTypeMap() {
		Map<String, String> map = new LinkedHashMap<String, String>();
		map.put("", "Select");
		map.put("Company", "Company");
		map.put("LLP", "LLP");
		map.put("Partnership", "Partnership");
		map.put("Sole Trader", "Sole Trader");
		return map;
	}

}
