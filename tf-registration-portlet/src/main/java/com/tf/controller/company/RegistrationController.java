package com.tf.controller.company;

import java.io.IOException;
import java.util.ArrayList;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.StringTokenizer;

import javax.portlet.ActionRequest;
import javax.portlet.ActionResponse;
import javax.portlet.PortletRequest;
import javax.portlet.RenderRequest;
import javax.portlet.RenderResponse;
import javax.portlet.ResourceRequest;
import javax.portlet.ResourceResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.portlet.ModelAndView;
import org.springframework.web.portlet.bind.annotation.ActionMapping;
import org.springframework.web.portlet.bind.annotation.RenderMapping;
import org.springframework.web.portlet.bind.annotation.ResourceMapping;

import com.google.gson.Gson;
import com.liferay.portal.kernel.exception.PortalException;
import com.liferay.portal.kernel.exception.SystemException;
import com.liferay.portal.kernel.util.ParamUtil;
import com.liferay.portal.kernel.util.WebKeys;
import com.liferay.portal.model.Role;
import com.liferay.portal.security.permission.PermissionChecker;
import com.liferay.portal.service.RoleLocalServiceUtil;
import com.liferay.portal.service.ServiceContext;
import com.liferay.portal.service.ServiceContextFactory;
import com.liferay.portal.service.UserLocalServiceUtil;
import com.liferay.portal.service.UserServiceUtil;
import com.liferay.portal.theme.ThemeDisplay;
import com.tf.controller.BaseController;
import com.tf.model.AddressModel;
import com.tf.model.Company;
import com.tf.model.CompanyModel;
import com.tf.model.Investor;
import com.tf.model.Officer;
import com.tf.model.OfficerAddress;
import com.tf.model.OfficerList;
import com.tf.model.OfficerModel;
import com.tf.model.User;
import com.tf.persistance.util.CompanyStatus;
import com.tf.util.OfficerDTO;
import com.tf.util.Registration;


/**
 * This controller is responsible for request/response handling on Registration screens
 * @author gautamkct
 *
 */
@Controller
@RequestMapping(value = "VIEW")
public class RegistrationController extends BaseController {
	
	
	

	

	

	
	@RenderMapping
	protected ModelAndView renderRegisterCompany(@ModelAttribute("registration") Registration registration,ModelMap model,RenderRequest request, RenderResponse response) throws Exception {	
		String currentScreen=ParamUtil.getString(request, "currentScreen","Company");
		Company company=registration.getCompany();
		if(company!=null && "4".equals(company.getCompanyType())){
			//seller
			registration.getUser().setType("Seller Admin");
		} else if(company!=null && "1".equals(company.getCompanyType())){
			//Primary Investor 
			registration.getUser().setType("Primary Investor Admin");
		}
		//registration.getUser().setType("Seller Admin");
		model.put("registration", registration);
		model.put("orgTypeMap", orgTypeMap);
		model.put("companyTypeMap", companyTypeMap);
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
		ThemeDisplay themeDisplay=(ThemeDisplay)request.getAttribute(WebKeys.THEME_DISPLAY);
		User user=registration.getUser();
		com.liferay.portal.model.User lruser = addLiferayUser(user, request);
		//Company company=companyService.registerCompany(registration.getCompany());
		Role role =RoleLocalServiceUtil.getRole(themeDisplay.getCompanyId(), user.getType());
		UserLocalServiceUtil.addRoleUser(role.getRoleId(), lruser.getUserId());
		 UserLocalServiceUtil.updateUser(lruser);
		
		System.out.println("lruser:::"+lruser);
		//Liferay user has been added now we need to add user information to tf_user table
		//and map the same to Liferay userId and Company/Seller
		user.setActive(Boolean.FALSE);
		user.setLiferayUserId(lruser.getUserId());
		
		//userService.addorUpdateUser(user);
		
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
		System.out.println("After User Added");
		StringBuilder loginURL=new StringBuilder("/web/guest/home");
		loginURL.append("?registration=success");
		response.sendRedirect(loginURL.toString());
	}
	
	

	

	
	@RenderMapping(params="render=createUser")
	protected ModelAndView renderCreateUser(@ModelAttribute("userModel") User user,ModelMap model,RenderRequest request, RenderResponse response) throws Exception {	
		long userID = ParamUtil.getLong(request, "userID");
		long companyID = ParamUtil.getLong(request, "companyID");
		if(userID!=0){
			user=userService.findById(userID);	
		}
		List<Officer> officers=officerService.findOfficersByCompanyId(companyID);
		Map<String,String> userTypesMap=adminUtility.getUserTypes(adminUtility.getUserID(request), companyService.getCompanyTypebyID(companyID), request);
		model.put("userModel", user);
		model.put("officers", officers);
		model.put("companyID", companyID);
		model.put("userTypesMap", userTypesMap);
		return new ModelAndView("createuser", model);		
	}
	
