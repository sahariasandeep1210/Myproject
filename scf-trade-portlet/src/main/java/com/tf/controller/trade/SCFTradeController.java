
package com.tf.controller.trade;

import com.google.gson.Gson;
import com.liferay.portal.kernel.exception.PortalException;
import com.liferay.portal.kernel.exception.SystemException;
import com.liferay.portal.kernel.language.LanguageUtil;
import com.liferay.portal.kernel.log.Log;
import com.liferay.portal.kernel.log.LogFactoryUtil;
import com.liferay.portal.kernel.repository.model.FileEntry;
import com.liferay.portal.kernel.repository.model.Folder;
import com.liferay.portal.kernel.servlet.SessionErrors;
import com.liferay.portal.kernel.util.JavaConstants;
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
import com.tf.persistance.util.InSuffcientFund;
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
import com.tf.util.ValidationUtil;
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
import javax.portlet.PortletConfig;
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
 */
@Controller
@RequestMapping(value = "VIEW")
public class SCFTradeController {

	protected Log _log = LogFactoryUtil.getLog(SCFTradeController.class.getName());
	private final static String ACTIVETAB = "activetab";

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
	
	@Autowired
	protected ValidationUtil validationUtil;

	@InitBinder
	public void binder(WebDataBinder binder) {

		binder.registerCustomEditor(Date.class, new PropertyEditorSupport() {

			public void setAsText(String value) {

				try {
					setValue(new SimpleDateFormat("MM/dd/yyyy").parse(value));
				}
				catch (Exception e) {
					setValue(null);
				}
			}

			public String getAsText() {

				if (getValue() != null) {
					return new SimpleDateFormat("MM/dd/yyyy").format((Date) getValue());
				}
				else {
					return null;
				}
			}
		});

		binder.registerCustomEditor(Long.class, new MyCustomNumberEditor(Long.class, true));
	}

