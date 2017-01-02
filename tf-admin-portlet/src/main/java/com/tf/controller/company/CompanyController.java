package com.tf.controller.company;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;
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
import com.liferay.portal.kernel.exception.SystemException;
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
import com.tf.model.SellerScfCompanyMapping;
import com.tf.model.User;
import com.tf.persistance.util.CompanyStatus;
import com.tf.persistance.util.Constants;
import com.tf.util.OfficerDTO;
import com.tf.util.ReportUtility;
import com.tf.util.model.PaginationModel;

/**
 * This controller is responsible for request/response handling on
 * Seller/Company screens
 * 
 * @author gautamkct
 *
 */
@Controller
@RequestMapping(value = "VIEW")
public class CompanyController extends BaseController {
	
	@RenderMapping
	protected ModelAndView renderCompanyList(
			@ModelAttribute("companyModel") Company company, ModelMap model,
			RenderRequest request, RenderResponse response) throws Exception {
		_log.info("CompanyController :: Render Company List");
		try {
			String searchValue = ParamUtil.getString(request, "Search");
			List<Company> companyList = new ArrayList<Company>();
			ThemeDisplay themeDisplay = (ThemeDisplay) request
					.getAttribute(WebKeys.THEME_DISPLAY);
			if(searchValue==null || searchValue==""){
				
				companyList = prepareCompanyList(request, companyList,
						themeDisplay, model);
			}
			else{
				companyList = prepareCompanyListFilter(request, companyList,
						themeDisplay, model,searchValue);
			
			}
			model.put("allCompanies", companyList);
			model.put("search", searchValue);
			if(request.isUserInRole(Constants.SCF_ADMIN)){
				long compId = userService.getCompanybyUserID(themeDisplay.getUserId()).getId();
				model.put("companyId", compId);
			}

		} catch (Exception e) {
			SessionErrors.add(request, "default-error-message");
			_log.error("CompanyController.renderCompanyList() - error occured while rendering company/companies"
					+ e.getMessage());
		}
		return new ModelAndView("companylist", model);
	}

	

