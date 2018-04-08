package com.tf.company.seller.service.impl;

import javax.portlet.ActionRequest;

import org.springframework.aop.ThrowsAdvice;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.liferay.portal.DuplicateUserEmailAddressException;
import com.liferay.portal.DuplicateUserScreenNameException;
import com.liferay.portal.NoSuchUserException;
import com.liferay.portal.kernel.exception.PortalException;
import com.liferay.portal.kernel.exception.SystemException;
import com.liferay.portal.model.Role;
import com.liferay.portal.service.RoleLocalServiceUtil;
import com.liferay.portal.service.UserLocalServiceUtil;
import com.liferay.portal.theme.ThemeDisplay;
import com.tf.company.seller.service.LiferayServiceSeller;
import com.tf.model.Officer;
import com.tf.model.User;
import com.tf.service.OfficerService;
import com.tf.service.UserService;
import com.tf.util.LiferayUtility;



@Transactional(rollbackFor = Exception.class)
@Service
public class LifearyServiceSellerImpl implements LiferayServiceSeller {
	
	@Autowired
	protected LiferayUtility liferayUtility;
	
	@Autowired
	protected  UserService userService; 
	
	@Autowired
	protected OfficerService officerService;
	
	public void addUserInformation(User user, ActionRequest request,
			boolean createUser, ThemeDisplay themeDisplay, Long officerId)
			throws PortalException, SystemException,DuplicateUserEmailAddressException,DuplicateUserScreenNameException {
		if(user.getId() ==null){	
			createUser=true;
			com.liferay.portal.model.User lruser = liferayUtility.addLiferayUser(user, request);
			Role role =RoleLocalServiceUtil.getRole(themeDisplay.getCompanyId(), user.getType());
			UserLocalServiceUtil.addRoleUser(role.getRoleId(), lruser.getUserId());
			UserLocalServiceUtil.updateUser(lruser);
			user.setLiferayUserId(lruser.getUserId());
		}else {
			//this code need some refractoring 
			Object[] savedUser=userService.getUserTypeAndLifearyID(user.getId());
			if(user.getType()!=null && !user.getType().equals(savedUser[0]!=null?savedUser[0].toString():"")){
				//user type has been changed in that case should roles need to be updated
				com.liferay.portal.model.User lruser=UserLocalServiceUtil.getUser(savedUser[1]!=null?Long.valueOf(savedUser[1].toString()):0);
				Role role =RoleLocalServiceUtil.getRole(themeDisplay.getCompanyId(), user.getType());
				UserLocalServiceUtil.addRoleUser(role.getRoleId(), lruser.getUserId());
				UserLocalServiceUtil.updateUser(lruser);
			}else{
				com.liferay.portal.model.User lruser=UserLocalServiceUtil.getUser(user.getLiferayUserId());
				lruser.setFirstName(user.getFirstName());
				lruser.setLastName(user.getLastName());
				lruser.setMiddleName(user.getMiddleName());
				if(!(lruser.getEmailAddress().equalsIgnoreCase(user.getEmail()))){
				    try {
					com.liferay.portal.model.User liferayUser = UserLocalServiceUtil
						.getUserByEmailAddress(themeDisplay.getCompanyId(),user.getEmail());
					if(liferayUser!=null && liferayUser.getEmailAddress().equals(user.getEmail())){
					    throw new DuplicateUserEmailAddressException(); 
					}
				    } catch (NoSuchUserException e) {
					lruser.setEmailAddress(user.getEmail());
				    }   
				    
				}
				if(!(lruser.getScreenName().equalsIgnoreCase(user.getUsername()))){
				    
				    try {
					com.liferay.portal.model.User liferayUser = UserLocalServiceUtil
						.getUserByScreenName(themeDisplay.getCompanyId(), user.getUsername());
					if(liferayUser!=null && liferayUser.getScreenName().equals(user.getUsername())){
					    throw new DuplicateUserScreenNameException(); 
					}
				    } catch (NoSuchUserException e) {
					lruser.setScreenName(user.getUsername());
				    }   
				    
				}				
				lruser.setJobTitle(user.getLevel());
				UserLocalServiceUtil.updateUser(lruser);
			}
			
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
