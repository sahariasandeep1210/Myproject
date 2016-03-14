package com.tf.util;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.portlet.ActionRequest;
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
import com.liferay.portal.service.ServiceContext;
import com.liferay.portal.service.ServiceContextFactory;
import com.liferay.portal.service.UserServiceUtil;
import com.liferay.portal.theme.ThemeDisplay;
import com.liferay.portal.util.PortalUtil;
import com.liferay.portlet.PortletURLFactoryUtil;
import com.tf.model.Company;
import com.tf.model.User;
import com.tf.service.CompanyService;
import com.tf.service.UserService;

@Component
public class LiferayUtility {
	
	@Autowired
	protected UserService userService;	
	
	@Autowired
	private CompanyService companyService;
	
	
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
	
	public long getLiferayUserID(PortletRequest request){
		return getThemeDisplay(request).getRealUserId();
	}
	
	
	public Long getWhitehallCompanyID(PortletRequest request){
		long companyID=userService.getCompanyIDbyUserID(getThemeDisplay(request).getUserId());
		return companyID;
	}
	public String getWhiteHallComapanyRegNo(PortletRequest request){
		long companyID = getWhitehallCompanyID(request);
		Company comp = companyService.findById(companyID);
		return comp.getRegNumber();
	}
	
	public PermissionChecker getPermissionChecker(PortletRequest request) {	
		return getThemeDisplay(request).getPermissionChecker();
	}
	
	public String getDate(Date date) {	
		SimpleDateFormat formatter = new SimpleDateFormat("dd-MM-yyyy");
		String format = formatter.format(date);
		return format;
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
	
	public com.liferay.portal.model.User addLiferayUser(User user,
			ActionRequest request) throws PortalException, SystemException {
		ThemeDisplay themeDisplay=(ThemeDisplay)request.getAttribute(WebKeys.THEME_DISPLAY);	
		
		boolean autoPassword = true;
		String password1 = null;
		String password2 = null;
		boolean autoScreenName = false;
		String screenName = user.getUsername();
		String emailAddress = user.getEmail();
		long facebookId = 0l;
		String openId = null;
		String firstName = user.getFirstName();
		String middleName =  user.getMiddleName();
		String lastName =  user.getLastName();
		int prefixId = 0;
		int suffixId = 0;
		boolean male = true;
		//this is just dummy value 
		int birthdayMonth =2;
		int birthdayDay = 2;
		int birthdayYear = 1988;
		String jobTitle = user.getLevel();
		long[] groupIds = null;
		long[] organizationIds = null;
		long[] roleIds = null;
		long[] userGroupIds = null;
		boolean sendEmail = true;

		ServiceContext serviceContext = ServiceContextFactory.getInstance(
				com.liferay.portal.model.User.class.getName(), request);
		com.liferay.portal.model.User lruser = UserServiceUtil.addUserWithWorkflow(
					themeDisplay.getCompany().getCompanyId(), autoPassword, password1, password2,
					autoScreenName, screenName, emailAddress, facebookId, openId,
					themeDisplay.getLocale(), firstName, middleName, lastName, prefixId,
					suffixId, male, birthdayMonth, birthdayDay, birthdayYear, jobTitle,
					groupIds, organizationIds, roleIds, userGroupIds, sendEmail,
					serviceContext);
		return lruser;
	}
	

}
