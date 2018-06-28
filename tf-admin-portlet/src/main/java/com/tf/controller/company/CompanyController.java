package com.tf.controller.company;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.Iterator;
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

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.DataFormatter;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
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
import com.liferay.portal.kernel.repository.model.FileEntry;
import com.liferay.portal.kernel.repository.model.Folder;
import com.liferay.portal.kernel.servlet.SessionErrors;
import com.liferay.portal.kernel.util.MimeTypesUtil;
import com.liferay.portal.kernel.util.ParamUtil;
import com.liferay.portal.kernel.util.Validator;
import com.liferay.portal.kernel.util.WebKeys;
import com.liferay.portal.kernel.workflow.WorkflowConstants;
import com.liferay.portal.security.permission.PermissionChecker;
import com.liferay.portal.service.ServiceContext;
import com.liferay.portal.service.ServiceContextFactory;
import com.liferay.portal.service.UserLocalServiceUtil;
import com.liferay.portal.theme.ThemeDisplay;
import com.liferay.portlet.documentlibrary.model.DLFileEntry;
import com.liferay.portlet.documentlibrary.model.DLFolder;
import com.liferay.portlet.documentlibrary.model.DLFolderConstants;
import com.liferay.portlet.documentlibrary.service.DLAppServiceUtil;
import com.mysql.jdbc.exceptions.jdbc4.MySQLIntegrityConstraintViolationException;
import com.tf.controller.BaseController;
import com.tf.model.Address;
import com.tf.model.AddressModel;
import com.tf.model.Company;
import com.tf.model.CompanyAccountDetail;
import com.tf.model.CompanyDocument;
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
import com.tf.persistance.util.InvalidRequest;
import com.tf.util.CompanyDTO;
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
	private final static String ACTIVETAB = "activetab";

	
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
			PaginationModel paginationModel = paginationUtil.preparePaginationModel(request);
			
			String columnName = ParamUtil.getString(request, "sort_Column");
			String order = ParamUtil.getString(request, "sort_order");
			String sortCompany_order = ParamUtil.getString(request, "sortVal_order");			
			companyList = prepareCompanyListFilter(request, companyList,
					themeDisplay, model,searchValue,columnName,order,paginationModel.getStartIndex(), paginationModel.getPageSize());
			
			model.put("allCompanies", companyList);
			model.put("search", searchValue);
			model.put("defaultRender", Boolean.TRUE);
			model.put(ACTIVETAB, "companylist");
			
			//being used in sorting.
			model.put("sortCompany_order", sortCompany_order);
			model.put("sort_Column", columnName);
			model.put("sort_order", order);
			if (liferayUtility.getPermissionChecker(request).isOmniadmin() ||
					request.isUserInRole(Constants.WHITEHALL_ADMIN)) {				
					model.put("userType", Constants.ADMIN);
				}
			if(request.isUserInRole(Constants.SCF_ADMIN)){
				long compId = userService.getCompanybyUserID(themeDisplay.getUserId()).getId();
				model.put("companyId", compId);
				model.put("userType", Constants.SCF_ADMIN);
			}

		} catch (Exception e) {
			SessionErrors.add(request, "default-error-message");
			_log.error("CompanyController.renderCompanyList() - error occured while rendering company/companies"
					+ e.getMessage());
		}
		return new ModelAndView(model.get("viewName"), model);
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
			    if (liferayUtility.getPermissionChecker(request).isOmniadmin() ||
					request.isUserInRole(Constants.WHITEHALL_ADMIN)) {
					company = companyService.findById(companyID);
			    	} else {
			    	    long compId = userService.getCompanybyUserID(themeDispay.getUserId()).getId();
			    	    if(compId == companyID){
			    		company = companyService.findById(companyID);
			    	    } else {
			    		throw new InvalidRequest();
			    	    }
			    	}
				
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
			if(request.isUserInRole(Constants.PRIMARY_INVESTOR_ADMIN)){//to check investor
				model.put("userType", Constants.PRIMARY_INVESTOR_ADMIN);
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
		    
		    	if(e instanceof InvalidRequest){
		    	    SessionErrors.add(request, "invalid-request");
		    	} else {
		    	    e.printStackTrace();
		    	    SessionErrors.add(request, "default-error-message");
		    	}			
			_log.error("CompanyController.createCompany() - error occured while rendering add company screen"+ e.getMessage());
		}
		Map userInfo = (Map) request.getAttribute(PortletRequest.USER_INFO);
		if(userInfo.containsKey("liferay.user.id")){
			 System.out.println("*********UserLogedInInformation "+   userInfo.get("liferay.user.id"));
			  model.put("loggedUserLiferaryId", userInfo.get("liferay.user.id"));
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
				if(cmp.getCompanyAccountDetail() !=null && cmp.getCompanyAccountDetail().getId() > 0){
				    company.getCompanyAccountDetail().setId(cmp.getCompanyAccountDetail().getId());
				}				
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
		Map<String, String> userTypesMap = adminUtility.getUserTypes(adminUtility.getUserID(request),
				companyTypeMap.get(Long.valueOf(companyService
						.getCompanyTypebyID(companyID))), request);
		
		Map userInfo = (Map) request.getAttribute(PortletRequest.USER_INFO);
		if(userInfo.containsKey("liferay.user.id")){
			 System.out.println("*********UserLogedInInformation "+   userInfo.get("liferay.user.id"));
			  model.put("loggedUserLiferaryId", userInfo.get("liferay.user.id"));
		}
		
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
		ThemeDisplay themeDisplay = (ThemeDisplay) request.getAttribute(WebKeys.THEME_DISPLAY);
		Long companyID = ParamUtil.getLong(request, "companyID");
		Long officerId = ParamUtil.getLong(request, "officer", 0);
		try {
			user.setCompany(companyService.findById(companyID));
			liferayService.addUserInformation(user, request, createUser,themeDisplay, officerId);
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
			_log.error("Error occured while adding/upating user : "+e.getMessage());
		}

	}
	@ActionMapping(params = "render=deleteUser")
	protected void deleteUser(
			@ModelAttribute("userModel") User user,
			ModelMap model, ActionRequest request, ActionResponse response) throws Exception {
	     long liferayId  = ParamUtil.getLong(request, "userLiferayId");
	     long UserId  = ParamUtil.getLong(request, "userId");
		
		System.out.println("*****UserDelete*******" + liferayId + " "+UserId);
		liferayService.deleteUserInformation(UserId,liferayId);
		
	
		 
	  
	}

	@ResourceMapping(value = "fetchCompanyDetails")
	public void fetchCompanyDetails(ResourceRequest request,
			ResourceResponse response) throws IOException {
		String companyNo = ParamUtil.getString(request, "companyNo");
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
	private CompanyModel getCompanyModelInfo(String companyNo) {
		try {
			if (!StringUtils.isEmpty(companyNo)) {
				CompanyModel cmpModel = companyServices.getCompanyInfo(companyNo);
				return cmpModel;
			}
			
		} catch (Exception e) {
			_log.error("Error occured while fetching company information"
					+ e.getMessage());
			
		}
		return null;
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
			List<Company> companyList, ThemeDisplay themeDisplay, ModelMap model, String columnName, String order, int startIndex, int resultSize) {
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
		/*	try {
				companyList = companyService.getCompaniesBySortingParam(startIndex, resultSize, columnName, order,CompanyStatus.DELETED.getValue());
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}*/
			
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
			List<Company> companyList, ThemeDisplay themeDisplay, ModelMap model,String searchValue, String columnName, String order, int startIndex, int resultSize) {
	    Company cmpObject = null;
	    String viewName = "createcompany";
		if (getPermissionChecker(request).isOmniadmin()
				|| request.isUserInRole(Constants.WHITEHALL_ADMIN)) {
			_log.info("User is Omni Admin");			
			companyList = companyService.getCompaniesBySortingParam(startIndex, resultSize, columnName, order,CompanyStatus.DELETED.getValue(),searchValue);
			Long noOfRecords = 0l;
			PaginationModel paginationModel = paginationUtil.preparePaginationModel(request);
			if(Validator.isNotNull(searchValue)) {
			    noOfRecords = companyService.getCompaniesCountByStatus(searchValue);
			} else {
			    noOfRecords = companyService.getCompaniesCount(CompanyStatus.DELETED.getValue());
			}			
			_log.info("noOfRecords:::"+noOfRecords);
			paginationUtil.setPaginationInfo(noOfRecords, paginationModel);
			model.put("paginationModel", paginationModel);
			viewName = "companylist";
		} else if (request.isUserInRole(Constants.SCF_ADMIN)) {
			_log.info("User is SCF Admin");
			long companyId = userService.getCompanyIDbyUserID(themeDisplay.getUserId());
			cmpObject = companyService.findById(companyId);
			model.put("userType", Constants.SCF_ADMIN);
			setCompanyDetailsInfo(model, cmpObject);			
		} else if (request.isUserInRole(Constants.PRIMARY_INVESTOR_ADMIN)){
			_log.info("User is Primary Investor Admin");
			long companyId = userService.getCompanyIDbyUserID(themeDisplay
					.getUserId());
			cmpObject = companyService.findById(companyId);
			setCompanyDetailsInfo(model, cmpObject);
			model.put("userType", Constants.PRIMARY_INVESTOR_ADMIN);			
		} else {
			_log.info("User is Seller Admin");
			long companyId = userService.getCompanyIDbyUserID(themeDisplay
					.getUserId());
			cmpObject = companyService.findById(companyId);
			setCompanyDetailsInfo(model, cmpObject);
			model.put("userType", Constants.SELLER_ADMIN);
		}
		model.put("viewName", viewName);
		model.put("companyModel", cmpObject);
		model.put("orgTypeMap", orgTypeMap);
		model.put("companyTypeMap", companyTypeMap);
		return companyList;
	}



	private void setCompanyDetailsInfo(ModelMap model, Company company) {
	    company.setOfficers(new LinkedHashSet<Officer>(officerService.findOfficersByCompanyId(company.getId())));
	    model.put("users", userService.findUserByCompanyId(company.getId()));
	    model.put("cmpType", companyTypeMap.get(Long.valueOf(company.getCompanyType())));
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
    		  if (getPermissionChecker(request).isOmniadmin()	|| request.isUserInRole(Constants.WHITEHALL_ADMIN)) {
    		    String searchValue = request.getParameter("searchValue");
    		    List<Company> companies=companyService.getCompaniesByStatusFilter(CompanyStatus.DELETED.getValue(), 0, 0, searchValue);
    		    ReportUtility.exportCompanies(companies, response);
    		  }		
	    	} catch (SystemException e) {
        	    _log.error(e);
        	} catch (IOException e) {
        	    _log.error(e);
        	}			
		
	}
	@RenderMapping(params = "render=supplierDocuments")
	protected ModelAndView renderSupplierDocumentsList(@ModelAttribute("companyModelDetail") CompanyDTO company,ModelMap model,
		RenderRequest request, RenderResponse response)
		throws Exception {
		try {
			//ThemeDisplay themeDisplay = liferayUtility.getThemeDisplay(request);
			List<CompanyDocument> companyDocumentList =	new ArrayList<CompanyDocument>();
			if (liferayUtility.getPermissionChecker(request).isOmniadmin()) {
				companyDocumentList =companyDocumentService.getCompanyDocuments();
				model.put("userType", Constants.ADMIN);
			}
			else if (request.isUserInRole(Constants.SCF_ADMIN)) {
				companyDocumentList =companyDocumentService.getCompanyDocuments();
				model.put("userType", Constants.SCF_ADMIN);
			}
			model.put("companyDocumentList", companyDocumentList);
			model.put(ACTIVETAB, "supplierdocList");
		}
		catch (Exception e) {
			SessionErrors.add(request, "default-error-message");
			_log.error("CompanyController.renderSupplierDocumentsList() - error occured while rendering supplierdocList  " +
				e.getMessage());
		}
		return new ModelAndView("supplierdoclist", model);
	}
	
	@ActionMapping(params = "action=importCompany")
	protected void importCompany( @ModelAttribute("companyModelDetail") CompanyDTO company, ModelMap model,
		ActionRequest request, ActionResponse response)
		throws Exception {
		request.getPortletSession().removeAttribute("companyDTO");
		request.getPortletSession().removeAttribute("companyList");
		request.getPortletSession().removeAttribute("validCompanyList");
		request.getPortletSession().removeAttribute("invalidCompanyList");
		int currentRow = 0;
		Company companyObject = null;
		CompanyAccountDetail companyAccountDetail = null;
		Address address = null;
		Workbook workbook = null;
		List<Company> validCompanyList = new ArrayList<Company>();
		List<Company> invalidCompanyList = new ArrayList<Company>();
		try {
			workbook =new XSSFWorkbook(company.getCompanyDoc().getInputStream());
			int numberOfSheets = workbook.getNumberOfSheets();
			DataFormatter formatter = new DataFormatter();
			for (int i = 0; i < numberOfSheets; i++) {
				Sheet sheet = workbook.getSheetAt(i);
				// every sheet has rows, iterate over them
				Iterator<Row> rowIterator = sheet.iterator();
				while (rowIterator.hasNext()) {
					
					
					currentRow = currentRow + 1;
					
					Row row = rowIterator.next();
					// Every row has columns, get the column iterator and
					// iterate over them
					if(currentRow==1){
						continue;
					}
					companyObject = new Company();
					address = new Address();
					companyAccountDetail = new CompanyAccountDetail();
					
					Iterator<Cell> cellIterator = row.cellIterator();
					int index = 0;
					while (cellIterator.hasNext()) {
						Cell cell = cellIterator.next();
						// Get the Cell object
						if (index == 0) {
							try{
								companyObject.setName(cell.getStringCellValue());
							}catch(Exception e){
								_log.error("processing file - error occured while importCompany  " +e.getMessage());
							}
						}
						else if (index == 1) {
							try{
								
								//companyObject.setRegNumber(formatter.formatCellValue(cell));
								String companyNo =formatter.formatCellValue(cell);
								if(companyNo.length()<8){
									companyNo ="0"+companyNo;
								}
								CompanyModel cmpModel = getCompanyModelInfo(companyNo);
								if(null != cmpModel){
									try{
										companyObject.setRegNumber(cmpModel.getCompany_number());
										companyObject.setDateestablished(cmpModel.getDate_of_creation());
										companyObject.setOrgType(cmpModel.getType());
										address.setAddressLine1(cmpModel.getRegistered_office_address().getAddress_line_1());
										address.setAddressLine2(cmpModel.getRegistered_office_address().getAddress_line_2());
										address.setLocality(cmpModel.getRegistered_office_address().getLocality());
										address.setRegion(cmpModel.getRegistered_office_address().getRegion());
										address.setCountry(cmpModel.getRegistered_office_address().getCountry());
										address.setPostalCode(cmpModel.getRegistered_office_address().getPostal_code());
									}catch(Exception e){
										_log.error("processing file - error occured while importCompany in address detail " +e.getMessage());
									}
								}
							}catch(Exception e){
								_log.error("processing file - error occured while importCompany  setRegNumber " +e.getMessage());
							}
						}
						else if (index == 2) {
							try{
								companyObject.setTelnumber(formatter.formatCellValue(cell));
							}catch(Exception e){
								_log.error("processing file - error occured while  importCompany  setTelnumber " +e.getMessage());
							}
							
						}	
						else if (index == 3) {
							try{
								companyAccountDetail.setAccountNumber(formatter.formatCellValue(cell));
							}catch(Exception e){
								_log.error("processing file - error occured while importCompany  setAccountNumber  " +e.getMessage());
							}
							
						}
						else if (index == 4) {
							try{
								companyAccountDetail.setAccountName(cell.getStringCellValue());
							}catch(Exception e){
								_log.error("processing file - error occured while importCompany   setAccountName " +e.getMessage());
							}
						}
						else if (index == 5) {
							try{
								companyAccountDetail.setSortCode(formatter.formatCellValue(cell));
							}catch(Exception e){
								_log.error("processing file - error occured while importCompany  setSortCode " +e.getMessage());
							}
							
						}
						else if (index == 6) {
							try{
								companyAccountDetail.setIban(formatter.formatCellValue(cell));
							}catch(Exception e){
								_log.error("processing file - error occured while importCompany   setIban" +e.getMessage());
							}
							
						}
						else if (index == 7) {
							try{
								companyAccountDetail.setBankName(cell.getStringCellValue());
							}catch(Exception e){
								_log.error("processing file - error occured while importCompany   setBankName " +e.getMessage());
							}
						}
						//in case of sheet has unnessary columns. 
						else if(index>7){
							break;
						}   
						index++;
					}
					companyObject.setActivestatus("New");
					companyObject.setCompanyType("5");
					companyObject.setAddress(address);
					companyObject.setCompanyAccountDetail(companyAccountDetail);
					Company cmpModel = companyDocumentService.getCompanyDetail(companyObject.getRegNumber(),companyObject.getName());
					if(cmpModel!=null && cmpModel.getId()>0){
						companyObject.setId(cmpModel.getId());
						invalidCompanyList.add(companyObject);
					}else{
					    validCompanyList.add(companyObject);
					}
					}

			}
			request.getPortletSession().setAttribute("companyDTO", company);
			request.getPortletSession().setAttribute("invalidCompanyList", invalidCompanyList);
			request.getPortletSession().setAttribute("validCompanyList", validCompanyList);
			model.put("documentUpload", Boolean.TRUE);
			model.put("invalidCompanyList", invalidCompanyList);
			model.put("validCompanyList", validCompanyList);
			response.setRenderParameter("render", "supplierDocuments");
		}
		catch (Exception e) {
		    model.put("documentUpload", Boolean.TRUE);
			model.put("errorOccured", true);
			response.setRenderParameter("render", "supplierDocuments");
			e.printStackTrace();
		}
		finally {
			model.put("currentRow", currentRow);
		}

	}
	
	



	@SuppressWarnings("unchecked")
	@ActionMapping(params = "action=saveCompanys")
	protected void saveCompanys(
		ModelMap model, ActionRequest request, ActionResponse response)
		throws Exception {

		CompanyDTO companyDTO =(CompanyDTO) request.getPortletSession().getAttribute("companyDTO");
		List<Company> companyList =(List<Company>) request.getPortletSession().getAttribute("validCompanyList");

		FileEntry fileEntry = null;
		Folder folder = null;
		CompanyDocument companyDocument = null;
		ThemeDisplay themeDisplay =
			(ThemeDisplay) request.getAttribute(WebKeys.THEME_DISPLAY);
		long currentSideID = themeDisplay.getScopeGroupId();
		long parentFolderId = DLFolderConstants.DEFAULT_PARENT_FOLDER_ID;
		Folder parentfolder = null;
		parentfolder = DLAppServiceUtil.getFolder(currentSideID, 0, "Invoices");
		if (parentfolder != null) {
			parentFolderId = parentfolder.getFolderId();
		}
		Integer folderCount =
			DLAppServiceUtil.getFoldersCount(currentSideID, parentFolderId);
		ServiceContext serviceContextDlFolder =
			ServiceContextFactory.getInstance(DLFolder.class.getName(), request);
		folder =
			DLAppServiceUtil.addFolder(
				currentSideID, parentFolderId, folderCount.toString(),
				"Company Document Folder", serviceContextDlFolder);
		String userName = themeDisplay.getUser().getScreenName();
		String mimeType =
			MimeTypesUtil.getContentType(
					companyDTO.getCompanyDoc().getInputStream(),
					companyDTO.getCompanyDoc().getName());
		ServiceContext serviceContext =
			ServiceContextFactory.getInstance(
				DLFileEntry.class.getName(), request);
		fileEntry =
			DLAppServiceUtil.addFileEntry(
				themeDisplay.getScopeGroupId(), folder.getFolderId(),
				companyDTO.getCompanyDoc().getOriginalFilename(), mimeType,
				companyDTO.getCompanyDoc().getOriginalFilename(),
				companyDTO.getCompanyDoc().getOriginalFilename(), "upload",
				companyDTO.getCompanyDoc().getInputStream(),
				companyDTO.getCompanyDoc().getSize(), serviceContext);
		companyDocument = new CompanyDocument();
		companyDocument.setDocumentId(fileEntry.getFileEntryId());
		companyDocument.setUploadDate(new Date());
		companyDocument.setUploadedby(userName);
		companyDocument.setDocumentName(companyDTO.getCompanyDoc().getOriginalFilename());
		companyDocument.setDocumentUrl(liferayUtility.getDocumentURL(
			themeDisplay, fileEntry));
		companyDocument.setDocumentType(mimeType);

		if (companyList != null && companyList.size() > 0) {
			try{
				companyDocumentService.addCompanyDetailList(companyList);
			}catch(Exception e){
				_log.error("processing file - error occured while saveCompanys  addCompanyDetailList  " +e.getMessage());
			}
			try{
				companyDocumentService.addCompanyDocument(companyDocument);
			}catch(Exception e){
				_log.error("processing file - error occured while saveCompanys in   addCompanyDocument " +e.getMessage());
			}
			
			
		}
		response.setRenderParameter("render", "supplierDocuments");

	}
	
	

}
