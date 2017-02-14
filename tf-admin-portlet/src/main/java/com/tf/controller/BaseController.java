package com.tf.controller;

import java.beans.PropertyEditorSupport;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;

import com.liferay.portal.kernel.log.Log;
import com.liferay.portal.kernel.log.LogFactoryUtil;
import com.tf.company.service.LiferayService;
import com.tf.model.CompanyType;
import com.tf.persistance.util.Constants;
import com.tf.service.CompanyDocumentService;
import com.tf.service.CompanyService;
import com.tf.service.CompanyServices;
import com.tf.service.CompanyTypeService;
import com.tf.service.OfficerService;
import com.tf.service.SellerScfMappingService;
import com.tf.service.UserService;
import com.tf.util.AdminUtility;
import com.tf.util.LiferayUtility;
import com.tf.util.MyCustomNumberEditor;
import com.tf.util.PaginationUtil;

public class BaseController {

	protected Log _log = LogFactoryUtil.getLog(BaseController.class.getName());
	
	
	
	@Autowired
	protected CompanyService companyService;
	
	@Autowired
	protected CompanyDocumentService companyDocumentService;
	
	
	@Autowired
	protected LiferayService liferayService;
	
	@Autowired
	private  CompanyTypeService companyTypeService;
	
	@Autowired
	protected  UserService userService; 
	
	@Autowired
	protected  AdminUtility adminUtility;
	
	@Autowired
	protected CompanyServices companyServices;
	
	@Autowired
	protected OfficerService officerService;
	
	@Autowired
	protected LiferayUtility liferayUtility;
	
	@Autowired
	protected PaginationUtil paginationUtil;
	
	@Autowired
	protected SellerScfMappingService sellerScfMappingService;

	public static Map<String, String> orgTypeMap = initialzeOrgTypeMap();
	public static Map<Long, String> companyTypeMap;
	
	 @PostConstruct
     public void init() {
		 try{
			 companyTypeMap=initialzeCompanyTypeMap();	
		 }catch(Exception e){
			 _log.error("ERROR WHILE RFRESHING CACHE", e);
		 }
		 	
	}

	@InitBinder
	public void binder(WebDataBinder binder) {
		
		binder.registerCustomEditor(Date.class, new PropertyEditorSupport() {
			public void setAsText(String value) {
				try {
					setValue(new SimpleDateFormat(Constants.DATE_FORMAT).parse(value));
				} catch (Exception e) {
					setValue(null);
				}
			}

			public String getAsText() {
				if (getValue() != null) {
					return new SimpleDateFormat(Constants.DATE_FORMAT)
							.format((Date) getValue());
				} else {
					return null;
				}
			}
		});

		binder.registerCustomEditor(Long.class, new MyCustomNumberEditor(
				Long.class, true));
	}

	private   Map<Long, String> initialzeCompanyTypeMap() {
		List<CompanyType> companyTypes= companyTypeService.getAllCompanyType();
		Map<Long,String> cmpTypeMap=new LinkedHashMap<Long, String>();
		cmpTypeMap.put(null, "Select");
		for(CompanyType companyType : companyTypes){
			cmpTypeMap.put(companyType.getId(), companyType.getName());
		}
		return cmpTypeMap;
	}

	private static Map<String, String> initialzeOrgTypeMap() {
		Map<String, String> map = new LinkedHashMap<String, String>();
		map.put("", "Select");
		//map.put("Company", "Company");
		map.put("ltd", "Ltd");
		map.put("LLP", "LLP");
		map.put("Partnership", "Partnership");
		map.put("Sole Trader", "Sole Trader");
		return map;
	}

}