	@RenderMapping(params = "render=createCompany")
	protected ModelAndView renderCreateCompany(
			@ModelAttribute("companyModel") Company company, ModelMap model,
			RenderRequest request, RenderResponse response) throws Exception {
		long companyID = ParamUtil.getLong(request, "companyID");
		ThemeDisplay themeDispay = (ThemeDisplay) request
				.getAttribute(WebKeys.THEME_DISPLAY);
		List<User> users;
		List<Company> companyList = new ArrayList<Company>();
		List<SellerScfCompanyMapping> sellerScfMappings=null; 
		List<Company> scfFinalCompanyList=null;
		List<Company> companies=null;
		long sellerId=0l;
		long scfCompanyId=0l;
		try {
			users = new ArrayList<User>();
			if (companyID != 0) {
				company = companyService.findById(companyID);
				users = userService.findUserByCompanyId(companyID);
				company.setOfficers(new LinkedHashSet<Officer>(officerService.findOfficersByCompanyId(companyID)));
				model.put("cmpType", companyTypeMap.get(Long.valueOf(company.getCompanyType())));
			}
			if(request.isUserInRole(Constants.SCF_ADMIN)){
				model.put("userType", Constants.SCF_ADMIN);
				sellerId=ParamUtil.getLong(request, "sellerCompany");
			}
			if(request.isUserInRole(Constants.SELLER_ADMIN)){
				model.put("userType", Constants.SELLER_ADMIN);
				scfCompanyId=ParamUtil.getLong(request, "scfCompany");
				model.put("companyId", companyID);
				
			}
			
			ThemeDisplay themeDisplay = (ThemeDisplay) request.getAttribute(WebKeys.THEME_DISPLAY);
			if(request.isUserInRole(Constants.SCF_ADMIN)){			
				long companyId = userService.getCompanybyUserID(themeDisplay.getUserId()).getId();
				model.put("companyId", companyId);
			}
			/**
			 * When the SCF_Admin gets login.
			 * Adding the seller
			 */
			if(sellerId>0 && request.isUserInRole(Constants.SCF_ADMIN) ){
				long compId = userService.getCompanybyUserID(themeDisplay.getUserId()).getId();
				Company comp =companyService.findById(sellerId);
				SellerScfCompanyMapping sellerScfMapping = new SellerScfCompanyMapping();
				sellerScfMapping.setScfCompany(compId);
				sellerScfMapping.setSellerCompany(comp);
				sellerScfMapping.setStatus(Constants.STATUS.APPROVED.getValue());
				sellerScfMapping.setUpdateDate(Calendar.getInstance().getTime());
				sellerScfMappingService.saveSeller(sellerScfMapping);
			}
			/**
			 * When the Seller gets login.
			 * Adding the SCF_Company
			 */
			else if(scfCompanyId>0 && request.isUserInRole(Constants.SELLER_ADMIN)){
				long compId = userService.getCompanybyUserID(themeDisplay.getUserId()).getId();
				Company comp =companyService.findById(compId);
				SellerScfCompanyMapping sellerScfMapping = new SellerScfCompanyMapping();
				sellerScfMapping.setScfCompany(scfCompanyId);
				sellerScfMapping.setSellerCompany(comp);
				sellerScfMapping.setStatus(Constants.STATUS.PENDING.getValue());
				sellerScfMapping.setComment("Member Requetsed");
				sellerScfMapping.setUpdateDate(Calendar.getInstance().getTime());
				sellerScfMappingService.saveSeller(sellerScfMapping);
			}
			Long noOfRecords = 0l;
			PaginationModel paginationModel = paginationUtil.preparePaginationModel(request);
			if(request.isUserInRole(Constants.SCF_ADMIN)){
				sellerScfMappings=sellerScfMappingService.getSellerScfMapping(paginationModel.getStartIndex(), paginationModel.getPageSize(),null,companyID,null);
				companyList = companyService.getCompanies("4");
				companies=prepareCompanyList(companyList,sellerScfMappings,Constants.SCF_ADMIN);
			}else{
				sellerScfMappings=sellerScfMappingService.getSellerScfMapping(paginationModel.getStartIndex(), paginationModel.getPageSize(),companyID,null,null);
				companyList = companyService.getCompanies("5");
				companies=prepareCompanyList(companyList,sellerScfMappings,Constants.SELLER_ADMIN);
				sellerScfMappings=prepareCompanyListForListing(sellerScfMappings);
			}
			noOfRecords=sellerScfMappingService.getSellerScfMappingCount();
		
			paginationUtil.setPaginationInfo(noOfRecords, paginationModel);
			model.put("companies", companies);
			model.put("sellerScfMappings", sellerScfMappings);
			model.put("currentUser", themeDispay.getRealUser());
			model.put("users", users);

		} catch (Exception e) {
			e.printStackTrace();
			SessionErrors.add(request, "default-error-message");
			_log.error("CompanyController.createCompany() - error occured while rendering add company screen"+ e.getMessage());
		}
		model.put("companyModel", company);
		model.put("orgTypeMap", orgTypeMap);
		model.put("companyTypeMap", companyTypeMap);

		return new ModelAndView("createcompany", model);
	}
	
	
	
	@RenderMapping(params = "render=myTaskRender")
	protected ModelAndView renderCreateCompany(
			RenderRequest request, RenderResponse response) throws Exception {
		long companyID=liferayUtility.getWhitehallCompanyID(request);
		List<SellerScfCompanyMapping> sellerScfMappings=null; 
		PaginationModel paginationModel = paginationUtil.preparePaginationModel(request);
		sellerScfMappings = sellerScfMappingService.getSellerScfMapping(
				paginationModel.getStartIndex(), paginationModel.getPageSize(),null, companyID, new String[]{Constants.STATUS.PENDING.getValue()});
		ModelMap model=new ModelMap();
		model.put("sellerScfMappings", sellerScfMappings);
		return new ModelAndView("mytask", model);
	}
	

	@ActionMapping(params = "action=taskApproveReject")
	public void closeSessionValue(ActionRequest request,ActionResponse response, ModelMap modelMap) throws IOException {
		String id=request.getParameter("id");
		String status=request.getParameter("status");
		String comment=request.getParameter("comment");
		if(org.apache.commons.lang.StringUtils.isNotEmpty(status) && org.apache.commons.lang.StringUtils.isNotEmpty(id)){
			boolean statusBoolean=Boolean.parseBoolean(status);
			sellerScfMappingService.updateStatus(Long.parseLong(id), statusBoolean?Constants.STATUS.APPROVED.getValue():Constants.STATUS.REJECTED.getValue(),comment);
			response.sendRedirect(liferayUtility.getPortletURL(request, "tf-company-portlet", "render", "myTaskRender", true));
		}
	}
	