	@ActionMapping(params="action=createUser")
	protected void createUser(@ModelAttribute("userModel") User user, 
												 ModelMap model, 
												 ActionRequest request,
												 ActionResponse response) throws Exception {
		boolean createUser=false;
		ThemeDisplay themeDisplay=(ThemeDisplay)request.getAttribute(WebKeys.THEME_DISPLAY);
		System.out.println("userModel:::"+user);	
		Long companyID = ParamUtil.getLong(request, "companyID");
		long officerId = ParamUtil.getLong(request, "officer",0);
		System.out.println("officerId::::::"+officerId);
		user.setCompany(companyService.findById(companyID));
		if(user.getId() ==null){	
			createUser=true;
			com.liferay.portal.model.User lruser = addLiferayUser(user, request);
			Role role =RoleLocalServiceUtil.getRole(themeDisplay.getCompanyId(), user.getType());
			UserLocalServiceUtil.addRoleUser(role.getRoleId(), lruser.getUserId());
			 UserLocalServiceUtil.updateUser(lruser);
			user.setLiferayUserId(lruser.getUserId());
		}
		System.out.println("User>>>>>>>>>>>>>>>>>>>>:::"+user);
		//Liferay user has been added now we need to add user information to tf_user table
		//and map the same to Liferay userId and Company/Seller
		user.setActive(Boolean.FALSE);
		Long userID=userService.addorUpdateUser(user);
		if(createUser && officerId!=0){
			Officer officer=officerService.findById(officerId);
			officer.setIduser(userID);
			officerService.addorUpdateOfficer(officer);
			
		}
		System.out.println("After User Added");
		response.setRenderParameter("companyID", companyID.toString());
		response.setRenderParameter("render", "createCompany");
		
		
	}
	
	@ResourceMapping(value = "fetchCompanyDetails")
	public void fetchCompanyDetails(ResourceRequest request,
			ResourceResponse response) throws IOException {
		String companyNo = ParamUtil.getString(request, "companyNo");
		System.out.println("companyNo:::::"+companyNo);
		 String companyModelString="";
		//JSONArray cmpArray = JSONFactoryUtil.createJSONArray();	
		
		try {
			if (!StringUtils.isEmpty(companyNo)) {
				//JSONObject companyObject = JSONFactoryUtil.createJSONObject();	
				CompanyModel cmpModel  = companyServices.getCompanyInfo(companyNo);			
				Gson gson = new Gson();
				companyModelString = gson.toJson(cmpModel);			
			}
			System.out.println(companyModelString);
			response.getWriter().println(companyModelString);
		} catch (Exception e) {
			_log.error("Error occured while fetching company information"+e.getMessage());
			response.setProperty(ResourceResponse.HTTP_STATUS_CODE, "400");
		}
		
	}
	
