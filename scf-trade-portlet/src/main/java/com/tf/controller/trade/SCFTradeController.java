package com.tf.controller.trade;

import com.google.gson.Gson;
import com.liferay.portal.kernel.exception.PortalException;
import com.liferay.portal.kernel.exception.SystemException;
import com.liferay.portal.kernel.log.Log;
import com.liferay.portal.kernel.log.LogFactoryUtil;
import com.liferay.portal.kernel.repository.model.FileEntry;
import com.liferay.portal.kernel.repository.model.Folder;
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
import com.mysql.jdbc.StringUtils;
import com.tf.model.Allotment;
import com.tf.model.Company;
import com.tf.model.Invoice;
import com.tf.model.SCFTrade;
import com.tf.persistance.util.Constants;
import com.tf.persistance.util.InvoiceStatus;
import com.tf.persistance.util.TradeStatus;
import com.tf.service.AllotmentService;
import com.tf.service.CompanyService;
import com.tf.service.InvoiceService;
import com.tf.service.SCFTradeService;
import com.tf.service.UserService;
import com.tf.util.LiferayUtility;
import com.tf.util.MyCustomNumberEditor;
import com.tf.util.PaginationUtil;
import com.tf.util.SCFTradeDTO;
import com.tf.util.model.PaginationModel;

import java.beans.PropertyEditorSupport;
import java.io.IOException;
import java.math.BigDecimal;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.portlet.ActionRequest;
import javax.portlet.ActionResponse;
import javax.portlet.RenderRequest;
import javax.portlet.RenderResponse;
import javax.portlet.ResourceRequest;
import javax.portlet.ResourceResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.portlet.ModelAndView;
import org.springframework.web.portlet.bind.annotation.ActionMapping;
import org.springframework.web.portlet.bind.annotation.RenderMapping;
import org.springframework.web.portlet.bind.annotation.ResourceMapping;

/**
 * This controller is responsible for request/response handling on SCF Trade
 * screens
 * 
 * @author Gautam Sharma
 * 
 */
@Controller
@RequestMapping(value = "VIEW")
public class SCFTradeController {

	protected Log _log = LogFactoryUtil.getLog(SCFTradeController.class
			.getName());
	private  final static String ACTIVETAB="activetab";	

	@Autowired
	private SCFTradeService scfTradeService;

	@Autowired
	private InvoiceService invoiceService;

	@Autowired
	private CompanyService companyService;

	@Autowired
	protected UserService userService;

	@Autowired
	protected AllotmentService allotmentService;

	@Autowired
	protected LiferayUtility liferayUtility;

	@Autowired
	protected PaginationUtil paginationUtil;

	@InitBinder
	public void binder(WebDataBinder binder) {

		binder.registerCustomEditor(Date.class, new PropertyEditorSupport() {
			public void setAsText(String value) {
				try {
					setValue(new SimpleDateFormat("MM/dd/yyyy").parse(value));
				} catch (Exception e) {
					setValue(null);
				}
			}

			public String getAsText() {
				if (getValue() != null) {
					return new SimpleDateFormat("MM/dd/yyyy")
							.format((Date) getValue());
				} else {
					return null;
				}
			}
		});

		binder.registerCustomEditor(Long.class, new MyCustomNumberEditor(
				Long.class, true));
	}