	private List<Company> prepareCompanyList(List<Company> companyList,
		  List<SellerScfCompanyMapping> sellerScfMappings,String companyType){
		  Company company=null;
		  for(SellerScfCompanyMapping seller: sellerScfMappings){
			  if(companyType.equalsIgnoreCase(Constants.SELLER_ADMIN)){
				  List<Company> companies =companyService.getCompaniesById(seller.getScfCompany());
				  if(companies!=null && companies.size()>0){
					  company=companies.get(0);
					  if(company.getId()==seller.getScfCompany()){
							 companyList.remove(company);	
						 }	  
				  }
             }else{
            	 company =seller.getSellerCompany();
            	 if(company.getId()==seller.getSellerCompany().getId()){
					 companyList.remove(company);	
				 }
             }
	        }	
		    return companyList;		
	   }
	
	private List<SellerScfCompanyMapping> prepareCompanyListForListing(List<SellerScfCompanyMapping> sellerScfMappings){
			  for(SellerScfCompanyMapping seller: sellerScfMappings){
					  List<Company> companies =companyService.getCompaniesById(seller.getScfCompany());
					  seller.setSellerCompany(companies.get(0));
		        }	
			    return sellerScfMappings;		
		   }
	
	

	@ActionMapping(params = "action=homePage")
	protected void homePage(ModelMap model, ActionRequest request,
			ActionResponse response) throws Exception {
		response.sendRedirect("/web/guest/home");
	}

	@ActionMapping(params = "action=createCompany")
	protected void createCompanyAction(
			@ModelAttribute("companyModel") Company company, ModelMap model,
			ActionRequest request, ActionResponse response) throws Exception {
		try {
			if (company != null && company.getId() != null) {
				Company cmp = companyService.findById(company.getId());
				company.setUsers(cmp.getUsers());
				company.getAddress().setId(cmp.getAddress().getId());
				//company should only be updated by omni admin after registration
				if (getPermissionChecker(request).isOmniadmin()
						|| request.isUserInRole(Constants.WHITEHALL_ADMIN)){
					company.setCompanyType(company.getCompanyType());
				}else{
					company.setCompanyType(cmp.getCompanyType());
				}
				
			} else {
				company.getAddress().setCompany(company);
				// WIP to refractor this code.
				if (company != null && "1".equals(company.getCompanyType())) {
					Investor investor = new Investor();
					investor.setCreateDate(new Date());
					company.setInvestor(investor);
					company.getInvestor().setCompany(company);
				}
			}
			company.setActivestatus(CompanyStatus.NEW.getValue());
			companyService.addCompany(company);
		} catch (Exception e) {
			if (e instanceof ConstraintViolationException
					|| e instanceof MySQLIntegrityConstraintViolationException) {
				SessionErrors.add(request, "error-company-registration");
				model.put("companyModel", company);
				response.setRenderParameter("render", "createCompany");
			} else {
				SessionErrors.add(request, "default-error-message");
				_log.error("CompanyController.createCompanyAction() - error occured while saving  company information"
						+ e.getMessage());
			}

		}
	}

	@ActionMapping(params = "action=deleteCompany")
	protected void deleteCompany(
			@ModelAttribute("companyModel") Company company, ModelMap model,
			ActionRequest request, ActionResponse response) throws Exception {
		System.out.println("companyModel:::" + company);
		company.setActivestatus(CompanyStatus.DELETED.getValue());
		// this is soft delete and will return liferay userids
		// we are only update tf_company status to 4
		// and tf_user status to 5
		List<Long> liferayUserIds = companyService.deleteCompany(company
				.getId());
		// Now updating status as Inactive(5) in Liferay User_ table
		for (Long userID : liferayUserIds) {
			UserLocalServiceUtil.updateStatus(userID,
					WorkflowConstants.STATUS_INACTIVE);
		}
	}

