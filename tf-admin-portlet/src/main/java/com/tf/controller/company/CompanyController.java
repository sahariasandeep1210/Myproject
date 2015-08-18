package com.tf.controller.company;

import java.util.ArrayList;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.portlet.ActionRequest;
import javax.portlet.ActionResponse;
import javax.portlet.RenderRequest;
import javax.portlet.RenderResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.portlet.ModelAndView;
import org.springframework.web.portlet.bind.annotation.ActionMapping;
import org.springframework.web.portlet.bind.annotation.RenderMapping;

import com.liferay.portal.kernel.exception.PortalException;
import com.liferay.portal.kernel.exception.SystemException;
import com.liferay.portal.kernel.util.ParamUtil;
import com.liferay.portal.kernel.util.WebKeys;
import com.liferay.portal.service.ServiceContext;
import com.liferay.portal.service.ServiceContextFactory;
import com.liferay.portal.service.UserServiceUtil;
import com.liferay.portal.theme.ThemeDisplay;
import com.tf.controller.BaseController;
import com.tf.model.Company;
import com.tf.model.User;
import com.tf.util.CompanyStatus;
import com.tf.util.Registration;


/**
 * This controller is responsible for request/response handling on Seller/Company screens
 * @author gautamkct
 *
 */
@Controller
@RequestMapping(value = "VIEW")
public class CompanyController extends BaseController {
	
	
	

	
	@RenderMapping
	protected ModelAndView renderCompanyList(@ModelAttribute("companyModel") Company company,ModelMap model,RenderRequest request, RenderResponse response) throws Exception {		
		_log.info("Render Company List");
		System.out.println("Size:::"+companyService.getCompanies());
		model.put("allCompanies", companyService.getCompanies());
		return new ModelAndView("companylist", model);		
	}
	
	@RenderMapping(params="render=createCompany")
	protected ModelAndView renderCreateCompany(@ModelAttribute("registration") Registration registration,ModelMap model,RenderRequest request, RenderResponse response) throws Exception {	
		long companyID = ParamUtil.getLong(request, "companyID"); 
		String userAction = ParamUtil.getString(request, "action","");
		Company company=null;
		User user=null;
		ThemeDisplay themeDispay=(ThemeDisplay)request.getAttribute(WebKeys.THEME_DISPLAY);
		List<User> users =new ArrayList<User>();
		if(companyID!=0){
			 company=companyService.findById(companyID);
			 users=userService.findUserByCompanyId(companyID);
			 
		}else if("registration".equals(userAction)){
			company=new Company();
			user=new User();
			company.setCompanyType("Seller");
			user.setType("Seller Admin");
			
		}
		registration.setCompany(company);
		registration.setUser(user);
		Map<String,String> userTypesMap=adminUtility.getUserTypes(adminUtility.getUserID(request), companyService.getCompanyTypebyID(companyID), request);
		model.put("currentUser",themeDispay.getRealUser());
		model.put("registration", registration);
		model.put("users", users);
		model.put("orgTypeMap", orgTypeMap);
		model.put("companyTypeMap", companyTypeMap);
		model.put("userTypesMap", userTypesMap);
		return new ModelAndView("createcompany", model);		
	}
	
	@RenderMapping(params="render=registerCompany")
	protected ModelAndView renderRegisterCompany(@ModelAttribute("registration") Registration registration,ModelMap model,RenderRequest request, RenderResponse response) throws Exception {	
		String currentScreen=ParamUtil.getString(request, "currentScreen","Company");
		if(registration.getCompany()==null){
			Company cmp = new Company();
			cmp.setCompanyType("Seller");
			registration.setCompany(cmp);
		}if(registration.getUser()==null){
			User user=new User();
			user.setType("Seller Admin");
			registration.setUser(user);		
		}	
		registration.getUser().setType("Seller Admin");
		model.put("registration", registration);
		model.put("orgTypeMap", orgTypeMap);
		model.put("currentScreen", currentScreen);
		return new ModelAndView("registration", model);		
	}
	
