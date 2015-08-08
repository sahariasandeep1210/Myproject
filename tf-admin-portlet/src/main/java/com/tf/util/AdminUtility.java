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
 		ThemeDisplay themeDisplay = (ThemeDisplay)request.getAttribute(WebKeys.THEME_DISPLAY);
		PermissionChecker permissionChecker = themeDisplay.getPermissionChecker();
		if(permissionChecker.isOmniadmin() || permissionChecker.isGroupAdmin(themeDisplay.getLayout().getGroupId()) || "Admin".equals(companyType)){
			addTFUserTypes(map);
			addSellerUserTypes(map);
			addPriInvestorUserTypes(map);
			addSecInvestorUserTypes(map);
		} else if("Primary Investor".equalsIgnoreCase(companyType) ){
			addPriInvestorUserTypes(map);
		} else if("Secondary Investor".equalsIgnoreCase(companyType) ){
			addSecInvestorUserTypes(map);
		}else if("Seller".equalsIgnoreCase(companyType)){
			addSellerUserTypes(map);
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
		map.put("Primary Invester User","Primary Invester User");
		map.put("Primary Invester Admin","Primary Invester Admin");		
		return map;		
	}
	
	private   Map<String,String> addSecInvestorUserTypes(Map<String,String> map){
		map.put("Secondary Invester User","Secondary Invester User");
		map.put("Secondary Invester Admin","Secondary Invester Admin");		
		return map;			
	}
	
	public long getUserID(PortletRequest request){
		ThemeDisplay themeDisplay = (ThemeDisplay)request.getAttribute(WebKeys.THEME_DISPLAY);
		return themeDisplay.getUserId();
	}

}