	@RenderMapping
	protected ModelAndView renderTradeList(ModelMap model,
			RenderRequest request, RenderResponse response) throws Exception {
		List<SCFTrade> scftrades = null;
		List<Invoice> invoices = null;

		SCFTrade scfTrade = null;
		String viewName = "";
		ThemeDisplay themeDisplay = (ThemeDisplay) request
				.getAttribute(WebKeys.THEME_DISPLAY);
		Long noOfRecords = 0l;
		PaginationModel paginationModel = paginationUtil
				.preparePaginationModel(request);

		PermissionChecker permissionChecker = themeDisplay
				.getPermissionChecker();

		if (permissionChecker.isOmniadmin()) {
			scftrades = scfTradeService.getScfTrades(paginationModel.getStartIndex(),
					paginationModel.getPageSize());
			noOfRecords = scfTradeService.getScfTradesCount();
			model.put("userType", Constants.ADMIN);
			model.put(ACTIVETAB, "admintradelist");

			viewName = "admintradelist";
		} else if (request.isUserInRole(Constants.SCF_ADMIN)) {
			long companyId = userService.getCompanybyUserID(
					themeDisplay.getUserId()).getId();
			scftrades = scfTradeService.getScfTrades(companyId,paginationModel.getStartIndex(),
					paginationModel.getPageSize());
			noOfRecords=scfTradeService.getScfTradesCount(companyId);
			viewName = "tradelist";
		} else if (request.isUserInRole(Constants.SELLER_ADMIN)) {

			String regNum = liferayUtility.getWhiteHallComapanyRegNo(request);
			scftrades=scfTradeService.getScfTradeList(regNum, paginationModel.getStartIndex(), paginationModel.getPageSize());
			noOfRecords = scfTradeService.getScfTradeCounts(regNum);
     		viewName = "sellertradelist";
		}
		model.put("trades", scftrades);

		paginationUtil.setPaginationInfo(noOfRecords, paginationModel);
        System.out.println("paginationsss:"+paginationModel);
		model.put("paginationModel", paginationModel);

		return new ModelAndView(viewName, model);
	}

	@RenderMapping(params = "render=tradeHistory")
	protected ModelAndView renderTradeHistory(
			@ModelAttribute("tradehistoryModel") SCFTradeDTO scfTradeDTO,
			ModelMap model, RenderRequest request, RenderResponse response)
			throws Exception {
		 List<SCFTrade> scfTrades=null;
		 BigDecimal totalTradeAmount = BigDecimal.ZERO;
		 Long noOfRecords = 0l;
		 PaginationModel paginationModel = paginationUtil
					.preparePaginationModel(request);
		scfTrades=scfTradeService.getTradeHistoryList(paginationModel.getStartIndex(),
				paginationModel.getPageSize());
		 noOfRecords = scfTradeService.getScfTradesHistoryCount();
		System.out.println("noOfRecordsSSSSS:"+scfTrades);
		for(SCFTrade scf:scfTrades){
			totalTradeAmount=totalTradeAmount.add(scf.getTradeAmount());
		}
		paginationUtil.setPaginationInfo(noOfRecords, paginationModel);
        System.out.println("paginationsss:"+paginationModel);
		model.put("paginationModel", paginationModel);
		model.put(ACTIVETAB, "tradehistory");
		model.put("scfTradesHistory", scfTrades);
		model.put("totalTradeAmount", totalTradeAmount);


		model.put("userType", Constants.ADMIN);

	    return new ModelAndView("tradehistory", model);	
	}
	@RenderMapping(params = "render=singleHistory")
	protected ModelAndView rendersingleHistory(ModelMap model,
			RenderRequest request, RenderResponse response) {
		 List<SCFTrade> scfTrades=null;
		 BigDecimal totalTradeAmount = BigDecimal.ZERO;

		 Long noOfRecords = 0l;
		 PaginationModel paginationModel = paginationUtil
					.preparePaginationModel(request);
		Long compID = ParamUtil.getLong(request, "compID");
		scfTrades=scfTradeService.getTradeHistoryByComapnyId(compID,paginationModel.getStartIndex(),
				paginationModel.getPageSize());
		noOfRecords=scfTradeService.getHistoryCount(compID);
		for(SCFTrade scf:scfTrades){
			totalTradeAmount=totalTradeAmount.add(scf.getTradeAmount());
		}
		paginationUtil.setPaginationInfo(noOfRecords, paginationModel);
        System.out.println("paginationsss:"+paginationModel);
		model.put("paginationModel", paginationModel);
		model.put("scfTradesHistory", scfTrades);
		model.put("totalTradeAmount", totalTradeAmount);
         model.put("compID", compID);

		return new ModelAndView("singlehistorytrade", model);
	}
	@ActionMapping(params="page=historyBack")
	protected void pageBack(ModelMap model,
			ActionRequest request, ActionResponse response){
        response.setRenderParameter("render", "tradeHistory");

	}
	