	@RenderMapping(params = "render=createUser")
	protected ModelAndView renderCreateUser(
			@ModelAttribute("userModel") User user, ModelMap model,
			RenderRequest request, RenderResponse response) throws Exception {
		long userID = ParamUtil.getLong(request, "userID");
		long companyID = ParamUtil.getLong(request, "companyID");
		if (userID != 0) {
			user = userService.findById(userID);
			synchronizeDataFromLifeary(user);
		}
		List<Officer> officers = officerService
				.findOfficersByCompanyId(companyID);
		Map<String, String> userTypesMap = adminUtility.getUserTypes(
				adminUtility.getUserID(request),
				companyTypeMap.get(Long.valueOf(companyService
						.getCompanyTypebyID(companyID))), request);
		model.put("userModel", user);
		model.put("officers", officers);
		model.put("companyID", companyID);
		model.put("userTypesMap", userTypesMap);
		return new ModelAndView("createuser", model);
	}

	private void synchronizeDataFromLifeary(User user) throws PortalException, SystemException {
	    boolean updateFlag=false;
	    com.liferay.portal.model.User lrUser=UserLocalServiceUtil.getUser(user.getLiferayUserId());
	    if(!(lrUser.getFirstName().equalsIgnoreCase(user.getFirstName()))){
		user.setFirstName(lrUser.getFirstName());
		updateFlag=true;
	    }
	    if(!(lrUser.getLastName().equalsIgnoreCase(user.getLastName()))){
		user.setLastName(lrUser.getLastName());
		updateFlag=true;
	    }
	    if(!(lrUser.getMiddleName().equalsIgnoreCase(user.getMiddleName()))){
		user.setMiddleName(lrUser.getMiddleName());
		updateFlag=true;
	    }
	    if(!(lrUser.getEmailAddress().equalsIgnoreCase(user.getEmail()))){
		user.setEmail(lrUser.getEmailAddress());
		updateFlag=true;
	    }
	    if(!(lrUser.getScreenName().equalsIgnoreCase(user.getUsername()))){
		user.setUsername(lrUser.getScreenName());
		updateFlag=true;
	    }
	    
	    if(updateFlag){
		//this code can be optimized
		user = userService.findById(userService.addorUpdateUser(user));
	    }
	    
	}

	@ActionMapping(params = "action=createUser")
	protected void createUser(@ModelAttribute("userModel") User user,
			ModelMap model, ActionRequest request, ActionResponse response)
			throws Exception {
		boolean createUser = false;
		ThemeDisplay themeDisplay = (ThemeDisplay) request
				.getAttribute(WebKeys.THEME_DISPLAY);
		Long companyID = ParamUtil.getLong(request, "companyID");
		Long officerId = ParamUtil.getLong(request, "officer", 0);
		try {
			user.setCompany(companyService.findById(companyID));
			liferayService.addUserInformation(user, request, createUser,
					themeDisplay, officerId);
			response.setRenderParameter("companyID", companyID.toString());
			response.setRenderParameter("render", "createCompany");

		} catch (Exception e) {
			response.setRenderParameter("companyID", companyID.toString());
			model.put("userModel", user);
			if (e instanceof DuplicateUserEmailAddressException) {
				SessionErrors.add(request, "error-user-email");
			} else if (e instanceof DuplicateUserScreenNameException) {
				SessionErrors.add(request, "error-user-screenname");
			} else {
				SessionErrors.add(request, "default-error-message");
			}
			response.setRenderParameter("render", "createUser");
		}

	}

	@ResourceMapping(value = "fetchCompanyDetails")
	public void fetchCompanyDetails(ResourceRequest request,
			ResourceResponse response) throws IOException {
		String companyNo = ParamUtil.getString(request, "companyNo");
		System.out.println("companyNo:::::" + companyNo);
		String companyModelString = "";
		// JSONArray cmpArray = JSONFactoryUtil.createJSONArray();

		try {
			if (!StringUtils.isEmpty(companyNo)) {
				// JSONObject companyObject =
				// JSONFactoryUtil.createJSONObject();
				CompanyModel cmpModel = companyServices
						.getCompanyInfo(companyNo);
				Gson gson = new Gson();
				companyModelString = gson.toJson(cmpModel);
			}
			System.out.println(companyModelString);
			response.getWriter().println(companyModelString);
		} catch (Exception e) {
			_log.error("Error occured while fetching company information"
					+ e.getMessage());
			response.setProperty(ResourceResponse.HTTP_STATUS_CODE, "400");
		}

	}

