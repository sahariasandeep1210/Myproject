package com.tf.util;

import java.util.List;

import javax.portlet.PortletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.liferay.portal.kernel.exception.PortalException;
import com.liferay.portal.kernel.exception.SystemException;
import com.liferay.portal.kernel.portlet.LiferayPortletURL;
import com.liferay.portal.kernel.repository.model.FileEntry;
import com.liferay.portal.kernel.util.WebKeys;
import com.liferay.portal.model.Portlet;
import com.liferay.portal.security.permission.PermissionChecker;
import com.liferay.portal.service.PortletLocalServiceUtil;
import com.liferay.portal.theme.ThemeDisplay;
import com.liferay.portal.util.PortalUtil;
import com.liferay.portlet.PortletURLFactoryUtil;
import com.tf.service.UserService;

@Component
public class LiferayUtility {
	
	@Autowired
	protected UserService userService;	
	
	
	
	public  String getPortletURL(PortletRequest request,String portletName,String inputParam,String inputValue,boolean isPrivateLayout) {
		// TODO Auto-generated method stub
		List<Portlet> portletList = PortletLocalServiceUtil.getPortlets();
        String portletId = null;
        LiferayPortletURL portletURL=null;
        for(Portlet portlet : portletList){
        	if(portlet.getPortletName().equalsIgnoreCase(portletName)){
        		portletId =  portlet.getPortletId();     
        		break;
        	}                     
        }
        ThemeDisplay themeDisplay=(ThemeDisplay)request.getAttribute(WebKeys.THEME_DISPLAY);
        try {
        	long plid= PortalUtil.getPlidFromPortletId(themeDisplay.getScopeGroupId(),isPrivateLayout, portletId);
			 portletURL = PortletURLFactoryUtil.create(request,portletId, 
					plid, PortletRequest.RENDER_PHASE);
			if(inputParam!=null){				
				portletURL.setParameter(inputParam, inputValue);
			}
		} catch (PortalException e) {
			e.printStackTrace();
		} catch (SystemException e) {
			e.printStackTrace();
		}
        return  portletURL !=null?portletURL.toString():"";
		
	}
	
	public ThemeDisplay getThemeDisplay(PortletRequest request){
		ThemeDisplay themeDisplay = (ThemeDisplay)request.getAttribute(WebKeys.THEME_DISPLAY);
		return themeDisplay;
	}
	
	public Long getWhitehallCompanyID(PortletRequest request){
		long companyID=userService.getCompanyIDbyUserID(getThemeDisplay(request).getUserId());
		return companyID;
	}
	
	public PermissionChecker getPermissionChecker(PortletRequest request) {	
		return getThemeDisplay(request).getPermissionChecker();
	}
	
	public  String getDocumentURL(ThemeDisplay themeDisplay, FileEntry fileEntry) {
		StringBuilder sb = new StringBuilder();
		sb.append(themeDisplay.getPortalURL());
		sb.append("/c/document_library/get_file?uuid=");
		sb.append(fileEntry.getUuid());
		sb.append("&groupId=");
		sb.append(themeDisplay.getScopeGroupId());
		return sb.toString();
	}

}
