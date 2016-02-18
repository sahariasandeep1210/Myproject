package com.tf.registration.service;

import javax.portlet.PortletRequest;

import com.liferay.portal.kernel.exception.PortalException;
import com.liferay.portal.kernel.exception.SystemException;
import com.liferay.portal.service.ServiceContext;
import com.liferay.portal.theme.ThemeDisplay;
import com.tf.model.User;
import com.tf.util.Registration;

public interface  RegistrationService {

	public String registerCompany(Registration registration,
			ThemeDisplay themeDisplay, User user, ServiceContext serviceContext,PortletRequest request)
			throws PortalException, SystemException ;
}
