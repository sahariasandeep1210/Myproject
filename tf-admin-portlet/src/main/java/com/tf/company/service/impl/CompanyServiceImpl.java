package com.tf.service.impl;

import javax.portlet.ActionRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.liferay.portal.kernel.exception.PortalException;
import com.liferay.portal.kernel.exception.SystemException;
import com.liferay.portal.model.Role;
import com.liferay.portal.service.RoleLocalServiceUtil;
import com.liferay.portal.service.UserLocalServiceUtil;
import com.liferay.portal.theme.ThemeDisplay;
import com.tf.company.service.CompanyService;
import com.tf.model.Officer;
import com.tf.model.User;
import com.tf.service.OfficerService;
import com.tf.service.UserService;
import com.tf.util.LiferayUtility;



@Transactional(rollbackFor = Exception.class)
@Service
public class CompanyServiceImpl implements CompanyService {
	
	@Autowired
	protected LiferayUtility liferayUtility;
	
	@Autowired
	protected  UserService userService; 
	
	@Autowired
	protected OfficerService officerService;
	
	public void addUserInformation(User user, ActionRequest request,
			boolean createUser, ThemeDisplay themeDisplay, Long officerId)
			throws PortalException, SystemException {
		if(user.getId() ==null){	
			createUser=true;
			com.liferay.portal.model.User lruser = liferayUtility.addLiferayUser(user, request);
			Role role =RoleLocalServiceUtil.getRole(themeDisplay.getCompanyId(), user.getType());
			UserLocalServiceUtil.addRoleUser(role.getRoleId(), lruser.getUserId());
			UserLocalServiceUtil.updateUser(lruser);
			user.setLiferayUserId(lruser.getUserId());
		}
		//Liferay user has been added now we need to add user information to tf_user table
		//and map the same to Liferay userId and Company/Seller
		user.setActive(Boolean.FALSE);
		Long userID=userService.addorUpdateUser(user);
		if(createUser && officerId!=0){
			Officer officer=officerService.findById(officerId);
			officer.setIduser(userID);
			officerService.addorUpdateOfficer(officer);
			
		}
	}

}