	@ResourceMapping(value = "fetchOfficers")
	public ModelAndView fetchOfficers(ResourceRequest request,
			ResourceResponse response,ModelMap modelMap) throws IOException {
		String companyNo = ParamUtil.getString(request, "companyNo"); 
		Long companyId = ParamUtil.getLong(request, "companyId");
		Company company=companyService.findById(companyId);
		OfficerList officersList=new OfficerList();
		System.out.println("companyNo:::::"+companyNo);
		//JSONArray cmpArray = JSONFactoryUtil.createJSONArray();	
		
		try {
			if (!StringUtils.isEmpty(companyNo)) {
				//JSONObject companyObject = JSONFactoryUtil.createJSONObject();	
				 officersList  = companyServices.getOfficersInfo(companyNo);	
				 List<Officer> officerList=transformOfficersModeltoOfficerslist(officersList.getItems(),company);
				 officerService.addOfficer(officerList);
				 company.setOfficers(new LinkedHashSet<Officer>(officerList));
				 
				// companyService.addCompany(company);
				 modelMap.addAttribute("companyModel", company);
			}
			
			return new ModelAndView("officerslist");
		} catch (Exception e) {
			_log.error("Error occured while fetching officers information"+e.getMessage());
			response.setProperty(ResourceResponse.HTTP_STATUS_CODE, "400");
		}
		return new ModelAndView("officerslist");
		
	}
	
	@ResourceMapping(value = "fetchOfficerInfo")
	public void fetchOfficeInformation(ResourceRequest request,
			ResourceResponse response,ModelMap modelMap) throws IOException {
		Long officerId = ParamUtil.getLong(request, "officerId");		
		String officerInfoString="";
		
		try {
			if (officerId!=null) {
				Officer officer=officerService.findById(officerId);
				OfficerDTO officerDTO=new OfficerDTO();
				
				StringTokenizer nameSt = new StringTokenizer(officer.getName(),",");
				officerDTO.setLastName(nameSt.nextToken());
				StringTokenizer firstNameSt = new StringTokenizer(nameSt.nextToken()," ");
				officerDTO.setFirstName(firstNameSt.nextToken());
				officerDTO.setMiddleName(firstNameSt.hasMoreTokens()? firstNameSt.nextToken():"");
				officerDTO.setRole(officer.getOfficerRole());
				officerDTO.setOccupation(officer.getOccupation());
				
				Gson gson = new Gson();
				officerInfoString = gson.toJson(officerDTO);	
				response.getWriter().println(officerInfoString);
				//JSONObject companyObject = JSONFactoryUtil.createJSONObject();	
				
				 //company.setOfficers(officerList);
				 
				// companyService.addCompany(company);
				//response.getWriter().println(officersArray);
			}
			
		} catch (Exception e) {
			_log.error("Error occured while fetching officer information"+e.getMessage());
			response.setProperty(ResourceResponse.HTTP_STATUS_CODE, "400");
		}
		
	}

	private List<Officer> transformOfficersModeltoOfficerslist(List<OfficerModel> inputOfficersList,Company company) {
		List<Officer> officerList=new ArrayList<Officer>();
		for(OfficerModel officerModel : inputOfficersList){
			Officer officer = new Officer();
			setOfficersAddreesInfo(officer,officerModel.getAddress());
			officer.setName(officerModel.getName());
			officer.setOfficerRole(officerModel.getOfficer_role());
			officer.setAppointedDate(officerModel.getAppointed_on());
			officer.setResignedDate(officerModel.getResigned_on());
			officer.setNationality(officerModel.getNationality());
			officer.setOccupation(officerModel.getOccupation());
			officer.setCompany(company);
			officerList.add(officer);			
		}
		
		return officerList;
		
	}

	private void setOfficersAddreesInfo(Officer officer,AddressModel address) {
		OfficerAddress officerAdd=new OfficerAddress();
		officerAdd.setAddressLine1(address.getAddress_line_1());
		officerAdd.setAddressLine2(address.getAddress_line_2());
		officerAdd.setLocality(address.getLocality());
		officerAdd.setRegion(address.getRegion());
		officerAdd.setCountry(address.getCountry());
		officerAdd.setPostalCode(address.getPostal_code());	
		officerAdd.setOfficer(officer);	
		officer.setOfficerAddress(officerAdd);
		
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
	
	private PermissionChecker getPermissionChecker(PortletRequest request){
		ThemeDisplay themeDisplay = (ThemeDisplay)request.getAttribute(WebKeys.THEME_DISPLAY);
		PermissionChecker permissionChecker = themeDisplay.getPermissionChecker();
		return permissionChecker;		
	}


}
