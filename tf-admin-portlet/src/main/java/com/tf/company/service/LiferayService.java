package com.tf.company.service;

import javax.portlet.ActionRequest;

import com.liferay.portal.DuplicateUserEmailAddressException;
import com.liferay.portal.DuplicateUserScreenNameException;
import com.liferay.portal.kernel.exception.PortalException;
import com.liferay.portal.kernel.exception.SystemException;
import com.liferay.portal.theme.ThemeDisplay;
import com.tf.model.User;

public interface LiferayService {
	
	public void addUserInformation(User user, ActionRequest request,
			boolean createUser, ThemeDisplay themeDisplay, Long officerId)
			throws PortalException, SystemException, DuplicateUserEmailAddressException,DuplicateUserScreenNameException;

	public void deleteUserInformation(long UserId,long LiferaryId)throws PortalException, SystemException;
	
}