	@RenderMapping(params = "render=createTrade")
	protected ModelAndView renderCreateTrade(
			@ModelAttribute("scfTradeModel") SCFTradeDTO scfTradeDTO,
			ModelMap model, RenderRequest request, RenderResponse response)
			throws Exception {
		Long tradeID = ParamUtil.getLong(request, "tradeID");
		Invoice invoice=invoiceService.getInvoicesBytradeId(tradeID);
		Company company=companyService.getCompaniesByRegNum(invoice.getSellerCompanyRegistrationNumber());
		System.out.println("Dhanush123:"+invoice);
		if (tradeID == null || tradeID == 0) {
			String invoiceIds = ParamUtil.getString(request, "invoices");
			Map<Company, BigDecimal> invoiceMap = invoiceService
					.getInvoicesAmount(invoiceIds);
			Map.Entry<Company, BigDecimal> entry = invoiceMap.entrySet()
					.iterator().next();
			scfTradeDTO.setTradeAmount(entry.getValue());
			scfTradeDTO.setCompany(entry.getKey());
			model.put("invoiceList", invoiceService.getInvoices(invoiceIds));
			model.put("invoiceIds", invoiceIds);
		} else {
			SCFTrade scfTrade = scfTradeService.findById(tradeID);
			scfTradeDTO = transformTOScfTradeDTO(scfTrade);
			model.put("invoiceList", scfTrade.getInvoices());

		}
		model.put("scfTradeModel", scfTradeDTO);
		model.put("company", company);

		return new ModelAndView("createscftrade", model);

	}

	@RenderMapping(params = "render=singleTrade")
	protected ModelAndView renderSingleTrade(ModelMap model,
			RenderRequest request, RenderResponse response) {
		Long tradeID = ParamUtil.getLong(request, "tradeID");
		SCFTrade scfTrade = scfTradeService.findById(tradeID);
		List<Allotment> allotmentList = allotmentService
				.groupAllotmentbyBps(tradeID);
		long companyId = liferayUtility.getWhitehallCompanyID(request);
		Company company = companyService.findById(companyId);
		model.put("allotments", allotmentList);
		model.put("trades", scfTrade);
		model.put("companyname", company);
		model.put("invoiceList", scfTrade.getInvoices());

		return new ModelAndView("suppliertrade", model);
	}

	@ActionMapping(params = "action=saveTrade")
	protected void saveTarde(
			@ModelAttribute("scfTradeModel") SCFTradeDTO scfTradeDTO,
			ModelMap model, ActionRequest request, ActionResponse response)
			throws Exception {
		try {

			ThemeDisplay themeDisplay = (ThemeDisplay) request
					.getAttribute(WebKeys.THEME_DISPLAY);
			long currentSideID = themeDisplay.getScopeGroupId();
			long parentFolderId = DLFolderConstants.DEFAULT_PARENT_FOLDER_ID;
			ServiceContext serviceContextDlFolder = ServiceContextFactory
					.getInstance(DLFolder.class.getName(), request);
			Folder parentfolder = null;
			parentfolder = DLAppServiceUtil.getFolder(currentSideID, 0,
					"Insurance");
			if (parentfolder != null) {
				parentFolderId = parentfolder.getFolderId();
			}
			Long companyID = ParamUtil.getLong(request, "companyID");
			Company company = companyService.findById(companyID);
			scfTradeDTO.setCompany(company);
			SCFTrade scfTrade = transformTOScfTrade(scfTradeDTO);
			scfTrade.setStatus(TradeStatus.NEW.getValue());
			scfTrade = scfTradeService.save(scfTrade);
			if (!StringUtils.isNullOrEmpty(scfTradeDTO.getInvoiceIds())) {
				List<String> invoicesIdList = Arrays.asList(scfTradeDTO
						.getInvoiceIds().split(","));
				invoiceService.updateInvoicesStatusWithTrade(invoicesIdList,
						InvoiceStatus.TRADE_GENERATED.getValue(),
						scfTrade.getId());
			}

			if (scfTrade.getWantToInsure()) {
				addInsuranceDocument(scfTradeDTO, request, themeDisplay,
						currentSideID, parentFolderId, serviceContextDlFolder,
						scfTrade);
			}
		} catch (Exception e) {
			e.printStackTrace();
			_log.error("Error Occured while saving Trade" + e.getMessage());
		}

	}

