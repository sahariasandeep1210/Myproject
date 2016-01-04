package com.tf.startup.events;

import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import com.liferay.portal.NoSuchRoleException;
import com.liferay.portal.kernel.events.ActionException;
import com.liferay.portal.kernel.events.SimpleAction;
import com.liferay.portal.kernel.exception.PortalException;
import com.liferay.portal.kernel.exception.SystemException;
import com.liferay.portal.kernel.language.LanguageUtil;
import com.liferay.portal.kernel.log.Log;
import com.liferay.portal.kernel.log.LogFactoryUtil;
import com.liferay.portal.kernel.util.GetterUtil;
import com.liferay.portal.kernel.util.LocaleUtil;
import com.liferay.portal.kernel.util.Validator;
import com.liferay.portal.kernel.xml.Document;
import com.liferay.portal.kernel.xml.DocumentException;
import com.liferay.portal.kernel.xml.Element;
import com.liferay.portal.kernel.xml.SAXReaderUtil;
import com.liferay.portal.model.Role;
import com.liferay.portal.model.RoleConstants;
import com.liferay.portal.model.User;
import com.liferay.portal.security.auth.CompanyThreadLocal;
import com.liferay.portal.service.RoleLocalServiceUtil;
import com.liferay.portal.service.UserLocalServiceUtil;
import com.liferay.util.ContentUtil;

public class CreateRoleAction extends SimpleAction {
	
	private static final String xmlFileName="roles.xml";
	

	@Override
	public void run(String[] arg0) throws ActionException {
		
		
		
		long companyId = CompanyThreadLocal.getCompanyId();	
		String xmlName=LanguageUtil.get(LocaleUtil.getDefault(), "role.xml.file.name",xmlFileName);
		try {
		 String content= ContentUtil.get(xmlName);
		 Document document = SAXReaderUtil.read(content);
		 Element rootElement = document.getRootElement();
		 loadCompanyRoles(companyId,rootElement);
		} catch (SystemException e) {
			_log.error(e);
		} catch (PortalException e) {
			_log.error(e);
		} catch (DocumentException e) {
			_log.error(e);
		}
		
		
	}
	
	private void loadCompanyRoles(long companyId, Element rootElement) throws SystemException, PortalException{
		List<Element> listOfRoles = rootElement.elements("roles");
		User defaultUser = UserLocalServiceUtil.getDefaultUser(companyId);
		for( Element roles : listOfRoles){
			List<Element> roleElements = roles.elements("role");
			for( Element roleElement  : roleElements){
				String name = roleElement.attribute("name").getText();
				if (Validator.isNotNull(name)) {
					try {
						RoleLocalServiceUtil.loadGetRole(companyId, name);
					} catch (NoSuchRoleException e) {
						String title = roleElement.attribute("title").getText();
						String description = roleElement.attribute("description").getText();
						String typeStr = roleElement.attribute("type")!=null ? roleElement.attribute("type").getText() : null;
						int type_ = typeStr!=null ? GetterUtil.getInteger(typeStr, RoleConstants.TYPE_REGULAR) : RoleConstants.TYPE_REGULAR;
						Map<Locale, String> descriptionMap = new HashMap<Locale, String>();
						descriptionMap.put(LocaleUtil.getDefault(), description);
						Map<Locale, String> titleMap = new HashMap<Locale, String>();
						titleMap.put(LocaleUtil.getDefault(), title);
						//below method needs to be changed as its deprecated
						Role role = RoleLocalServiceUtil.addRole(defaultUser.getUserId(), companyId, name, titleMap, descriptionMap, type_);
						_log.info("New role added: " + role.getName());
					} catch (PortalException e) {
						_log.error(e);
					}
				}
			}
		}
	}
	private Log _log = LogFactoryUtil.getLog(CreateRoleAction.class.getName());

}
