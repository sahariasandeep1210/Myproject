package com.tf.controller.seller.company;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.Iterator;
import java.util.LinkedHashSet;
import java.util.List;

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

import com.liferay.portal.kernel.exception.SystemException;
import com.liferay.portal.kernel.repository.model.FileEntry;
import com.liferay.portal.kernel.repository.model.Folder;
import com.liferay.portal.kernel.servlet.SessionErrors;
import com.liferay.portal.kernel.util.MimeTypesUtil;
import com.liferay.portal.kernel.util.ParamUtil;
import com.liferay.portal.kernel.util.WebKeys;
import com.liferay.portal.security.permission.PermissionChecker;
import com.liferay.portal.service.ServiceContext;
import com.liferay.portal.service.ServiceContextFactory;
import com.liferay.portal.theme.ThemeDisplay;
import com.liferay.portlet.documentlibrary.model.DLFileEntry;
import com.liferay.portlet.documentlibrary.model.DLFolder;
import com.liferay.portlet.documentlibrary.model.DLFolderConstants;
import com.liferay.portlet.documentlibrary.service.DLAppServiceUtil;
import com.mysql.jdbc.exceptions.jdbc4.MySQLIntegrityConstraintViolationException;
import com.tf.controller.seller.BaseController;
import com.tf.model.Address;
import com.tf.model.Company;
import com.tf.model.CompanyAccountDetail;
import com.tf.model.CompanyDocument;
import com.tf.model.CompanyModel;
import com.tf.model.CompanyType;
import com.tf.model.Investor;
import com.tf.model.Officer;
import com.tf.model.SellerScfCompanyMapping;
import com.tf.model.User;
import com.tf.persistance.util.CompanyStatus;
import com.tf.persistance.util.Constants;
import com.tf.seller.util.CompanyDTO;
import com.tf.util.ReportUtility;
import com.tf.util.model.PaginationModel;

/**
 * This controller is responsible for request/response handling on
 * Seller/Company screens
 * 
 * @author pawan
 *
 */
@Controller
@RequestMapping(value = "VIEW")
public class SellerController extends BaseController {
	private final static String ACTIVETAB = "activetab";

	
	@RenderMapping
	protected ModelAndView renderCompanyList(	
			@ModelAttribute("companyModel") Company company, ModelMap model,
			RenderRequest request, RenderResponse response) throws Exception {
		_log.info("CompanyController :: Render Company List");
		ThemeDisplay themeDisplay = (ThemeDisplay) request
				.getAttribute(WebKeys.THEME_DISPLAY);
		
		//long companyID = ParamUtil.getLong(request, "companyID");
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
			if(request.isUserInRole(Constants.SCF_ADMIN)){	
			model.put("userType", Constants.SCF_ADMIN);
			long companyID = userService.getCompanybyUserID(themeDisplay.getUserId()).getId();
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
			model.put("companyId", companyID);
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
				
				sortSellerScfMapping(sellerScfMappings);
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

		}} catch (Exception e) {
			e.printStackTrace();
			SessionErrors.add(request, "default-error-message");
			_log.error("CompanyController.createCompany() - error occured while rendering add company screen"+ e.getMessage());
		}
		model.put("companyModel", company);
		model.put("orgTypeMap", orgTypeMap);
		model.put("companyTypeMap", companyTypeMap);

