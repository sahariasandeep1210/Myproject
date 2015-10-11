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
import com.liferay.portal.kernel.json.JSONArray;
import com.liferay.portal.kernel.json.JSONFactoryUtil;
import com.liferay.portal.kernel.json.JSONObject;
import com.liferay.portal.kernel.util.ParamUtil;
import com.liferay.portal.kernel.util.WebKeys;
import com.liferay.portal.kernel.workflow.WorkflowConstants;
import com.liferay.portal.security.permission.PermissionChecker;
import com.liferay.portal.service.ServiceContext;
import com.liferay.portal.service.ServiceContextFactory;
import com.liferay.portal.service.UserLocalServiceUtil;
import com.liferay.portal.service.UserServiceUtil;
import com.liferay.portal.theme.ThemeDisplay;
import com.tf.controller.BaseController;
import com.tf.model.AddressModel;
import com.tf.model.Company;
import com.tf.model.CompanyModel;
import com.tf.model.Officer;
import com.tf.model.OfficerAddress;
import com.tf.model.OfficerList;
import com.tf.model.OfficerModel;
import com.tf.model.User;
import com.tf.persistance.util.CompanyStatus;
import com.tf.persistance.util.Constants;
import com.tf.util.OfficerDTO;
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
		List<Company> companyList=new ArrayList<Company>();
		ThemeDisplay themeDisplay = (ThemeDisplay)request.getAttribute(WebKeys.THEME_DISPLAY);
		if(getPermissionChecker(request).isOmniadmin() ){
			companyList = companyService.getCompaniesByStatus(CompanyStatus.DELETED.getValue());
		}else if(request.isUserInRole(Constants.SCF_ADMIN)){
			long companyId=userService.getCompanyIDbyUserID(themeDisplay.getUserId());
			Company cmpObject = companyService.findById(companyId);
			companyList.add(cmpObject);
		}
		model.put("allCompanies",companyList);
		return new ModelAndView("companylist", model);		
	}
	
	@RenderMapping(params="render=createCompany")
	protected ModelAndView renderCreateCompany(@ModelAttribute("companyModel") Company company,ModelMap model,RenderRequest request, RenderResponse response) throws Exception {	
		long companyID = ParamUtil.getLong(request, "companyID"); 
		ThemeDisplay themeDispay=(ThemeDisplay)request.getAttribute(WebKeys.THEME_DISPLAY);
		List<User> users =new ArrayList<User>();
		if(companyID!=0){
			 company=companyService.findById(companyID);
			 users=userService.findUserByCompanyId(companyID);
			 company.setOfficers(new LinkedHashSet<Officer>(officerService.findOfficersByCompanyId(companyID)));
		}	
		Map<String,String> userTypesMap=adminUtility.getUserTypes(adminUtility.getUserID(request), companyService.getCompanyTypebyID(companyID), request);
		model.put("currentUser",themeDispay.getRealUser());
		model.put("companyModel", company);
		model.put("users", users);
		//model.put("officers", officers);
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
		user.setActive(Boolean.FALSE);
		user.setLiferayUserId(lruser.getUserId());
		//userService.addorUpdateUser(user);
		Company company = registration.getCompany();
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
	
	
	@ActionMapping(params="action=createCompany")
	protected void callAction(@ModelAttribute("companyModel") Company company, 
												 ModelMap model, 
												 ActionRequest request,
												 ActionResponse response) throws Exception {
		System.out.println("companyModel:::"+company);	
		if(company !=null && company.getId() !=null){
			Company cmp = companyService.findById(company.getId());
			company.setUsers(cmp.getUsers());
			company.getAddress().setId(cmp.getAddress().getId());
			//Address add= cmp.getAddress();
			
		}else{
			//company.setAddress(company.getAddress());
			company.getAddress().setCompany(company);
		}
		//company=companyService.findById(company.getId());
		company.setActivestatus(CompanyStatus.NEW.getValue());
		companyService.addCompany(company);
	}
	
	@ActionMapping(params="action=deleteCompany")
	protected void deleteCompany(@ModelAttribute("companyModel") Company company, 
												 ModelMap model, 
												 ActionRequest request,
												 ActionResponse response) throws Exception {
		System.out.println("companyModel:::"+company);
		company.setActivestatus(CompanyStatus.DELETED.getValue());
		//this is soft delete and will return liferay userids
		//we are only update tf_company status to 4
		//and tf_user status to 5
		List<Long> liferayUserIds=companyService.deleteCompany(company.getId());	
		//Now updating status as Inactive(5) in Liferay User_ table
		for(Long userID : liferayUserIds){
			UserLocalServiceUtil.updateStatus(userID, WorkflowConstants.STATUS_INACTIVE);
		}
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
		System.out.println("userModel:::"+user);	
		Long companyID = ParamUtil.getLong(request, "companyID");
		Long officerId = ParamUtil.getLong(request, "officer");
		user.setCompany(companyService.findById(companyID));
		if(user.getId() ==null){			
			com.liferay.portal.model.User lruser = addLiferayUser(user, request);
			System.out.println("lruser:::"+lruser);
			user.setLiferayUserId(lruser.getUserId());
		}
		System.out.println("User>>>>>>>>>>>>>>>>>>>>:::"+user);
		//Liferay user has been added now we need to add user information to tf_user table
		//and map the same to Liferay userId and Company/Seller
		user.setActive(Boolean.FALSE);
		Long userID=userService.addorUpdateUser(user);
		if(officerId!=null && userID!=null){
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
				 //company.setOfficers(officerList);
				 
				// companyService.addCompany(company);
				 modelMap.addAttribute("officers", officerList);
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
