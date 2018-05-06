package com.tf.util;

import java.util.LinkedHashMap;
import java.util.Map;

import javax.portlet.PortletRequest;

import org.springframework.stereotype.Component;

import com.liferay.portal.kernel.util.WebKeys;
import com.liferay.portal.security.permission.PermissionChecker;
import com.liferay.portal.theme.ThemeDisplay;

@Component
public class AdminUtility {
	
	
	public Map<String,String> getUserTypes(long  userId,String companyType,PortletRequest request){
		Map<String,String> map = new LinkedHashMap<String, String>();
		 if("SCF Company".equalsIgnoreCase(companyType) ||  request.isUserInRole("SCF Admin")){
			addSCFUserTypes(map);
		} else if(request.isUserInRole("Primary Investor Admin")){
			addPriInvestorUserTypes(map);
		} else if("Primary Investor".equalsIgnoreCase(companyType) ){
			addPriInvestorUserTypes(map);
		} else if("Secondary Investor".equalsIgnoreCase(companyType) ){
			addSecInvestorUserTypes(map);
		}else if("Seller".equalsIgnoreCase(companyType) || "4".equalsIgnoreCase(companyType)){
			addSellerUserTypes(map);
		}else if("Primary Investor".equalsIgnoreCase(companyType) || "1".equalsIgnoreCase(companyType)){
			addPriInvestorUserTypes(map);
		}else{
			addSellerUserTypes(map);
			addPriInvestorUserTypes(map);
			addSecInvestorUserTypes(map);
		}			
		return map;
		
	}
	
	public PermissionChecker getPermissionChecker(PortletRequest request){
		ThemeDisplay themeDisplay = (ThemeDisplay)request.getAttribute(WebKeys.THEME_DISPLAY);
		PermissionChecker permissionChecker = themeDisplay.getPermissionChecker();
		return permissionChecker;	
	}
	private   Map<String,String> addTFUserTypes(Map<String,String> map){
		map.put("Trade Finance User","Trade Finance User");
		map.put("Trade Finance Admin","Trade Finance Admin");
		map.put("Trade Finance Sales","Trade Finance Sales");
		map.put("Trade Finance IT Support","Trade Finance IT Support");
		return map;		
	}
	
	private   Map<String,String> addSellerUserTypes(Map<String,String> map){
		map.put("Seller User","Seller User");
		map.put("Seller Admin","Seller Admin");		
		return map;		
	}
	
	private   Map<String,String> addPriInvestorUserTypes(Map<String,String> map){
		map.put("Primary Investor User","Primary Investor User");
		map.put("Primary Investor Admin","Primary Investor Admin");		
		return map;		
	}
	
	private   Map<String,String> addSecInvestorUserTypes(Map<String,String> map){
		map.put("Secondary Investor User","Secondary Investor User");
		map.put("Secondary Investor Admin","Secondary Investor Admin");		
		return map;			
	}
	
	private   Map<String,String> addSCFUserTypes(Map<String,String> map){
		map.put("SCF Company User","SCF Company User");
		map.put("SCF Company Admin","SCF Company Admin");		
		return map;			
	}
	
	public long getUserID(PortletRequest request){
		ThemeDisplay themeDisplay = (ThemeDisplay)request.getAttribute(WebKeys.THEME_DISPLAY);
		return themeDisplay.getUserId();
	}

}