	@ResourceMapping("breakdownURL")
	public ModelAndView fetchAllotmentBreak(ResourceRequest request,
			ResourceResponse response, ModelMap modelMap) throws IOException {
		long tradeID = ParamUtil.getLong(request, "tradeID", 0);
		List<Allotment> allotmentList = allotmentService
				.getALlotmentsbyTrade(tradeID);
		modelMap.put("allotmentList", allotmentList);
		modelMap.put("tradeID", tradeID);
		return new ModelAndView("allotmentbreakup");
	}

	private void addInsuranceDocument(SCFTradeDTO scfTradeDTO,
			ActionRequest request, ThemeDisplay themeDisplay,
			long currentSideID, long parentFolderId,
			ServiceContext serviceContextDlFolder, SCFTrade scfTrade)
			throws PortalException, SystemException, IOException {
		FileEntry fileEntry;
		Folder folder;
		scfTrade = scfTradeService.findById(scfTrade.getId());
		folder = DLAppServiceUtil.addFolder(currentSideID, parentFolderId,
				scfTrade.getId().toString(), "Trade Insurance Folder",
				serviceContextDlFolder);
		String mimeType = MimeTypesUtil.getContentType(scfTradeDTO
				.getInsuranceDocument().getInputStream(), scfTradeDTO
				.getInsuranceDocument().getName());
		ServiceContext serviceContext = ServiceContextFactory.getInstance(
				DLFileEntry.class.getName(), request);
		fileEntry = DLAppServiceUtil.addFileEntry(themeDisplay
				.getScopeGroupId(), folder.getFolderId(), scfTradeDTO
				.getInsuranceDocument().getOriginalFilename(), mimeType,
				scfTradeDTO.getInsuranceDocument().getOriginalFilename(),
				scfTradeDTO.getInsuranceDocument().getOriginalFilename(),
				"upload", scfTradeDTO.getInsuranceDocument().getInputStream(),
				scfTradeDTO.getInsuranceDocument().getSize(), serviceContext);
		scfTrade.setInsuranceDocId(fileEntry.getFileEntryId());
		scfTrade.setInsuranceDocName(scfTradeDTO.getInsuranceDocument()
				.getOriginalFilename());
		scfTrade.setInsuranceDocUrl(getUrl(themeDisplay, fileEntry));
		scfTrade.setInsuranceDocType(mimeType);
		scfTrade.setUpdatDate(new Date());
		// scfTrade.getInvoices().addAll(scfTrade.getInvoices());
		scfTradeService.updateTrade(scfTrade);
	}

	@ActionMapping(params = "action=updateStatus")
	protected void saveTarde(ModelMap model, ActionRequest request,
			ActionResponse response) throws Exception {
		Long tradeID = ParamUtil.getLong(request, "tradeID");
		String status = ParamUtil.getString(request, "status");
		SCFTrade scfTrade = scfTradeService.findById(tradeID);
		scfTrade.setStatus(status);
		scfTradeService.updateTradeLifeCycle(scfTrade);
		System.out.println("tradeID::" + tradeID + " status " + status);

	}

