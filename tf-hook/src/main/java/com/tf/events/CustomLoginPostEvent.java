package com.tf.events;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.liferay.portal.kernel.events.Action;
import com.liferay.portal.kernel.events.ActionException;
import com.liferay.portal.kernel.exception.PortalException;
import com.liferay.portal.kernel.exception.SystemException;
import com.liferay.portal.kernel.language.LanguageUtil;
import com.liferay.portal.kernel.util.LocaleUtil;
import com.liferay.portal.kernel.xml.Document;
import com.liferay.portal.kernel.xml.DocumentException;
import com.liferay.portal.kernel.xml.Element;
import com.liferay.portal.kernel.xml.SAXReaderUtil;
import com.liferay.portal.model.Role;
import com.liferay.portal.model.User;
import com.liferay.portal.security.auth.CompanyThreadLocal;
import com.liferay.portal.service.RoleLocalServiceUtil;
import com.liferay.portal.util.PortalUtil;
import com.liferay.util.ContentUtil;
import com.tf.persistance.util.Constants;

public class CustomLoginPostEvent extends Action {
	
	
	

	private static final String xmlFileName="roles.xml";

	@Override
	public void run(HttpServletRequest request, HttpServletResponse response)
			throws ActionException {
		String userRole="";
		try {
		if(PortalUtil.getUser(request)!=null){
			User user= PortalUtil.getUser(request);			
			long companyId = CompanyThreadLocal.getCompanyId();	
			String xmlName=LanguageUtil.get(LocaleUtil.getDefault(), "role.xml.file.name",xmlFileName);
			String content= ContentUtil.get(xmlName);
			Document document = SAXReaderUtil.read(content);
			Element rootElement = document.getRootElement();
			List<String> roleList=fetchRoles(companyId,rootElement);
			List<Role> roles = RoleLocalServiceUtil.getUserRoles(user.getUserId());  
			for(Role role : roles){
				if(role.getName().equalsIgnoreCase(Constants.OMNI_ADMIN) || role.getName().equalsIgnoreCase(Constants.WHITEHALL_ADMIN) ){
					userRole=Constants.WHITEHALL_ADMIN;
					break;
				}
				else if(roleList.contains(role.getName())){
					userRole=role.getName();
					break;
				}
			}		
		request.getSession().setAttribute("LIFERAY_SHARED_userRole", userRole);
		}
		
	
		} catch (PortalException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SystemException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (DocumentException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	} 
	
	private List<String> fetchRoles(long companyId, Element rootElement) {
		List<Element> listOfRoles = rootElement.elements("roles");
		List<String> roleList=new ArrayList<String>();
		for( Element roles : listOfRoles){
			List<Element> roleElements = roles.elements("role");
			for( Element roleElement  : roleElements){
				roleList.add(roleElement.attribute("name").getText());
			}
		}
		return roleList;
	}


}