	@RenderMapping
	protected ModelAndView renderTradeList(ModelMap model, RenderRequest request, RenderResponse response)
		throws Exception {

		List<SCFTrade> scftrades = null;
		String viewName = "";
		ThemeDisplay themeDisplay = (ThemeDisplay) request.getAttribute(WebKeys.THEME_DISPLAY);
		Long noOfRecords = 0l;
		PaginationModel paginationModel = paginationUtil.preparePaginationModel(request);

		PermissionChecker permissionChecker = themeDisplay.getPermissionChecker();

		if (permissionChecker.isOmniadmin()) {
			BigDecimal totalTradeAmount = BigDecimal.ZERO;
			BigDecimal totalInvestorProfit = BigDecimal.ZERO;
			BigDecimal totalWhiteHallShare = BigDecimal.ZERO;
			BigDecimal totalInvestorNet = BigDecimal.ZERO;
			BigDecimal totalSellerFees = BigDecimal.ZERO;
			BigDecimal totalWhiteHallFees = BigDecimal.ZERO;
			BigDecimal totalSellerAmount = BigDecimal.ZERO;

			scftrades = scfTradeService.getScfTrades(paginationModel.getStartIndex(), paginationModel.getPageSize());
			noOfRecords = scfTradeService.getScfTradesCount();
			for (SCFTrade scf : scftrades) {
				totalTradeAmount = totalTradeAmount.add(scf.getTradeAmount());
				totalInvestorProfit = totalInvestorProfit.add(scf.getInvestorTotalGross());
				totalWhiteHallShare = totalWhiteHallShare.add(scf.getWhitehallTotalShare());
				totalInvestorNet = totalInvestorNet.add(scf.getInvestorTotalProfit());
				totalSellerFees = totalSellerFees.add(scf.getSellerFees());
				totalWhiteHallFees = totalWhiteHallFees.add(scf.getWhitehallTotalProfit());
				totalSellerAmount = totalSellerAmount.add(scf.getSellerNetAllotment());
			}
			model.put("userType", Constants.ADMIN);
			model.put("totalTradeAmount", totalTradeAmount);
			model.put("totalInvestorProfit", totalInvestorProfit);
			model.put("totalWhiteHallShare", totalWhiteHallShare);
			model.put("totalInvestorNet", totalInvestorNet);
			model.put("totalSellerFees", totalSellerFees);
			model.put("totalWhiteHallFees", totalWhiteHallFees);
			model.put("totalSellerAmount", totalSellerAmount);
			model.put(ACTIVETAB, "admintradelist");

			viewName = "admintradelist";
		}
		else if (request.isUserInRole(Constants.SCF_ADMIN)) {
			BigDecimal totalTradeAmount = BigDecimal.ZERO;
			DateFormat formatter = new SimpleDateFormat("MM/dd/yyyy");
			Date fromDate = null;
			Date toDate = null;
			String search = ParamUtil.getString(request, "Search");
			String value = ParamUtil.getString(request, "dateList");
			String from = ParamUtil.getString(request, "fromDate");
			String to = ParamUtil.getString(request, "toDate");
			if (!StringUtils.isNullOrEmpty(from)) {
				fromDate = formatter.parse(from);
			}
			if (!StringUtils.isNullOrEmpty(to)) {
				toDate = formatter.parse(to);
			}
			long companyId = userService.getCompanybyUserID(themeDisplay.getUserId()).getId();
			
			if(StringUtils.isNullOrEmpty(search)&& StringUtils.isNullOrEmpty(value)){
				scftrades = scfTradeService.getScfTrades(companyId, paginationModel.getStartIndex(), paginationModel.getPageSize());
				noOfRecords = scfTradeService.getScfTradesCount(companyId);
			}else{
				scftrades = scfTradeService.getScfAdminTradeListWithSearch(
									companyId, search, fromDate, toDate, value, paginationModel.getStartIndex(), paginationModel.getPageSize());
				noOfRecords = scfTradeService.getScfAdminTradeListWithSearchCount(companyId, search, fromDate, toDate, value);
				model.put("scftrades", scftrades);
			}
			model.put("search", search);
			model.put("from", from);
			model.put("to", to);
			model.put("value", value);

			for (SCFTrade scf : scftrades) {
				totalTradeAmount = totalTradeAmount.add(scf.getTradeAmount());
			}
			model.put("totalTradeAmount", totalTradeAmount);
			viewName = "tradelist";
		}
		else if (request.isUserInRole(Constants.SELLER_ADMIN)) {

			String regNum = liferayUtility.getWhiteHallComapanyRegNo(request);
			scftrades = scfTradeService.getScfTradeList(regNum, paginationModel.getStartIndex(), paginationModel.getPageSize());
			noOfRecords = scfTradeService.getScfTradeCounts(regNum);
			viewName = "sellertradelist";
		}
		model.put("trades", scftrades);
		paginationUtil.setPaginationInfo(noOfRecords, paginationModel);
		System.out.println("paginationsss:" + paginationModel);
		model.put("paginationModel", paginationModel);
		return new ModelAndView(viewName, model);
	}

	@RenderMapping(params = "render=tradeHistory")
	protected ModelAndView renderTradeHistory(
		@ModelAttribute("tradehistoryModel") SCFTradeDTO scfTradeDTO, ModelMap model, RenderRequest request, RenderResponse response)
		throws Exception {

		System.out.println("iam coming from get methiod");
		List<SCFTrade> scfTrades = null;
		BigDecimal totalTradeAmount = BigDecimal.ZERO;
		Long noOfRecords = 0l;
		PaginationModel paginationModel = paginationUtil.preparePaginationModel(request);
		scfTrades = scfTradeService.getTradeHistoryList(paginationModel.getStartIndex(), paginationModel.getPageSize());
		noOfRecords = scfTradeService.getScfTradesHistoryCount();
		System.out.println("noOfRecordsSSSSS:" + scfTrades);
		for (SCFTrade scf : scfTrades) {
			totalTradeAmount = totalTradeAmount.add(scf.getTradeAmount());
		}
		paginationUtil.setPaginationInfo(noOfRecords, paginationModel);
		System.out.println("paginationsss:" + paginationModel);
		model.put("paginationModel", paginationModel);
		model.put(ACTIVETAB, "tradehistory");
		model.put("scfTradesHistory", scfTrades);
		model.put("totalTradeAmount", totalTradeAmount);
		model.put("userType", Constants.ADMIN);

		return new ModelAndView("tradehistory", model);
	}