	@ResourceMapping(value = "fetchOfficers")
	public ModelAndView fetchOfficers(ResourceRequest request,
			ResourceResponse response, ModelMap modelMap) throws IOException {
		String companyNo = ParamUtil.getString(request, "companyNo");
		Long companyId = ParamUtil.getLong(request, "companyId");
		Company company = companyService.findById(companyId);
		OfficerList officersList = new OfficerList();
		try {
			if (!StringUtils.isEmpty(companyNo)) {
				officersList = companyServices.getOfficersInfo(companyNo);
				List<Officer> officerList = transformOfficersModeltoOfficerslist(
						officersList.getItems(), company);
				officerService.addOfficer(officerList);
				company.setOfficers(new LinkedHashSet<Officer>(officerList));
				modelMap.addAttribute("companyModel", company);
			}

			return new ModelAndView("officerslist");
		} catch (Exception e) {
			_log.error("Error occured while fetching officers information"
					+ e.getMessage());
			response.setProperty(ResourceResponse.HTTP_STATUS_CODE, "400");
		}
		return new ModelAndView("officerslist");

	}

	@ResourceMapping(value = "fetchOfficerInfo")
	public void fetchOfficeInformation(ResourceRequest request,
			ResourceResponse response, ModelMap modelMap) throws IOException {
		Long officerId = ParamUtil.getLong(request, "officerId");
		String officerInfoString = "";

		try {
			if (officerId != null) {
				Officer officer = officerService.findById(officerId);
				OfficerDTO officerDTO = new OfficerDTO();

				StringTokenizer nameSt = new StringTokenizer(officer.getName(),
						",");
				officerDTO.setLastName(nameSt.nextToken());
				StringTokenizer firstNameSt = new StringTokenizer(
						nameSt.nextToken(), " ");
				officerDTO.setFirstName(firstNameSt.nextToken());
				officerDTO
						.setMiddleName(firstNameSt.hasMoreTokens() ? firstNameSt
								.nextToken() : "");
				officerDTO.setRole(officer.getOfficerRole());
				officerDTO.setOccupation(officer.getOccupation());

				Gson gson = new Gson();
				officerInfoString = gson.toJson(officerDTO);
				response.getWriter().println(officerInfoString);
				// JSONObject companyObject =
				// JSONFactoryUtil.createJSONObject();

				// company.setOfficers(officerList);

				// companyService.addCompany(company);
				// response.getWriter().println(officersArray);
			}

		} catch (Exception e) {
			_log.error("Error occured while fetching officer information"
					+ e.getMessage());
			response.setProperty(ResourceResponse.HTTP_STATUS_CODE, "400");
		}

	}