	private SCFTrade transformTOScfTrade(SCFTradeDTO scfTradeDTO) {
		SCFTrade scfTrade = new SCFTrade();
		scfTrade.setClosingDate(scfTradeDTO.getClosingDate());
		scfTrade.setCompany(scfTradeDTO.getCompany());
		scfTrade.setCreateDate(new Date());
		scfTrade.setDuration(scfTradeDTO.getDuration());
		scfTrade.setInvestorPaymentDate(scfTradeDTO.getInvestorPaymentDate());
		scfTrade.setOpeningDate(scfTradeDTO.getOpeningDate());
		scfTrade.setPromisoryNote(scfTradeDTO.getPromisoryNote());
		scfTrade.setScfTrade(scfTradeDTO.getScfTrade());
		scfTrade.setSellerPaymentDate(scfTradeDTO.getSellerPaymentDate());
		scfTrade.setStatus(scfTradeDTO.getStatus());
		scfTrade.setTradeAmount(scfTradeDTO.getTradeAmount());
		scfTrade.setTradeNotes(scfTradeDTO.getTradeNotes());
		scfTrade.setTradeSettled(scfTradeDTO.getTradeSettled());
		scfTrade.setWantToInsure(scfTradeDTO.getWantToInsure());
		scfTrade.setInvoices(invoiceService.getInvoices(scfTradeDTO
				.getInvoiceIds()));
		return scfTrade;
	}

	private SCFTradeDTO transformTOScfTradeDTO(SCFTrade scfTrade) {
		SCFTradeDTO scfTradeDTO = new SCFTradeDTO();
		scfTradeDTO.setId(scfTrade.getId());
		scfTradeDTO.setClosingDate(scfTrade.getClosingDate());
		scfTradeDTO.setCompany(scfTrade.getCompany());
		scfTradeDTO.setDuration(scfTrade.getDuration());
		scfTradeDTO.setInvestorPaymentDate(scfTrade.getInvestorPaymentDate());
		scfTradeDTO.setOpeningDate(scfTrade.getOpeningDate());
		scfTradeDTO.setPromisoryNote(scfTrade.getPromisoryNote());
		scfTradeDTO.setScfTrade(scfTrade.getScfTrade());
		scfTradeDTO.setSellerPaymentDate(scfTrade.getSellerPaymentDate());
		scfTradeDTO.setStatus(scfTrade.getStatus());
		scfTradeDTO.setTradeAmount(scfTrade.getTradeAmount());
		scfTradeDTO.setTradeNotes(scfTrade.getTradeNotes());
		scfTradeDTO.setTradeSettled(scfTrade.getTradeSettled());
		scfTradeDTO.setWantToInsure(scfTrade.getWantToInsure());
		scfTradeDTO.setInsuranceDocName(scfTrade.getInsuranceDocName());
		scfTradeDTO.setInsuranceDocURL(scfTrade.getInsuranceDocUrl());
		return scfTradeDTO;

	}

	private String getUrl(ThemeDisplay themeDisplay, FileEntry fileEntry) {
		StringBuilder sb = new StringBuilder();
		sb.append(themeDisplay.getPortalURL());
		sb.append("/c/document_library/get_file?uuid=");
		sb.append(fileEntry.getUuid());
		sb.append("&groupId=");
		sb.append(themeDisplay.getScopeGroupId());
		return sb.toString();
	}