	@ActionMapping(params="action=homePage")
	protected void homePage( ModelMap model, 
												 ActionRequest request,
												 ActionResponse response) throws Exception {		
		response.sendRedirect("/web/guest/home");
	}
	
	@ActionMapping(params="action=regCompanyInfo")
	protected void addCompanyInfo(@ModelAttribute("registration") Registration registration,  ModelMap model, 
												 ActionRequest request,
												 ActionResponse response) throws Exception {
		response.setRenderParameter("render", "registerCompany");
		response.setRenderParameter("currentScreen", "User");
		System.out.println("Regitsration :: "+registration.getCompany());
		System.out.println("Regitsration :: "+registration.getCompany());
		model.put("registration", registration);
	}
	
	
	@ActionMapping(params="action=registerCompany")
	protected void registerCompany(@ModelAttribute("registration") Registration registration, 
												 ModelMap model, 
												 ActionRequest request,
												 ActionResponse response) throws Exception {
		System.out.println("Registration Model:::"+registration);
		User user=registration.getUser();
		com.liferay.portal.model.User lruser = addLiferayUser(user, request);
		//Company company=companyService.registerCompany(registration.getCompany());
		
		System.out.println("lruser:::"+lruser);
		//Liferay user has been added now we need to add user information to tf_user table
		//and map the same to Liferay userId and Company/Seller
		user.setActive(0);
		user.setLiferayUserId(lruser.getUserId());
		//userService.addorUpdateUser(user);
		Company company = registration.getCompany();
		Set<User> users=new LinkedHashSet<User>();
		users.add(user);
		company.setUsers(users);
		company=companyService.registerCompany(company);
		System.out.println("After User Added");
		StringBuilder loginURL=new StringBuilder("/web/guest/home");
		loginURL.append("?registration=success");
		response.sendRedirect(loginURL.toString());
	}
	
	
	@ActionMapping(params="action=createCompany")
	protected void callAction(@ModelAttribute("companyModel") Company company, 
												 ModelMap model, 
												 ActionRequest request,
												 ActionResponse response) throws Exception {
		System.out.println("companyModel:::"+company);	
		companyService.addCompany(company);
	}
	
	@ActionMapping(params="action=deleteCompany")
	protected void deleteCompany(@ModelAttribute("companyModel") Company company, 
												 ModelMap model, 
												 ActionRequest request,
												 ActionResponse response) throws Exception {
		System.out.println("companyModel:::"+company);
		company.setActivestatus(CompanyStatus.DELETED.getValue());
		companyService.addCompany(company);
	} 
	
	@RenderMapping(params="render=createUser")
	protected ModelAndView renderCreateUser(@ModelAttribute("userModel") User user,ModelMap model,RenderRequest request, RenderResponse response) throws Exception {	
		long userID = ParamUtil.getLong(request, "userID");
		long companyID = ParamUtil.getLong(request, "companyID");
		if(userID!=0){
			user=userService.findById(userID);	
		}
		Map<String,String> userTypesMap=adminUtility.getUserTypes(adminUtility.getUserID(request), companyService.getCompanyTypebyID(companyID), request);
		model.put("userModel", user);
		model.put("companyID", companyID);
		model.put("userTypesMap", userTypesMap);
		return new ModelAndView("createuser", model);		
	}
	
	@ActionMapping(params="action=createUser")
	protected void createUser(@ModelAttribute("userModel") User user, 
												 ModelMap model, 
												 ActionRequest request,
												 ActionResponse response) throws Exception {
		System.out.println("userModel:::"+user);	
		com.liferay.portal.model.User lruser = addLiferayUser(user, request);
		System.out.println("lruser:::"+lruser);
		System.out.println("User>>>>>>>>>>>>>>>>>>>>:::"+user);
		//Liferay user has been added now we need to add user information to tf_user table
		//and map the same to Liferay userId and Company/Seller
		user.setActive(0);
		user.setLiferayUserId(lruser.getUserId());
		userService.addorUpdateUser(user);
		System.out.println("After User Added");
		
		
	}

	private com.liferay.portal.model.User addLiferayUser(User user,
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
