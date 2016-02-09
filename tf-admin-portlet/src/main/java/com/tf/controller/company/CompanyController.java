package com.tf.controller.company;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;

import javax.portlet.ActionRequest;
import javax.portlet.ActionResponse;
import javax.portlet.PortletRequest;
import javax.portlet.RenderRequest;
import javax.portlet.RenderResponse;
import javax.portlet.ResourceRequest;
import javax.portlet.ResourceResponse;

import org.hibernate.exception.ConstraintViolationException;
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
import com.liferay.portal.DuplicateUserEmailAddressException;
import com.liferay.portal.DuplicateUserScreenNameException;
import com.liferay.portal.kernel.exception.PortalException;
import com.liferay.portal.kernel.servlet.SessionErrors;
import com.liferay.portal.kernel.util.ParamUtil;
import com.liferay.portal.kernel.util.WebKeys;
import com.liferay.portal.kernel.workflow.WorkflowConstants;
import com.liferay.portal.security.permission.PermissionChecker;
import com.liferay.portal.service.UserLocalServiceUtil;
import com.liferay.portal.theme.ThemeDisplay;
import com.mysql.jdbc.exceptions.jdbc4.MySQLIntegrityConstraintViolationException;
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
import com.tf.persistance.util.Constants;
import com.tf.util.OfficerDTO;
import com.tf.util.model.PaginationModel;


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
		try {
			List<Company> companyList = new ArrayList<Company>();
			ThemeDisplay themeDisplay = (ThemeDisplay) request
					.getAttribute(WebKeys.THEME_DISPLAY);
			companyList = prepareCompanyList(request, companyList, themeDisplay,model);			
			model.put("allCompanies", companyList);
		} catch (Exception e) {
			SessionErrors.add(request, "default-error-message");
			_log.error("CompanyController.renderCompanyList() - error occured while rendering company/companies"+e.getMessage());
		}
		return new ModelAndView("companylist", model);		
	}


	
	@RenderMapping(params="render=createCompany")
	protected ModelAndView renderCreateCompany(@ModelAttribute("companyModel") Company company,ModelMap model,RenderRequest request, RenderResponse response) throws Exception {	
		long companyID = ParamUtil.getLong(request, "companyID"); 
		ThemeDisplay themeDispay=(ThemeDisplay)request.getAttribute(WebKeys.THEME_DISPLAY);
		List<User> users;
		Map<String,String> userTypesMap;
		try {
			users = new ArrayList<User>();
			if (companyID != 0) {
				company = companyService.findById(companyID);
				users = userService.findUserByCompanyId(companyID);
				company.setOfficers(new LinkedHashSet<Officer>(officerService
						.findOfficersByCompanyId(companyID)));
				model.put("cmpType", companyTypeMap.get(Long.valueOf(company.getCompanyType())));
			}
			
			model.put("currentUser", themeDispay.getRealUser());
			model.put("users", users);
		} catch (Exception e) {
			SessionErrors.add(request, "default-error-message");
			_log.error("CompanyController.createCompany() - error occured while rendering add company screen"+e.getMessage());
		}
		model.put("companyModel", company);	
		model.put("orgTypeMap", orgTypeMap);
		model.put("companyTypeMap", companyTypeMap);
		
		
		return new ModelAndView("createcompany", model);		
	}
	

	
	@ActionMapping(params="action=homePage")
	protected void homePage( ModelMap model, 
												 ActionRequest request,
												 ActionResponse response) throws Exception {		
		response.sendRedirect("/web/guest/home");
	}
	

	
	@ActionMapping(params="action=createCompany")
	protected void createCompanyAction(@ModelAttribute("companyModel") Company company, 
												 ModelMap model, 
												 ActionRequest request,
												 ActionResponse response) throws Exception {
		try {
			if (company != null && company.getId() != null) {
				Company cmp = companyService.findById(company.getId());
				company.setUsers(cmp.getUsers());
				company.getAddress().setId(cmp.getAddress().getId());
				company.setCompanyType(cmp.getCompanyType());
			} else {
				company.getAddress().setCompany(company);
				//WIP to refractor this code.
				if (company != null && "1".equals(company.getCompanyType())) {
					Investor investor=new Investor();
					investor.setCreateDate(new Date());
					company.setInvestor(investor);
					company.getInvestor().setCompany(company);
				}
			}
			company.setActivestatus(CompanyStatus.NEW.getValue());
			companyService.addCompany(company);
		} catch (Exception e) {
			if(e instanceof ConstraintViolationException || e instanceof  MySQLIntegrityConstraintViolationException){
				SessionErrors.add(request, "error-company-registration");
				model.put("companyModel", company);
				response.setRenderParameter("render","createCompany");
			}else{
				SessionErrors.add(request, "default-error-message");
				_log.error("CompanyController.createCompanyAction() - error occured while saving  company information"+e.getMessage());
			}
			
		}
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
		Map<String,String> userTypesMap=adminUtility.getUserTypes(adminUtility.getUserID(request), companyTypeMap.get(Long.valueOf(companyService.getCompanyTypebyID(companyID))), request);
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
		Long companyID = ParamUtil.getLong(request, "companyID");
		Long officerId = ParamUtil.getLong(request, "officer",0);
		try{		
		user.setCompany(companyService.findById(companyID));
		liferayService.addUserInformation(user, request, createUser, themeDisplay, officerId);
		response.setRenderParameter("companyID", companyID.toString());
		response.setRenderParameter("render", "createCompany");
		
		}catch(PortalException e){
			response.setRenderParameter("companyID", companyID.toString());
			model.put("userModel", user);
			if(e instanceof DuplicateUserEmailAddressException){
				SessionErrors.add(request, "error-user-email");
			}else if(e instanceof DuplicateUserScreenNameException){					
				SessionErrors.add(request, "error-user-screenname");
			}else{
				SessionErrors.add(request, "default-error-message");
			}
			response.setRenderParameter("render", "createUser");
		}
		
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
		try {
			if (!StringUtils.isEmpty(companyNo)) {
				 officersList  = companyServices.getOfficersInfo(companyNo);	
				 List<Officer> officerList=transformOfficersModeltoOfficerslist(officersList.getItems(),company);
				 officerService.addOfficer(officerList);
				 company.setOfficers(new LinkedHashSet<Officer>(officerList));				 
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

	
	private PermissionChecker getPermissionChecker(PortletRequest request){
		ThemeDisplay themeDisplay = (ThemeDisplay)request.getAttribute(WebKeys.THEME_DISPLAY);
		PermissionChecker permissionChecker = themeDisplay.getPermissionChecker();
		return permissionChecker;		
	}
	
	private List<Company> prepareCompanyList(RenderRequest request,
			List<Company> companyList, ThemeDisplay themeDisplay,ModelMap model) {
		Long noOfRecords=0l;
		
		PaginationModel paginationModel = paginationUtil.preparePaginationModel(request);
		if(getPermissionChecker(request).isOmniadmin()  || request.isUserInRole(Constants.WHITEHALL_ADMIN)){
			companyList = companyService.getCompaniesByStatus(CompanyStatus.DELETED.getValue(),paginationModel.getStartIndex(),paginationModel.getPageSize());
			noOfRecords=companyService.getCompaniesCount(CompanyStatus.DELETED.getValue());
			
		}else if(request.isUserInRole(Constants.SCF_ADMIN)){
			long companyId=userService.getCompanyIDbyUserID(themeDisplay.getUserId());
			Company cmpObject = companyService.findById(companyId);
			companyList.add(cmpObject);
			noOfRecords=1l;
		}else{
			long companyId=userService.getCompanyIDbyUserID(themeDisplay.getUserId());
			Company cmpObject = companyService.findById(companyId);
			companyList.add(cmpObject);
			noOfRecords=1l;
		}
		
		paginationUtil.setPaginationInfo(noOfRecords,paginationModel);
		model.put("paginationModel", paginationModel);
		return companyList;
	}


}
