package com.tf.events;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.liferay.portal.kernel.events.Action;
import com.liferay.portal.kernel.events.ActionException;
import com.liferay.portal.kernel.exception.PortalException;
import com.liferay.portal.kernel.exception.SystemException;
import com.liferay.portal.kernel.language.LanguageUtil;
import com.liferay.portal.kernel.util.LocaleUtil;
import com.liferay.portal.kernel.util.WebKeys;
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

public class CustomVelocity extends Action {
	
	private static final String xmlFileName="roles.xml";

	@Override
	public void run(HttpServletRequest request, HttpServletResponse response)
			throws ActionException {
		Map<String, Object> vmVariables = new HashMap<String, Object>();
		try {
			if(PortalUtil.getUser(request)!=null){
				User user= PortalUtil.getUser(request);
				String userRole="";
				long companyId = CompanyThreadLocal.getCompanyId();	
				String xmlName=LanguageUtil.get(LocaleUtil.getDefault(), "role.xml.file.name",xmlFileName);
				String content= ContentUtil.get(xmlName);
				Document document = SAXReaderUtil.read(content);
				Element rootElement = document.getRootElement();
				List<String> roleList=fetchRoles(companyId,rootElement);
				List<Role> roles = RoleLocalServiceUtil.getUserRoles(user.getUserId());  
				for(Role role : roles){
					if(roleList.contains(role.getName())){
						userRole=role.getName();
					}
				}
				vmVariables.put("screenName", userRole);	
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
		request.setAttribute(WebKeys.VM_VARIABLES, vmVariables);
		
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