	@ResourceMapping
	public void search(ResourceRequest request, ResourceResponse response)
			throws IOException {
		String settingmodel = null;

		long searchSelection = Long.valueOf(ParamUtil.getString(request,
				"searchSelection", ""));
		try {

			SCFTrade sellerList = scfTradeService.findById(searchSelection);

			System.out.println("userSelections" + sellerList);
			Gson gson = new Gson();
			settingmodel = gson.toJson(sellerList);
			response.getWriter().println(settingmodel);
			System.out.println("userSelections" + settingmodel);

		} catch (Exception e) {
			_log.error("Error occured while fetchSettings" + e.getMessage());
			response.setProperty(ResourceResponse.HTTP_STATUS_CODE, "400");
		}

	}
	
	
	@ActionMapping(params="trade=getTradeHistory")
	protected void getTradeHistory( ModelMap model,ActionRequest request,ActionResponse response) throws Exception {
		DateFormat formatter = new SimpleDateFormat("MM/dd/yyyy");
		Date fromDate=formatter.parse("2/1/1970");
		long scfCompanyId= 0;
		Date toDate= new Date();
		String companyName=ParamUtil.getString(request, "Search");
		if(!StringUtils.isNullOrEmpty(companyName)){
	        Company company = companyService.getCompaniesByName(companyName);
		    scfCompanyId=company.getId();
		}
        String from=ParamUtil.getString(request, "fromDate");
        String to=ParamUtil.getString(request, "toDate");
        if(!StringUtils.isNullOrEmpty(from)){
        fromDate=formatter.parse(from);
        }
        if(!StringUtils.isNullOrEmpty(to)){
            toDate=formatter.parse(to);
       }
        List<SCFTrade> scfTradesList=scfTradeService.getScfTradeByScfCompany(scfCompanyId, fromDate, toDate); 
        System.out.println("DhanushSuccess:"+scfTradesList);
        //model.put("scfTradesList", scfTradesList);
        request.setAttribute("scfTradesList", scfTradesList);
        response.setRenderParameter("render", "tradeHistory");
       
       } 	
 
	@ActionMapping(params="trade=getSellerHistory")
	protected void getSellerHistory( ModelMap model,ActionRequest request,ActionResponse response) throws Exception {
		DateFormat formatter = new SimpleDateFormat("MM/dd/yyyy");
		Date fromDate=formatter.parse("2/1/1970");
		Date toDate= new Date();
		 List<SCFTrade> scfTradesList=null;
		Long noOfRecords = 0l;
		List<SCFTrade> scfTrades=null;
		BigDecimal totalTradeAmount = BigDecimal.ZERO;
		PaginationModel paginationModel = paginationUtil
				.preparePaginationModel(request);
		Long compID = ParamUtil.getLong(request, "compID");
		System.out.println("SS:"+compID);
		String companyName=ParamUtil.getString(request, "Search");
        String from=ParamUtil.getString(request, "fromDate");
        String to=ParamUtil.getString(request, "toDate");
        if(!StringUtils.isNullOrEmpty(from)){
        fromDate=formatter.parse(from);
        }
        if(!StringUtils.isNullOrEmpty(to)){
            toDate=formatter.parse(to);
       }
        System.out.println("fromDate:"+fromDate);
        
         scfTradesList=scfTradeService.getScfTradeSellerCompany(companyName,fromDate, toDate,paginationModel.getStartIndex(),paginationModel.getPageSize());
         noOfRecords=scfTradeService.getScfTradeSellerCompanyCount(companyName, fromDate, toDate);
                       
        scfTrades=scfTradeService.getTradeHistoryByComapnyId(compID,paginationModel.getStartIndex(),
				paginationModel.getPageSize());
        for(SCFTrade scf:scfTrades){
			totalTradeAmount=totalTradeAmount.add(scf.getTradeAmount());
		}
        paginationUtil.setPaginationInfo(noOfRecords, paginationModel);

        System.out.println("DhanushSuccess:"+scfTradesList);
        model.put("scfTradesList", scfTradesList);
        model.put("compID", compID);
        model.put("totalTradeAmount", totalTradeAmount);
		model.put("paginationModel", paginationModel);
        response.setRenderParameter("render", "singleHistory");
       
       } 	
 

}
	
	


