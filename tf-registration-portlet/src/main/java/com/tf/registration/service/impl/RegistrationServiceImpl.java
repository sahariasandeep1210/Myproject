package com.tf.registration.service.impl;

import java.util.LinkedHashSet;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.liferay.portal.kernel.exception.PortalException;
import com.liferay.portal.kernel.exception.SystemException;
import com.liferay.portal.model.Role;
import com.liferay.portal.service.RoleLocalServiceUtil;
import com.liferay.portal.service.ServiceContext;
import com.liferay.portal.service.UserLocalServiceUtil;
import com.liferay.portal.service.UserServiceUtil;
import com.liferay.portal.theme.ThemeDisplay;
import com.tf.model.Company;
import com.tf.model.Investor;
import com.tf.model.User;
import com.tf.persistance.util.CompanyStatus;
import com.tf.registration.service.RegistrationService;
import com.tf.service.CompanyService;
import com.tf.util.Registration;

@Transactional(rollbackFor = Exception.class)
@Service
public class RegistrationServiceImpl implements RegistrationService {
	
	@Autowired
	private CompanyService companyService;

	@Override
	public String registerCompany(Registration registration,
			ThemeDisplay themeDisplay, User user, ServiceContext serviceContext)
			throws PortalException, SystemException {
		StringBuilder loginURL;
		com.liferay.portal.model.User lruser = addLiferayUser(user, serviceContext,themeDisplay);
		Role role =RoleLocalServiceUtil.getRole(themeDisplay.getCompanyId(), user.getType());
		UserLocalServiceUtil.addRoleUser(role.getRoleId(), lruser.getUserId());
		UserLocalServiceUtil.updateUser(lruser);			
		//Liferay user has been added now we need to add user information to tf_user table
		//and map the same to Liferay userId and Company/Seller
		user.setActive(Boolean.FALSE);
		user.setLiferayUserId(lruser.getUserId());		
		Company company = registration.getCompany();
		if(company!=null && "1".equals(company.getCompanyType())){
			 company.setInvestor(new Investor());
			 company.getInvestor().setCompany(company);
		 }
		company.getAddress().setCompany(company);
		user.setCompany(company);
		Set<User> users=new LinkedHashSet<User>();
		users.add(user);
		company.setUsers(users);
		company.setActivestatus(CompanyStatus.NEW.getValue());
		company=companyService.registerCompany(company);
		loginURL = new StringBuilder("/web/guest/home");
		loginURL.append("?registration=success");
		return loginURL.toString();
	}
	
	private com.liferay.portal.model.User addLiferayUser(User user,
			ServiceContext serviceContext,ThemeDisplay themeDisplay) throws PortalException, SystemException {
			
		
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
		int birthdayMonth =2;
		int birthdayDay = 2;
		int birthdayYear = 1988;
		String jobTitle = user.getLevel();
		long[] groupIds = null;
		long[] organizationIds = null;
		long[] roleIds = null;
		long[] userGroupIds = null;
		boolean sendEmail = true;

		
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