	@RenderMapping(params = "render=singleHistory")
	protected ModelAndView rendersingleHistory(ModelMap model, RenderRequest request, RenderResponse response) {

		List<SCFTrade> scfTrades = null;
		BigDecimal totalTradeAmount = BigDecimal.ZERO;

		Long noOfRecords = 0l;
		PaginationModel paginationModel = paginationUtil.preparePaginationModel(request);
		Long compID = ParamUtil.getLong(request, "compID");
		scfTrades = scfTradeService.getTradeHistoryByComapnyId(compID, paginationModel.getStartIndex(), paginationModel.getPageSize());
		noOfRecords = scfTradeService.getHistoryCount(compID);
		for (SCFTrade scf : scfTrades) {
			totalTradeAmount = totalTradeAmount.add(scf.getTradeAmount());
		}
		paginationUtil.setPaginationInfo(noOfRecords, paginationModel);
		System.out.println("paginationsss:" + paginationModel);
		model.put("paginationModel", paginationModel);
		model.put("scfTradesHistory", scfTrades);
		model.put("totalTradeAmount", totalTradeAmount);
		model.put("compID", compID);

		return new ModelAndView("singlehistorytrade", model);
	}

	@ActionMapping(params = "page=historyBack")
	protected void pageBack(ModelMap model, ActionRequest request, ActionResponse response) {

		response.setRenderParameter("render", "tradeHistory");

	}

	@RenderMapping(params = "render=createTrade")
	protected ModelAndView renderCreateTrade(
		@ModelAttribute("scfTradeModel") SCFTradeDTO scfTradeDTO, ModelMap model, RenderRequest request, RenderResponse response)
		throws Exception {

		Long tradeID = ParamUtil.getLong(request, "tradeID");
		String sellerRegNo=invoiceService.getSellerRegNumberByTradeID(tradeID);
		Company company=companyService.getCompaniesByRegNum(sellerRegNo);
		if (tradeID == null || tradeID == 0) {
			String invoiceIds = ParamUtil.getString(request, "invoices");
			Map<Company, BigDecimal> invoiceMap = invoiceService.getInvoicesAmount(invoiceIds);
			Map.Entry<Company, BigDecimal> entry = invoiceMap.entrySet().iterator().next();
			scfTradeDTO.setTradeAmount(entry.getValue());
			scfTradeDTO.setCompany(entry.getKey());
			model.put("invoiceList", invoiceService.getInvoices(invoiceIds));
			model.put("invoiceIds", invoiceIds);
		}
		else {
			SCFTrade scfTrade = scfTradeService.findById(tradeID);
			scfTradeDTO = transformTOScfTradeDTO(scfTrade);
			model.put("invoiceList", scfTrade.getInvoices());

		}
		model.put("scfTradeModel", scfTradeDTO);
		model.put("sellerName", company.getName());		
		return new ModelAndView("createscftrade", model);

	}

	@RenderMapping(params = "render=singleTrade")
	protected ModelAndView renderSingleTrade(ModelMap model, RenderRequest request, RenderResponse response) {

		Long tradeID = ParamUtil.getLong(request, "tradeID");
		SCFTrade scfTrade = scfTradeService.findById(tradeID);
		List<Allotment> allotmentList = allotmentService.groupAllotmentbyBps(tradeID);
		long companyId = liferayUtility.getWhitehallCompanyID(request);
		Company company = companyService.findById(companyId);
		model.put("allotments", allotmentList);
		model.put("trades", scfTrade);
		model.put("sellerName", company.getName());	
		model.put("invoiceList", scfTrade.getInvoices());

		return new ModelAndView("suppliertrade", model);
	}