	private List<Officer> transformOfficersModeltoOfficerslist(
			List<OfficerModel> inputOfficersList, Company company) {
		List<Officer> officerList = new ArrayList<Officer>();
		for (OfficerModel officerModel : inputOfficersList) {
			Officer officer = new Officer();
			setOfficersAddreesInfo(officer, officerModel.getAddress());
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

	private void setOfficersAddreesInfo(Officer officer, AddressModel address) {
		OfficerAddress officerAdd = new OfficerAddress();
		officerAdd.setAddressLine1(address.getAddress_line_1());
		officerAdd.setAddressLine2(address.getAddress_line_2());
		officerAdd.setLocality(address.getLocality());
		officerAdd.setRegion(address.getRegion());
		officerAdd.setCountry(address.getCountry());
		officerAdd.setPostalCode(address.getPostal_code());
		officerAdd.setOfficer(officer);
		officer.setOfficerAddress(officerAdd);

	}

	private PermissionChecker getPermissionChecker(PortletRequest request) {
		ThemeDisplay themeDisplay = (ThemeDisplay) request
				.getAttribute(WebKeys.THEME_DISPLAY);
		PermissionChecker permissionChecker = themeDisplay
				.getPermissionChecker();
		return permissionChecker;
	}

	private List<Company> prepareCompanyList(RenderRequest request,
			List<Company> companyList, ThemeDisplay themeDisplay, ModelMap model) {
		Long noOfRecords = 0l;

		PaginationModel paginationModel = paginationUtil
				.preparePaginationModel(request);
		if (getPermissionChecker(request).isOmniadmin()
				|| request.isUserInRole(Constants.WHITEHALL_ADMIN)) {
			_log.info("User is Omni Admin");
			companyList = companyService.getCompaniesByStatus(
					CompanyStatus.DELETED.getValue(),
					paginationModel.getStartIndex(),
					paginationModel.getPageSize());
			noOfRecords = companyService
					.getCompaniesCount(CompanyStatus.DELETED.getValue());
			_log.info("noOfRecords:::"+noOfRecords);

		} else if (request.isUserInRole(Constants.SCF_ADMIN)) {
			_log.info("User is SCF Admin");
			long companyId = userService.getCompanyIDbyUserID(themeDisplay
					.getUserId());
			Company cmpObject = companyService.findById(companyId);
			companyList.add(cmpObject);
			noOfRecords = 1l;
		} else if (request.isUserInRole(Constants.PRIMARY_INVESTOR_ADMIN)){
			_log.info("User is Primary Investor Admin");
			long companyId = userService.getCompanyIDbyUserID(themeDisplay
					.getUserId());
			Company cmpObject = companyService.findById(companyId);
			companyList.add(cmpObject);
			noOfRecords = 1l;
			
		} else {
			_log.info("User is Seller Admin");
			long companyId = userService.getCompanyIDbyUserID(themeDisplay
					.getUserId());
			Company cmpObject = companyService.findById(companyId);
			companyList.add(cmpObject);
			noOfRecords = 1l;
		}

		paginationUtil.setPaginationInfo(noOfRecords, paginationModel);
		model.put("paginationModel", paginationModel);
		return companyList;
	}
	
	private List<Company> prepareCompanyListFilter(RenderRequest request,
			List<Company> companyList, ThemeDisplay themeDisplay, ModelMap model,String searchValue) {
		Long noOfRecords = 0l;

		PaginationModel paginationModel = paginationUtil
				.preparePaginationModel(request);
		if (getPermissionChecker(request).isOmniadmin()
				|| request.isUserInRole(Constants.WHITEHALL_ADMIN)) {
			_log.info("User is Omni Admin");
			companyList = companyService.getCompaniesByStatusFilter(
					CompanyStatus.DELETED.getValue(),
					paginationModel.getStartIndex(),
					paginationModel.getPageSize(),searchValue);
			noOfRecords = companyService
					.getCompaniesCount(CompanyStatus.DELETED.getValue());
			_log.info("noOfRecords:::"+noOfRecords);

		}else if (request.isUserInRole(Constants.SCF_ADMIN)) {
			_log.info("User is SCF Admin");
			long companyId = userService.getCompanyIDbyUserID(themeDisplay
					.getUserId());
			Company cmpObject = companyService.findById(companyId);
			companyList.add(cmpObject);
			noOfRecords = 1l;
		} else if (request.isUserInRole(Constants.PRIMARY_INVESTOR_ADMIN)){
			_log.info("User is Primary Investor Admin");
			long companyId = userService.getCompanyIDbyUserID(themeDisplay
					.getUserId());
			Company cmpObject = companyService.findById(companyId);
			companyList.add(cmpObject);
			noOfRecords = 1l;
			
		} else {
			_log.info("User is Seller Admin");
			long companyId = userService.getCompanyIDbyUserID(themeDisplay
					.getUserId());
			Company cmpObject = companyService.findById(companyId);
			companyList.add(cmpObject);
			noOfRecords = 1l;
		}

		paginationUtil.setPaginationInfo(noOfRecords, paginationModel);
		model.put("paginationModel", paginationModel);
		return companyList;
	}
	
	
	@RenderMapping(params = "render=createInvestor")
	protected ModelAndView renderCreateInvestor(
			@ModelAttribute("companyModel") Company company, ModelMap model,
			RenderRequest request, RenderResponse response) throws Exception {
		long companyID = ParamUtil.getLong(request, "companyID");
		ThemeDisplay themeDispay = (ThemeDisplay) request
				.getAttribute(WebKeys.THEME_DISPLAY);
		List<User> users;
		List<Company> companyList = new ArrayList<Company>();
		List<SellerScfCompanyMapping> sellerScfMappings=null; 
		List<Company> scfFinalCompanyList=null;
		List<Company> companies=null;
		long sellerId=0l;
		long scfCompanyId=0l;
		try {
			users = new ArrayList<User>();
			if (companyID != 0) {
				company = companyService.findById(companyID);
				users = userService.findUserByCompanyId(companyID);
				company.setOfficers(new LinkedHashSet<Officer>(officerService.findOfficersByCompanyId(companyID)));
				model.put("cmpType", companyTypeMap.get(Long.valueOf(company.getCompanyType())));
			}
			if(request.isUserInRole(Constants.SCF_ADMIN)){
				model.put("userType", Constants.SCF_ADMIN);
				sellerId=ParamUtil.getLong(request, "sellerCompany");
			}
			if(request.isUserInRole(Constants.SELLER_ADMIN)){
				model.put("userType", Constants.SELLER_ADMIN);
				scfCompanyId=ParamUtil.getLong(request, "scfCompany");
				model.put("companyId", companyID);
				
			}
			
			ThemeDisplay themeDisplay = (ThemeDisplay) request.getAttribute(WebKeys.THEME_DISPLAY);
			if(request.isUserInRole(Constants.SCF_ADMIN)){			
				long companyId = userService.getCompanybyUserID(themeDisplay.getUserId()).getId();
				model.put("companyId", companyId);
			}
			/**
			 * When the SCF_Admin gets login.
			 * Adding the seller
			 */
			if(sellerId>0 && request.isUserInRole(Constants.SCF_ADMIN) ){
				long compId = userService.getCompanybyUserID(themeDisplay.getUserId()).getId();
				Company comp =companyService.findById(sellerId);
				SellerScfCompanyMapping sellerScfMapping = new SellerScfCompanyMapping();
				sellerScfMapping.setScfCompany(compId);
				sellerScfMapping.setSellerCompany(comp);
				sellerScfMapping.setStatus(Constants.STATUS.APPROVED.getValue());
				sellerScfMapping.setUpdateDate(Calendar.getInstance().getTime());
				sellerScfMappingService.saveSeller(sellerScfMapping);
			}
			/**
			 * When the Seller gets login.
			 * Adding the SCF_Company
			 */
			else if(scfCompanyId>0 && request.isUserInRole(Constants.SELLER_ADMIN)){
				long compId = userService.getCompanybyUserID(themeDisplay.getUserId()).getId();
				Company comp =companyService.findById(compId);
				SellerScfCompanyMapping sellerScfMapping = new SellerScfCompanyMapping();
				sellerScfMapping.setScfCompany(scfCompanyId);
				sellerScfMapping.setSellerCompany(comp);
				sellerScfMapping.setStatus(Constants.STATUS.PENDING.getValue());
				sellerScfMapping.setComment("Member Requetsed");
				sellerScfMapping.setUpdateDate(Calendar.getInstance().getTime());
				sellerScfMappingService.saveSeller(sellerScfMapping);
			}
			Long noOfRecords = 0l;
			PaginationModel paginationModel = paginationUtil.preparePaginationModel(request);
			if(request.isUserInRole(Constants.SCF_ADMIN)){
				sellerScfMappings=sellerScfMappingService.getSellerScfMapping(paginationModel.getStartIndex(), paginationModel.getPageSize(),null,companyID,null);
				companyList = companyService.getCompanies("4");
				companies=prepareCompanyList(companyList,sellerScfMappings,Constants.SCF_ADMIN);
			}else{
				sellerScfMappings=sellerScfMappingService.getSellerScfMapping(paginationModel.getStartIndex(), paginationModel.getPageSize(),companyID,null,null);
				companyList = companyService.getCompanies("5");
				companies=prepareCompanyList(companyList,sellerScfMappings,Constants.SELLER_ADMIN);
				sellerScfMappings=prepareCompanyListForListing(sellerScfMappings);
			}
			noOfRecords=sellerScfMappingService.getSellerScfMappingCount();
		
			paginationUtil.setPaginationInfo(noOfRecords, paginationModel);
			model.put("companies", companies);
			model.put("sellerScfMappings", sellerScfMappings);
			model.put("currentUser", themeDispay.getRealUser());
			model.put("users", users);

		} catch (Exception e) {
			e.printStackTrace();
			SessionErrors.add(request, "default-error-message");
			_log.error("CompanyController.createCompany() - error occured while rendering add company screen"+ e.getMessage());
		}
		model.put("companyModel", company);
		model.put("orgTypeMap", orgTypeMap);
		model.put("companyTypeMap", companyTypeMap);
		model.put("createInvestor", "createInvestor");
		

		return new ModelAndView("createcompany", model);
	}
	
	@ResourceMapping("exportCompanies")
	protected void generateReport(ResourceRequest request, ResourceResponse response){			
			try {
			    List<Company> companies=companyService.getCompaniesByStatus(CompanyStatus.DELETED.getValue());
			    ReportUtility.generateCusotomerDemoRepots(companies, response);
			} catch (SystemException e) {
				_log.error(e);
			} catch (IOException e) {
				_log.error(e);
			}
		
	}

}