		return new ModelAndView("companylist", model);
	}



	/**
	 * @param sellerScfMappings
	 */
	private void sortSellerScfMapping(List<SellerScfCompanyMapping> sellerScfMappings) {
		Collections.sort(sellerScfMappings, new Comparator<SellerScfCompanyMapping>() {
			@Override
			public int compare(SellerScfCompanyMapping c1, SellerScfCompanyMapping c2) {
				return c1.getSellerCompany().getName().compareToIgnoreCase(c2.getSellerCompany().getName());
			}
		});
	}

	

	@RenderMapping(params = "render=createCompany")
	protected ModelAndView renderCreateCompany(
			@ModelAttribute("companyModel") Company company, ModelMap model,
			RenderRequest request, RenderResponse response) throws Exception {
		ThemeDisplay themeDisplay = (ThemeDisplay) request
				.getAttribute(WebKeys.THEME_DISPLAY);
		
		//long companyID = ParamUtil.getLong(request, "companyID");
		ThemeDisplay themeDispay = (ThemeDisplay) request
				.getAttribute(WebKeys.THEME_DISPLAY);
		List<User> users;
		List<Company> companyList = new ArrayList<Company>();
		List<SellerScfCompanyMapping> sellerScfMappings=null; 
		List<Company> companies=null;
		long sellerId=0l;
		try {
			if(request.isUserInRole(Constants.SCF_ADMIN)){	
			long companyID = userService.getCompanybyUserID(themeDisplay.getUserId()).getId();
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
			model.put("companyId", companyID);
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
			Long noOfRecords = 0l;
			PaginationModel paginationModel = paginationUtil.preparePaginationModel(request);
			if(request.isUserInRole(Constants.SCF_ADMIN)){
				sellerScfMappings=sellerScfMappingService.getSellerScfMapping(paginationModel.getStartIndex(), paginationModel.getPageSize(),null,companyID,null);
				companyList = companyService.getCompanies("4");
				companies=prepareCompanyList(companyList,sellerScfMappings,Constants.SCF_ADMIN);
			}
			noOfRecords=sellerScfMappingService.getSellerScfMappingCount();
		
			paginationUtil.setPaginationInfo(noOfRecords, paginationModel);
			model.put("companies", companies);
			model.put("sellerScfMappings", sellerScfMappings);
			model.put("currentUser", themeDispay.getRealUser());
			model.put("users", users);

		}} catch (Exception e) {
			e.printStackTrace();
			SessionErrors.add(request, "default-error-message");
			_log.error("CompanyController.createCompany() - error occured while rendering add company screen"+ e.getMessage());
		}
		model.put("companyModel", company);
		model.put("orgTypeMap", orgTypeMap);
		model.put("companyTypeMap", companyTypeMap);

		return new ModelAndView("companylist", model);
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
	
	@SuppressWarnings("unchecked")
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
		    companySortOnName(companyList);
		    return companyList;		
	   }



	private void companySortOnName(List<Company> companyList) {
		Collections.sort(companyList, new Comparator<Company>() 
		  {
			@Override
			public int compare(Company c1, Company c2) {
				return c1.getName().compareToIgnoreCase(c2.getName());
			}
		  });
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



	private PermissionChecker getPermissionChecker(PortletRequest request) {
		ThemeDisplay themeDisplay = (ThemeDisplay) request
				.getAttribute(WebKeys.THEME_DISPLAY);
		PermissionChecker permissionChecker = themeDisplay
				.getPermissionChecker();
		return permissionChecker;
	}

	
	
	
	@ResourceMapping("exportCompanies")
	protected void generateReport(ResourceRequest request, ResourceResponse response){			
			try {
				if (getPermissionChecker(request).isOmniadmin()
						|| request.isUserInRole(Constants.WHITEHALL_ADMIN)){
			    List<Company> companies=companyService.getCompaniesByStatus(CompanyStatus.DELETED.getValue());
			    ReportUtility.exportCompanies(companies, response);
				}
				else{
					
				}
			} catch (SystemException e) {
				_log.error(e);
			} catch (IOException e) {
				_log.error(e);
			}
		
	}

	@RenderMapping(params = "render=supplierDocuments")
	protected ModelAndView renderSupplierDocumentsList(@ModelAttribute("companyModelDetail") CompanyDTO company, ModelMap model,
			RenderRequest request, RenderResponse response) throws Exception {
		try {
			
			ThemeDisplay themeDisplay = liferayUtility.getThemeDisplay(request);
			themeDisplay.getUser().getScreenName();
			List<CompanyDocument> companyDocumentList = new ArrayList<CompanyDocument>();
			companyDocumentList = companyDocumentService.getCompanyDocumentsBasedOnUploadedBy(themeDisplay.getUser().getScreenName());
			model.put("userType", Constants.SCF_ADMIN);
			
			List<Company> companyList = companyService.getCompanies("5");
			model.put("companyDocumentList", companyDocumentList);
			companySortOnName(companyList);
			
			model.put("scfCompanyList", companyList);
			model.put(ACTIVETAB, "supplierdocList");
		} catch (Exception e) {
			SessionErrors.add(request, "default-error-message");
			_log.error("CompanyController.renderSupplierDocumentsList() - error occured while rendering supplierdocList  " + e.getMessage());
		}
		return new ModelAndView("supplierdoclist", model);
	}

	@ActionMapping(params = "action=importCompany")
	protected void importCompany( @ModelAttribute("companyModelDetail") CompanyDTO company, ModelMap model,
		ActionRequest request, ActionResponse response)
		throws Exception {
		
		
		removeSessionAttr(request);
		
		int currentRow = 0;
		Company companyObject = null;
		CompanyAccountDetail companyAccountDetail = null;
		Address address = null;
		Workbook workbook = null;
		List<Company> validCompanyList = new ArrayList<Company>();
		List<Company> invalidCompanyList = new ArrayList<Company>();
		
		/*
		 *in case of admin user,he can add the scf company while mapping to seller.
		 */
		String scfCompanyId = request.getParameter("scfCompany");
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
						else if (index == 4) {
							try{
								companyAccountDetail.setAccountNumber(formatter.formatCellValue(cell));
							}catch(Exception e){
								_log.error("processing file - error occured while importCompany  setAccountNumber  " +e.getMessage());
							}
							
						}
						else if (index == 5) {
							try{
								companyAccountDetail.setAccountName(cell.getStringCellValue());
							}catch(Exception e){
								_log.error("processing file - error occured while importCompany   setAccountName " +e.getMessage());
							}
						}
						else if (index == 6) {
							try{
								companyAccountDetail.setSortCode(formatter.formatCellValue(cell));
							}catch(Exception e){
								_log.error("processing file - error occured while importCompany  setSortCode " +e.getMessage());
							}
							
						}
						else if (index == 7) {
							try{
								companyAccountDetail.setIban(formatter.formatCellValue(cell));
							}catch(Exception e){
								_log.error("processing file - error occured while importCompany   setIban" +e.getMessage());
							}
							
						}
						else if (index == 8) {
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
					companyObject.setCompanyType("4");
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
			request.getPortletSession().setAttribute("scfCompanyId", scfCompanyId);
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



	private void removeSessionAttr(ActionRequest request) {
		request.getPortletSession().removeAttribute("companyDTO");
		request.getPortletSession().removeAttribute("companyList");
		request.getPortletSession().removeAttribute("validCompanyList");
		request.getPortletSession().removeAttribute("invalidCompanyList");
		request.getPortletSession().removeAttribute("scfCompanyId");
	}

	@SuppressWarnings("unchecked")
	@ActionMapping(params = "action=saveCompanys")
	protected void saveCompanys(
		ModelMap model, ActionRequest request, ActionResponse response)
		throws Exception {
		ThemeDisplay themeDisplay =
				(ThemeDisplay) request.getAttribute(WebKeys.THEME_DISPLAY);
		CompanyDTO companyDTO =(CompanyDTO) request.getPortletSession().getAttribute("companyDTO");
		List<Company> companyList =(List<Company>) request.getPortletSession().getAttribute("validCompanyList");
		long scfCompanyID=0l;
		
		/**
		 * If scf company gets login,internally seller will be mapped to login SCF company admin user
		 */
		if(request.isUserInRole(Constants.SCF_ADMIN)){
			 scfCompanyID = userService.getCompanybyUserID(themeDisplay.getUserId()).getId();
		}else{
			scfCompanyID = Long.parseLong((String) request.getPortletSession().getAttribute("scfCompanyId"));
		}
		
		FileEntry fileEntry = null;
		Folder folder = null;
		CompanyDocument companyDocument = null;
		
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
				
				companyDocumentService.addCompanyDetailsAndSCFSellerMaping(companyList, scfCompanyID);
				
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