	@ActionMapping(params = "action=saveTrade")
	protected void saveTarde(@ModelAttribute("scfTradeModel") SCFTradeDTO scfTradeDTO, ModelMap model, ActionRequest request, ActionResponse response)
		throws Exception {

		try {

			ThemeDisplay themeDisplay = (ThemeDisplay) request.getAttribute(WebKeys.THEME_DISPLAY);
			long currentSideID = themeDisplay.getScopeGroupId();
			long parentFolderId = DLFolderConstants.DEFAULT_PARENT_FOLDER_ID;
			ServiceContext serviceContextDlFolder = ServiceContextFactory.getInstance(DLFolder.class.getName(), request);
			Folder parentfolder = null;
			parentfolder = DLAppServiceUtil.getFolder(currentSideID, 0, "Insurance");
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
				List<String> invoicesIdList = Arrays.asList(scfTradeDTO.getInvoiceIds().split(","));
				invoiceService.updateInvoicesStatusWithTrade(invoicesIdList, InvoiceStatus.TRADE_GENERATED.getValue(), scfTrade.getId());
			}

			if (scfTrade.getWantToInsure()) {
				addInsuranceDocument(scfTradeDTO, request, themeDisplay, currentSideID, parentFolderId, serviceContextDlFolder, scfTrade);
			}
		}
		catch (Exception e) {
			e.printStackTrace();
			_log.error("Error Occured while saving Trade" + e.getMessage());
		}

	}

	@ResourceMapping("breakdownURL")
	public ModelAndView fetchAllotmentBreak(ResourceRequest request, ResourceResponse response, ModelMap modelMap)
		throws IOException {

		long tradeID = ParamUtil.getLong(request, "tradeID", 0);
		List<Allotment> allotmentList = allotmentService.getALlotmentsbyTrade(tradeID);
		modelMap.put("allotmentList", allotmentList);
		modelMap.put("tradeID", tradeID);
		return new ModelAndView("allotmentbreakup");
	}

	private void addInsuranceDocument(
		SCFTradeDTO scfTradeDTO, ActionRequest request, ThemeDisplay themeDisplay, long currentSideID, long parentFolderId,
		ServiceContext serviceContextDlFolder, SCFTrade scfTrade)
		throws PortalException, SystemException, IOException {

		FileEntry fileEntry;
		Folder folder;
		scfTrade = scfTradeService.findById(scfTrade.getId());
		folder =
			DLAppServiceUtil.addFolder(currentSideID, parentFolderId, scfTrade.getId().toString(), "Trade Insurance Folder", serviceContextDlFolder);
		String mimeType =
			MimeTypesUtil.getContentType(scfTradeDTO.getInsuranceDocument().getInputStream(), scfTradeDTO.getInsuranceDocument().getName());
		ServiceContext serviceContext = ServiceContextFactory.getInstance(DLFileEntry.class.getName(), request);
		fileEntry =
			DLAppServiceUtil.addFileEntry(
				themeDisplay.getScopeGroupId(), folder.getFolderId(), scfTradeDTO.getInsuranceDocument().getOriginalFilename(), mimeType,
				scfTradeDTO.getInsuranceDocument().getOriginalFilename(), scfTradeDTO.getInsuranceDocument().getOriginalFilename(), "upload",
				scfTradeDTO.getInsuranceDocument().getInputStream(), scfTradeDTO.getInsuranceDocument().getSize(), serviceContext);
		scfTrade.setInsuranceDocId(fileEntry.getFileEntryId());
		scfTrade.setInsuranceDocName(scfTradeDTO.getInsuranceDocument().getOriginalFilename());
		scfTrade.setInsuranceDocUrl(getUrl(themeDisplay, fileEntry));
		scfTrade.setInsuranceDocType(mimeType);
		scfTrade.setUpdatDate(new Date());
		// scfTrade.getInvoices().addAll(scfTrade.getInvoices());
		scfTradeService.updateTrade(scfTrade);
	}

	@SuppressWarnings("unchecked")
	@ActionMapping(params = "action=updateStatus")
	protected void saveTarde(ModelMap model, ActionRequest request, ActionResponse response)
		throws Exception {

		Long tradeID;
		String status=null;
		SCFTrade scfTrade=null;
		PortletConfig portletConfig = (PortletConfig) request.getAttribute(JavaConstants.JAVAX_PORTLET_CONFIG);
		try {
			tradeID = ParamUtil.getLong(request, "tradeID");
			status = ParamUtil.getString(request, "status");
			scfTrade = scfTradeService.findById(tradeID);
			scfTrade.setStatus(status);
			scfTradeService.updateTradeLifeCycle(scfTrade);
			
		

		if (TradeStatus.ALLOTMENT_PAID.getValue().equalsIgnoreCase(status)) {
			// Email Notification
		
				String articleName = "create-invoice-by-scf-company"; // Web
																		// Content's
																		// UrlTitle
				String content = liferayUtility.getContentByURLTitle(request, articleName);
				List<Invoice> invlist = (List<Invoice>) scfTrade.getInvoices();
				content = content.replaceAll("\\[PH-NAME\\]", "");
				content = content.replaceAll("\\[PH-REGARDS\\]", "White Hall Finance");
				String tempstart =
					"<table border=\"1\" cellpadding=\"1\" cellspacing=\"1\" style=\"width:500px;\"><tbody><tr><td><strong>Invoice Number</strong></td><td><strong>Invoice Amount</strong></td><td><strong>Date&nbsp;</strong></td></tr>";
				String tempend = "</tbody></table>";
				String middle = "";
				for (Invoice inv : invlist) {
					middle =
						"<tr><td>" + inv.getInvoiceNumber() + "</td><td>" + inv.getInvoiceAmount() + "</td><td>" + inv.getInvoiceDate() +
							"</td></tr>";
				}
				String tempstr = tempstart + middle + tempend;
				content = content.replaceAll("\\[PH-CONTENT\\]", tempstr);

				String from = LanguageUtil.get(portletConfig, request.getLocale(), "invoice.sender.email");
				// String to =
				// userService.findUserOjectByCompanyId(invoiceModel.getScfCompany().getId());
				String to = "gautam.tf2015@gmail.com";

				System.out.println("\ncontent - " + content);
				System.out.println("\nfrom - " + from);
				System.out.println("\nto - " + to);
				System.out.println("\ntempstr - " + tempstr);

				if (!content.endsWith("") && !from.endsWith("") && !to.endsWith("")) {
					liferayUtility.sendEmail(request, from, to, "Your invoice has been created.", content);
				}

			}
			
		else if (TradeStatus.SUPPLIER_PAID.getValue().equalsIgnoreCase(status)) {
			// Email Notification
			
				String articleName = "create-invoice-by-scf-company"; // Web
																		// Content's
																		// UrlTitle
				String content = liferayUtility.getContentByURLTitle(request, articleName);

				List<Invoice> invlist = (List<Invoice>) scfTrade.getInvoices();
				content = content.replaceAll("\\[PH-NAME\\]", "");
				content = content.replaceAll("\\[PH-REGARDS\\]", "White Hall Finance");
				String tempstart =
					"<table border=\"1\" cellpadding=\"1\" cellspacing=\"1\" style=\"width:500px;\"><tbody><tr><td><strong>Invoice Number</strong></td><td><strong>Invoice Amount</strong></td><td><strong>Date&nbsp;</strong></td></tr>";
				String tempend = "</tbody></table>";
				String middle = "";
				for (Invoice inv : invlist) {
					middle =
						"<tr><td>" + inv.getInvoiceNumber() + "</td><td>" + inv.getInvoiceAmount() + "</td><td>" + inv.getInvoiceDate() +
							"</td></tr>";
				}
				String tempstr = tempstart + middle + tempend;
				content = content.replaceAll("\\[PH-CONTENT\\]", tempstr);

				String from = LanguageUtil.get(portletConfig, request.getLocale(), "invoice.sender.email");
				// String to =
				// userService.findUserOjectByCompanyId(invoiceModel.getScfCompany().getId());
				String to = "gautam.tf2015@gmail.com";

				System.out.println("\ncontent - " + content);
				System.out.println("\nfrom - " + from);
				System.out.println("\nto - " + to);
				System.out.println("\ntempstr - " + tempstr);

				if (!content.endsWith("") && !from.endsWith("") && !to.endsWith("")) {
					liferayUtility.sendEmail(request, from, to, "Your invoice has been created.", content);
				}

			}
		}
		catch (InSuffcientFund e) {
			SessionErrors.add(request, "trade.allotment.error");
			e.getMessage();
		} 
		catch (Exception e) {
			e.getMessage();
		}


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
		scfTrade.setInvoices(invoiceService.getInvoices(scfTradeDTO.getInvoiceIds()));
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

		long searchSelection = Long.valueOf(ParamUtil.getString(request, "searchSelection", ""));
		try {

			SCFTrade sellerList = scfTradeService.findById(searchSelection);

			System.out.println("userSelections" + sellerList);
			Gson gson = new Gson();
			settingmodel = gson.toJson(sellerList);
			response.getWriter().println(settingmodel);
			System.out.println("userSelections" + settingmodel);

		}
		catch (Exception e) {
			_log.error("Error occured while fetchSettings" + e.getMessage());
			response.setProperty(ResourceResponse.HTTP_STATUS_CODE, "400");
		}

	}

	@RenderMapping(params = "action=tradeRedirect")
	public ModelAndView tradeRedirect(ModelMap model, RenderRequest request, RenderResponse response)
		throws Exception {

		model.put("userType", Constants.ADMIN);
		model.put(ACTIVETAB, "tradehistory");
		return new ModelAndView("tradehistory", model);
	}

	@RenderMapping(params = "action=singleHistory")
	public String tradeSingleHistory(ModelMap model, RenderRequest request, RenderResponse response)
		throws Exception {

		return "singlehistorytrade";
	}

	@ActionMapping(params = "trade=getTradeHistory")
	protected void getTradeHistory(ModelMap model, ActionRequest request, ActionResponse response)
		throws Exception {

		DateFormat formatter = new SimpleDateFormat("MM/dd/yyyy");
		Date fromDate = null;
		Date toDate = null;
		String companyName = ParamUtil.getString(request, "Search");
		String from = ParamUtil.getString(request, "fromDate");
		String to = ParamUtil.getString(request, "toDate");
		if (!StringUtils.isNullOrEmpty(from)) {
			fromDate = formatter.parse(from);
		}
		if (!StringUtils.isNullOrEmpty(to)) {
			toDate = formatter.parse(to);
		}
		Long noOfRecords = 0l;
		PaginationModel paginationModel = paginationUtil.preparePaginationModel(request);
		List<SCFTrade> scfTradesList =
			scfTradeService.getScfTradeByScfCompany(companyName, fromDate, toDate, paginationModel.getStartIndex(), paginationModel.getPageSize());
		noOfRecords = scfTradeService.getScfTradeByScfCompanyCount(companyName, fromDate, toDate);
		paginationUtil.setPaginationInfo(noOfRecords, paginationModel);
		model.put("paginationModel", paginationModel);
		System.out.println("DhanushSuccess:" + scfTradesList);
		model.put("scfTradesList", scfTradesList);
		model.put("companyName", companyName);
		model.put("fromDate", from);
		model.put("toDate", to);

		response.setRenderParameter("action", "tradeRedirect");

	}

	@ActionMapping(params = "trade=getSellerHistory")
	protected void getSellerHistory(ModelMap model, ActionRequest request, ActionResponse response)
		throws Exception {

		DateFormat formatter = new SimpleDateFormat("MM/dd/yyyy");
		Date fromDate = null;
		Date toDate = null;
		List<SCFTrade> scfTradesList = null;
		List<SCFTrade> scfTrades = null;
		BigDecimal totalTradeAmount = BigDecimal.ZERO;

		Long compID = ParamUtil.getLong(request, "compID");
		System.out.println("SS123:" + compID);
		String companyName = ParamUtil.getString(request, "Search");
		String from = ParamUtil.getString(request, "fromDate");
		String to = ParamUtil.getString(request, "toDate");
		if (!StringUtils.isNullOrEmpty(from)) {
			fromDate = formatter.parse(from);
		}
		if (!StringUtils.isNullOrEmpty(to)) {
			toDate = formatter.parse(to);
		}
		try {
			Long noOfRecords = 0l;
			PaginationModel paginationModel = paginationUtil.preparePaginationModel(request);
			scfTradesList =
				scfTradeService.getScfTradeSellerCompany(
					companyName, fromDate, toDate, compID, paginationModel.getStartIndex(), paginationModel.getPageSize());
			noOfRecords = scfTradeService.getScfTradeSellerCompanyCount(companyName, fromDate, toDate, compID);
		
			scfTrades = scfTradeService.getTradeHistoryByComapnyId(compID, paginationModel.getStartIndex(), paginationModel.getPageSize());
			noOfRecords=scfTradeService.getHistoryCount(compID);
			for (SCFTrade scf : scfTrades) {
				totalTradeAmount = totalTradeAmount.add(scf.getTradeAmount());
			
			}
			paginationUtil.setPaginationInfo(noOfRecords, paginationModel);
			model.put("scfTradesList", scfTradesList);
			model.put("paginationModel", paginationModel);
			model.put("compID", compID);
			model.put("totalTradeAmount", totalTradeAmount);
			model.put("companyName", companyName);
			model.put("fromDate", from);
			model.put("toDate", to);
			response.setRenderParameter("action", "singleHistory");
		
		}catch (Exception ex) {
			_log.error("Error occurred while filtering the sellercompany:" + ex.getMessage());
		}

	}

	@RenderMapping(params = "action=getSellerTrade")
	public String getSellerTrade(ModelMap model, RenderRequest request, RenderResponse response)
		throws Exception {

		return "sellertradelist";
	}

	@ActionMapping(params = "seller=getSellerTrade")
	protected void getSellerTrade(ModelMap model, ActionRequest request, ActionResponse response)
		throws Exception {

		List<SCFTrade> trades = null;
		List<SCFTrade> scftrades = null;
		Long noOfRecords = 0l;
		PaginationModel paginationModel = paginationUtil.preparePaginationModel(request);
		String regNum = liferayUtility.getWhiteHallComapanyRegNo(request);
		String search = ParamUtil.getString(request, "Search");

		if (!StringUtils.isNullOrEmpty(search)) {
			scftrades = scfTradeService.getScfTradeListWithSearch(search, regNum, paginationModel.getStartIndex(), paginationModel.getPageSize());
			noOfRecords = scfTradeService.getScfTradeListWithSearchCount(search, regNum);
		}
		else {
			trades = scfTradeService.getScfTradeList(regNum, paginationModel.getStartIndex(), paginationModel.getPageSize());
			noOfRecords = scfTradeService.getScfTradeCounts(regNum);
		}

		paginationUtil.setPaginationInfo(noOfRecords, paginationModel);
		model.put("trades", trades);
		model.put("scftrades", scftrades);
		model.put("search", search);
		model.put("paginationModel", paginationModel);
		response.setRenderParameter("action", "getSellerTrade");

	}

	@RenderMapping(params = "action=getAdminTrade")
	public String getAdminTrade(ModelMap model, RenderRequest request, RenderResponse response)
		throws Exception {

		model.put("userType", Constants.ADMIN);

		return "admintradelist";
	}

	@ActionMapping(params = "admin=getAdminTrade")
	protected void getAdminTrade(ModelMap model, ActionRequest request, ActionResponse response)
		throws Exception {
		BigDecimal totalTradeAmount = BigDecimal.ZERO;
		BigDecimal totalInvestorProfit = BigDecimal.ZERO;
		BigDecimal totalWhiteHallShare = BigDecimal.ZERO;
		BigDecimal totalInvestorNet = BigDecimal.ZERO;
		BigDecimal totalSellerFees = BigDecimal.ZERO;
		BigDecimal totalWhiteHallFees = BigDecimal.ZERO;
		BigDecimal totalSellerAmount = BigDecimal.ZERO;
		List<SCFTrade> scftrades = null;
		List<SCFTrade> trades = null;
		DateFormat formatter = new SimpleDateFormat("MM/dd/yyyy");
		Date fromDate = null;
		Date toDate = null;
		String search = ParamUtil.getString(request, "Search");
		String value = ParamUtil.getString(request, "dateList");
		String from = ParamUtil.getString(request, "fromDate");
		String to = ParamUtil.getString(request, "toDate");
		if (!StringUtils.isNullOrEmpty(from)) {
			fromDate = formatter.parse(from);
		}
		if (!StringUtils.isNullOrEmpty(to)) {
			toDate = formatter.parse(to);
		}
		Long noOfRecords = 0l;
		PaginationModel paginationModel = paginationUtil.preparePaginationModel(request);
		if(StringUtils.isNullOrEmpty(search) && StringUtils.isNullOrEmpty(value)){
			trades = scfTradeService.getScfTrades(paginationModel.getStartIndex(), paginationModel.getPageSize());
			noOfRecords = scfTradeService.getScfTradesCount();
			for (SCFTrade scf : trades) {
				totalTradeAmount = totalTradeAmount.add(scf.getTradeAmount());
				totalInvestorProfit = totalInvestorProfit.add(scf.getInvestorTotalGross());
				totalWhiteHallShare = totalWhiteHallShare.add(scf.getWhitehallTotalShare());
				totalInvestorNet = totalInvestorNet.add(scf.getInvestorTotalProfit());
				totalSellerFees = totalSellerFees.add(scf.getSellerFees());
				totalWhiteHallFees = totalWhiteHallFees.add(scf.getWhitehallTotalProfit());
				totalSellerAmount = totalSellerAmount.add(scf.getSellerNetAllotment());
			}
			model.put("totalTradeAmount", totalTradeAmount);
			model.put("totalInvestorProfit", totalInvestorProfit);
			model.put("totalWhiteHallShare", totalWhiteHallShare);
			model.put("totalInvestorNet", totalInvestorNet);
			model.put("totalSellerFees", totalSellerFees);
			model.put("totalWhiteHallFees", totalWhiteHallFees);
			model.put("totalSellerAmount", totalSellerAmount);
		}else{
			scftrades =
					scfTradeService.getAdminTradeListWithSearch(
						search, fromDate, toDate, value, paginationModel.getStartIndex(), paginationModel.getPageSize());
				noOfRecords = scfTradeService.getAdminTradeListWithSearchCount(search, fromDate, toDate, value);
		}
		paginationUtil.setPaginationInfo(noOfRecords, paginationModel);
		model.put("scftrades", scftrades);
		model.put("trades", trades);
		model.put("search", search);
		model.put("from", from);
		model.put("to", to);
		model.put("value", value);
		model.put("paginationModel", paginationModel);
		response.setRenderParameter("action", "getAdminTrade");

	}

}
