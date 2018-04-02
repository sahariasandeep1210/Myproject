
package com.tf.controller.trade;

import java.beans.PropertyEditorSupport;
import java.io.IOException;
import java.math.BigDecimal;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.portlet.ActionRequest;
import javax.portlet.ActionResponse;
import javax.portlet.PortletConfig;
import javax.portlet.PortletSession;
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

import com.liferay.portal.kernel.exception.PortalException;
import com.liferay.portal.kernel.exception.SystemException;
import com.liferay.portal.kernel.language.LanguageUtil;
import com.liferay.portal.kernel.log.Log;
import com.liferay.portal.kernel.log.LogFactoryUtil;
import com.liferay.portal.kernel.repository.model.FileEntry;
import com.liferay.portal.kernel.repository.model.Folder;
import com.liferay.portal.kernel.search.ParseException;
import com.liferay.portal.kernel.servlet.SessionErrors;
import com.liferay.portal.kernel.util.JavaConstants;
import com.liferay.portal.kernel.util.MimeTypesUtil;
import com.liferay.portal.kernel.util.ParamUtil;
import com.liferay.portal.kernel.util.WebKeys;
import com.liferay.portal.model.ResourceConstants;
import com.liferay.portal.model.Role;
import com.liferay.portal.model.RoleConstants;
import com.liferay.portal.security.permission.ActionKeys;
import com.liferay.portal.security.permission.PermissionChecker;
import com.liferay.portal.service.ResourcePermissionLocalServiceUtil;
import com.liferay.portal.service.RoleLocalServiceUtil;
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
import com.tf.persistance.util.TradeStatus;
import com.tf.persistance.util.ValidationUtil;
import com.tf.service.AllotmentService;
import com.tf.service.CompanyService;
import com.tf.service.InvestorService;
import com.tf.service.InvoiceService;
import com.tf.service.SCFTradeService;
import com.tf.service.UserService;
import com.tf.util.LiferayUtility;
import com.tf.util.MyCustomNumberEditor;
import com.tf.util.PaginationUtil;
import com.tf.util.SCFTradeDTO;
import com.tf.util.model.PaginationModel;

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
	protected  ValidationUtil  validationUtil;
	
	@Autowired
	protected  InvestorService  investorService;

	@InitBinder
	public void binder(WebDataBinder binder) {

		binder.registerCustomEditor(Date.class, new PropertyEditorSupport() {

			public void setAsText(String value) {

				try {
					setValue(new SimpleDateFormat(Constants.DATE_FORMAT).parse(value));
				}
				catch (Exception e) {
					setValue(null);
				}
			}

			public String getAsText() {

				if (getValue() != null) {
					return new SimpleDateFormat(Constants.DATE_FORMAT).format((Date) getValue());
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

		if (permissionChecker.isOmniadmin() || request.isUserInRole(Constants.WHITEHALL_ADMIN)) {
			BigDecimal totalTradeAmount = BigDecimal.ZERO;
			BigDecimal totalInvestorProfit = BigDecimal.ZERO;
			BigDecimal totalWhiteHallShare = BigDecimal.ZERO;
			BigDecimal totalInvestorNet = BigDecimal.ZERO;
			BigDecimal totalSellerFees = BigDecimal.ZERO;
			BigDecimal totalWhiteHallFees = BigDecimal.ZERO;
			BigDecimal totalSellerAmount = BigDecimal.ZERO;
			
			/*added by avneet*/
			
			BigDecimal totalTradeAmounts = BigDecimal.ZERO;
			BigDecimal totalInvestorTotalGross = BigDecimal.ZERO;
			BigDecimal totalWhitehallTotalShare = BigDecimal.ZERO;
			BigDecimal totalInvestorTotalProfit = BigDecimal.ZERO;
			BigDecimal totalWhitehallTotalProfit = BigDecimal.ZERO;
			BigDecimal totalWhitehallSeller = BigDecimal.ZERO;
			BigDecimal totalSellerNetAllotment = BigDecimal.ZERO;
			
			BigDecimal totalSellerTransFee = BigDecimal.ZERO;
			BigDecimal totalSellerFeess =  BigDecimal.ZERO;
			
			
			DateFormat formatter = new SimpleDateFormat(Constants.DATE_FORMAT);
			Date fromDate = null;
			Date toDate = null;
			String fromDateString = null;
			String toDateString = null;
			String search = ParamUtil.getString(request, "Search");
			String value = ParamUtil.getString(request, "dateList");
			String from = ParamUtil.getString(request, "fromDate");
			String to = ParamUtil.getString(request, "toDate");
			String tradeID = ParamUtil.getString(request, "tradeID");			
			
			
			
			String columnName = ParamUtil.getString(request, "sort_Column");
			String order = ParamUtil.getString(request, "sort_order");
			String sortCompany_order = ParamUtil.getString(request, "sortVal_order");
			model.put("sortCompany_order", sortCompany_order);
			model.put("sort_Column", columnName);
			model.put("sort_order", order);
			
			if (!StringUtils.isNullOrEmpty(from)) {
				fromDateString = Constants.formatDate(from);
			}
			if (!StringUtils.isNullOrEmpty(to)) {
				toDateString = Constants.formatDate(to);
			}
			
			if (!StringUtils.isNullOrEmpty(from)) {
				fromDate = formatter.parse(from);
			}
			if (!StringUtils.isNullOrEmpty(to)) {
				toDate = formatter.parse(to);
			}
			if (StringUtils.isNullOrEmpty(search) && StringUtils.isNullOrEmpty(value)) {

				scftrades = scfTradeService.getScfTrades(paginationModel.getStartIndex(), paginationModel.getPageSize(),columnName,order);
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
				
				List listSum = scfTradeService.getSumOfSCFTradePropertiesForAdmin(search,null,null,null);
				   if (null != listSum || listSum.size() > 0) {
				    Object[] obj = (Object[]) listSum.get(0);
				    
				     totalTradeAmounts = (BigDecimal) obj[0];
					 totalInvestorTotalGross = obj[1]!=null ?(BigDecimal) obj[1]:BigDecimal.ZERO;
					 totalWhitehallTotalShare =obj[2]!=null ?(BigDecimal) obj[2]:BigDecimal.ZERO;
					 totalInvestorTotalProfit = obj[3]!=null ? (BigDecimal) obj[3]:BigDecimal.ZERO;
					 totalWhitehallTotalProfit = obj[4]!=null ?(BigDecimal) obj[4]:BigDecimal.ZERO;
					 totalSellerNetAllotment = obj[5]!=null ?(BigDecimal) obj[5]:BigDecimal.ZERO;
					 totalSellerTransFee = obj[6]!=null ? (BigDecimal) obj[6]:BigDecimal.ZERO;
					 totalSellerFeess = obj[7]!=null ?(BigDecimal) obj[7]:BigDecimal.ZERO;
					 totalWhitehallSeller = totalWhitehallSeller.add(totalSellerFeess).add(totalSellerTransFee);
				   }
			}
			else {
				scftrades =
					scfTradeService.getAdminTradeListWithSearch(
						search, fromDate, toDate, value, paginationModel.getStartIndex(), paginationModel.getPageSize(),columnName,order);
				noOfRecords = scfTradeService.getAdminTradeListWithSearchCount(search, fromDate, toDate, value);
				
				List listSum = scfTradeService.getSumOfSCFTradePropertiesForAdmin(search, fromDate, toDate, value);
				 if (null != listSum || listSum.size() > 0) {
					    Object[] obj = (Object[]) listSum.get(0);
					    
					     totalTradeAmounts = (BigDecimal) obj[0];
						 totalInvestorTotalGross = (BigDecimal) obj[1];
						 totalWhitehallTotalShare =(BigDecimal) obj[2];
						 totalInvestorTotalProfit = (BigDecimal) obj[3];
						 totalWhitehallTotalProfit = (BigDecimal) obj[4];
						 totalSellerNetAllotment = (BigDecimal) obj[5];
						 totalSellerTransFee = (BigDecimal) obj[6];
						 totalSellerFeess = (BigDecimal) obj[7];
						 totalWhitehallSeller = totalWhitehallSeller.add(totalSellerFeess).add(totalSellerTransFee);
					   }
			}
			
			model.put("totalTradeAmounts", totalTradeAmounts);
			model.put("totalInvestorTotalGross", totalInvestorTotalGross);
			model.put("totalWhitehallTotalShare", totalWhitehallTotalShare);
			model.put("totalInvestorTotalProfit", totalInvestorTotalProfit);
			model.put("totalWhitehallTotalProfit", totalWhitehallTotalProfit);
			model.put("totalSellerNetAllotment", totalSellerNetAllotment);
			model.put("totalWhitehallSeller", totalWhitehallSeller);
			
			model.put("search", search);
			model.put("from", from);
			model.put("to", to);
			model.put("value", value);
			model.put("userType", Constants.WHITEHALL_ADMIN);
			model.put("totalTradeAmount", totalTradeAmount);
			model.put("totalInvestorProfit", totalInvestorProfit);
			model.put("totalWhiteHallShare", totalWhiteHallShare);
			model.put("totalInvestorNet", totalInvestorNet);
			model.put("totalSellerFees", totalSellerFees);
			model.put("totalWhiteHallFees", totalWhiteHallFees);
			model.put("totalSellerAmount", totalSellerAmount);
			model.put(ACTIVETAB, "admintradelist");

			viewName = "admintradelist";
			//viewName = "test";
		}
		else if (request.isUserInRole(Constants.SCF_ADMIN)) {
			BigDecimal totalTradeAmount = BigDecimal.ZERO;
			DateFormat formatter = new SimpleDateFormat(Constants.DATE_FORMAT);
			Date fromDate = null;
			Date toDate = null;
			
			String search = ParamUtil.getString(request, "Search");
			String value = ParamUtil.getString(request, "dateList");
			String from = ParamUtil.getString(request, "fromDate");
			String to = ParamUtil.getString(request, "toDate");
			
			/*Sorting code starts from here*/
			String columnName = ParamUtil.getString(request, "sort_Column");
			String order = ParamUtil.getString(request, "sort_order");
			String sortCompany_order = ParamUtil.getString(request, "sortVal_order");
			model.put("sortCompany_order", sortCompany_order);
			model.put("sort_Column", columnName);
			model.put("sort_order", order);
			
			
			if (!StringUtils.isNullOrEmpty(from)) {
				fromDate = formatter.parse(from);
			}
			if (!StringUtils.isNullOrEmpty(to)) {
				toDate = formatter.parse(to);
			}
			long companyId = userService.getCompanybyUserID(themeDisplay.getUserId()).getId();

			if (StringUtils.isNullOrEmpty(search) && StringUtils.isNullOrEmpty(value)) {
				scftrades = scfTradeService.getScfTrades(companyId, paginationModel.getStartIndex(), paginationModel.getPageSize(),columnName,order);
				noOfRecords = scfTradeService.getScfTradesCount(companyId);
			}
			else {
				scftrades =
					scfTradeService.getScfAdminTradeListWithSearch(
						companyId, search, fromDate, toDate, value, paginationModel.getStartIndex(), paginationModel.getPageSize(),columnName,order);
				noOfRecords = scfTradeService.getScfAdminTradeListWithSearchCount(companyId, search, fromDate, toDate, value);
				
			}
			model.put("search", search);
			model.put("from", from);
			model.put("to", to);
			model.put("value", value);

			for (SCFTrade scf : scftrades) {
				totalTradeAmount = totalTradeAmount.add(scf.getTradeAmount());
			}
			model.put("totalTradeAmount", totalTradeAmount);
			model.put("userType", Constants.SCF_ADMIN);
			viewName = "scftradelist";
		}
		else if (request.isUserInRole(Constants.SELLER_ADMIN)) {
			String search = ParamUtil.getString(request, "Search");
			String regNum = liferayUtility.getWhiteHallComapanyRegNo(request);
			/*Sorting code starts from here*/
			String columnName = ParamUtil.getString(request, "sort_Column");
			String order = ParamUtil.getString(request, "sort_order");
			String sortCompany_order = ParamUtil.getString(request, "sortVal_order");
			model.put("sortCompany_order", sortCompany_order);
			model.put("sort_Column", columnName);
			model.put("sort_order", order);
			if(StringUtils.isNullOrEmpty(search)){
			scftrades = scfTradeService.getScfTradeList(regNum, paginationModel.getStartIndex(), paginationModel.getPageSize(),columnName,order);
			noOfRecords = scfTradeService.getScfTradeCounts(regNum);
			}else{
			scftrades = scfTradeService.getScfTradeListWithSearch(search, regNum, paginationModel.getStartIndex(), paginationModel.getPageSize(),columnName,order);
			noOfRecords = scfTradeService.getScfTradeListWithSearchCount(search, regNum);
			}
			model.put("search", search);
			model.put("userType", Constants.SELLER_ADMIN);
			viewName = "sellertradelist";
		}else{
			
			   BigDecimal totalTradeAmount = BigDecimal.ZERO;
			   BigDecimal totalSellerTransFee = BigDecimal.ZERO;
			   BigDecimal totalSellerFees = BigDecimal.ZERO;
			   BigDecimal totalInvestorTotalGross = BigDecimal.ZERO;
			   BigDecimal totalSellerNetAllotment = BigDecimal.ZERO;
			   BigDecimal totalGrossCharges = BigDecimal.ZERO;
			   
			    DateFormat formatter = new SimpleDateFormat(Constants.DATE_FORMAT);
				Date fromDate = null;
				Date toDate = null;
				String value = ParamUtil.getString(request, "dateList");
				String from = ParamUtil.getString(request, "fromDate"); // These are added by Abhishek to extend search 
				String to = ParamUtil.getString(request, "toDate");
				
			       if (!StringUtils.isNullOrEmpty(from)) {
						fromDate = formatter.parse(from);
					}
					if (!StringUtils.isNullOrEmpty(to)) {
						toDate = formatter.parse(to);
					}	
				
			   
			   /*Sorting code starts from here*/
			   String columnName = ParamUtil.getString(request, "sort_Column");
				String order = ParamUtil.getString(request, "sort_order");
				String sortCompany_order = ParamUtil.getString(request, "sortVal_order");
				model.put("sortCompany_order", sortCompany_order);
				model.put("sort_Column", columnName);
				model.put("sort_order", order);
			
			String search = ParamUtil.getString(request, "Search");
		    Long companyId  = liferayUtility.getWhitehallCompanyID(request);
		    Long investorID=investorService.getInvestorIDByCompanyId(companyId);
		    scftrades = scfTradeService.getScfTradeListForInvestor(search, value,fromDate,toDate,investorID, paginationModel.getStartIndex(), paginationModel.getPageSize(), false,columnName,order);
			List<SCFTrade> list= scfTradeService.getScfTradeListForInvestor(search, value,fromDate,toDate, investorID, paginationModel.getStartIndex(), paginationModel.getPageSize(), true,columnName,order);
			
		    System.out.println("*************************** TradeController_Search 2**** " +search);

			List listSum = scfTradeService.getSumOfSCFTradeProperties(search);
			   if (null != listSum || listSum.size() > 0) {
			    Object[] obj = (Object[]) listSum.get(0);
			    totalTradeAmount = obj[0]!=null?(BigDecimal) obj[0]:BigDecimal.ZERO;
			    totalSellerTransFee =  obj[1] !=null ? (BigDecimal) obj[1]:BigDecimal.ZERO;
			    totalSellerFees = obj[2]!=null ?(BigDecimal) obj[2]:BigDecimal.ZERO;
			    totalInvestorTotalGross = obj[3]!=null?(BigDecimal) obj[3]:BigDecimal.ZERO;
			    totalGrossCharges = totalGrossCharges.add(totalSellerTransFee)
			      .add(totalSellerFees).add(totalInvestorTotalGross);
			    totalSellerNetAllotment = (BigDecimal) obj[4];
			   }
			   if(list!=null & list.size()>0){
			    noOfRecords=(long) list.get(list.size()-1).getId();
			   }
			   model.put("totalTradeAmount", totalTradeAmount);
			   model.put("totalSellerTransFee", totalSellerTransFee);
			   model.put("totalSellerFees", totalSellerFees);
			   model.put("totalInvestorTotalGross", totalInvestorTotalGross);
			   model.put("totalGrossCharges", totalGrossCharges);
			   model.put("totalSellerNetAllotment", totalSellerNetAllotment);
			
			
			model.put("search", search);
			model.put("from", from);
			model.put("to", to);
			model.put("value", value);
			model.put("userType", Constants.PRIMARY_INVESTOR_ADMIN);
			viewName = "inverstortradelist";
		}
		model.put("scftrades", scftrades);
		paginationUtil.setPaginationInfo(noOfRecords, paginationModel);
		System.out.println("paginationsss:" + paginationModel);
		model.put("paginationModel", paginationModel);
		return new ModelAndView(viewName, model);
	}

	@RenderMapping(params = "render=tradeHistory")
	protected ModelAndView renderTradeHistory(
		@ModelAttribute("tradehistoryModel") SCFTradeDTO scfTradeDTO, ModelMap model, RenderRequest request, RenderResponse response)
		throws Exception {

		List<SCFTrade> scfTrades = null;
		BigDecimal totalTradeAmount = BigDecimal.ZERO;
		DateFormat formatter = new SimpleDateFormat(Constants.DATE_FORMAT);
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
		if (StringUtils.isNullOrEmpty(companyName) && StringUtils.isNullOrEmpty(from) && StringUtils.isNullOrEmpty(to)) {
			scfTrades = scfTradeService.getTradeHistoryList(paginationModel.getStartIndex(), paginationModel.getPageSize());
			noOfRecords = scfTradeService.getScfTradesHistoryCount();
			for (SCFTrade scf : scfTrades) {
				totalTradeAmount = totalTradeAmount.add(scf.getTradeAmount());
			}
		}
		else {
			scfTrades =
				scfTradeService.getScfTradeByScfCompany(companyName, fromDate, toDate, paginationModel.getStartIndex(), paginationModel.getPageSize());
			noOfRecords = scfTradeService.getScfTradeByScfCompanyCount(companyName, fromDate, toDate);
		}
		
		paginationUtil.setPaginationInfo(noOfRecords, paginationModel);
		model.put("scfTradesList", scfTrades);
		model.put("companyName", companyName);
		model.put("fromDate", from);
		model.put("toDate", to);
		model.put("paginationModel", paginationModel);
		model.put(ACTIVETAB, "tradehistory");
		model.put("scfTradesHistory", scfTrades);
		model.put("totalTradeAmount", totalTradeAmount);
		model.put("userType", Constants.ADMIN);

		return new ModelAndView("tradehistory", model);
	}

	@RenderMapping(params = "render=singleHistory")
	protected ModelAndView rendersingleHistory(ModelMap model, RenderRequest request, RenderResponse response) throws Exception {
		List<SCFTrade> scfTrades = null;
		List<SCFTrade> scfTradesList = null;
		BigDecimal totalTradeAmount = BigDecimal.ZERO;
		DateFormat formatter = new SimpleDateFormat(Constants.DATE_FORMAT);
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
		Long compID = ParamUtil.getLong(request, "compID");
		if(StringUtils.isNullOrEmpty(companyName)&& StringUtils.isNullOrEmpty(from)&&StringUtils.isNullOrEmpty(to)){
		scfTrades = scfTradeService.getTradeHistoryByComapnyId(compID, paginationModel.getStartIndex(), paginationModel.getPageSize());
		noOfRecords = scfTradeService.getHistoryCount(compID);
		for (SCFTrade scf : scfTrades) {
			totalTradeAmount = totalTradeAmount.add(scf.getTradeAmount());
		}
	}	else{
		scfTradesList =scfTradeService.getScfTradeSellerCompany(
							companyName, fromDate, toDate, compID, paginationModel.getStartIndex(), paginationModel.getPageSize());
					   noOfRecords = scfTradeService.getScfTradeSellerCompanyCount(companyName, fromDate, toDate, compID);

	}
		paginationUtil.setPaginationInfo(noOfRecords, paginationModel);
		model.put("scfTradesList", scfTradesList);
		model.put("companyName", companyName);
		model.put("fromDate", from);
		model.put("toDate", to);
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
		String sellerRegNo = invoiceService.getSellerRegNumberByTradeID(tradeID);
		Company company = companyService.getCompaniesByRegNum(sellerRegNo);
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
	
	@RenderMapping(params = "render=investorDetails")
	protected ModelAndView renderInvestorDetails(ModelMap model, RenderRequest request, RenderResponse response) {
		Long tradeID = ParamUtil.getLong(request, "tradeID");
		String sellerRegNo = invoiceService.getSellerRegNumberByTradeID(tradeID);
		Company company = companyService.getCompaniesByRegNum(sellerRegNo);
		Long companyId  = liferayUtility.getWhitehallCompanyID(request);
	    Long investorID=investorService.getInvestorIDByCompanyId(companyId);
		SCFTrade scfTrade = scfTradeService.findTradeDeatailsForInvestor(tradeID,investorID);
		SCFTradeDTO scfTradeDTO = transformTOScfTradeDTO(scfTrade);
		model.put("invoiceList", scfTrade.getInvoices());
		model.put("scfTradeModel", scfTradeDTO);
		model.put("sellerName", company.getName());
		model.put("allotments", scfTrade.getAllotments());
		return new ModelAndView("investortardedetails", model);
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
			/*SCFTrade scfTrade = transformTOScfTrade(scfTradeDTO);
			scfTrade.setStatus(TradeStatus.NEW.getValue());
			scfTrade = scfTradeService.save(scfTrade);
			if (!StringUtils.isNullOrEmpty(scfTradeDTO.getInvoiceIds())) {
				List<String> invoicesIdList = Arrays.asList(scfTradeDTO.getInvoiceIds().split(","));
				invoiceService.updateInvoicesStatusWithTrade(invoicesIdList, InvoiceStatus.TRADE_GENERATED.getValue(), scfTrade.getId());
			}

			if (scfTrade.getWantToInsure()) {
				addInsuranceDocument(scfTradeDTO, request, themeDisplay, currentSideID, parentFolderId, serviceContextDlFolder, scfTrade);
			}*/
		}
		catch (Exception e) {
			e.printStackTrace();
			_log.error("Error Occured while saving Trade" + e.getMessage());
		}

	}
	
	@ActionMapping(params = "action=updateTrade")
	protected void updateTrade(@ModelAttribute("scfTradeModel") SCFTradeDTO scfTradeDTO, ModelMap model, ActionRequest request, ActionResponse response)
		throws Exception {

		try {
			ThemeDisplay themeDisplay = (ThemeDisplay) request.getAttribute(WebKeys.THEME_DISPLAY);
			long currentSideID = themeDisplay.getScopeGroupId();
			long parentFolderId = DLFolderConstants.DEFAULT_PARENT_FOLDER_ID;
			ServiceContext serviceContextDlFolder = ServiceContextFactory.getInstance(DLFolder.class.getName(), request);
			Folder folder=null;
			Folder scfFolder=null;
			FileEntry incfileEntry=null;
			FileEntry profileEntry=null;
			String mimeType=null;
			long repositoryId = themeDisplay.getScopeGroupId();
			try {
				folder=DLAppServiceUtil.getFolder(repositoryId, 0, "Trade Documents");
			} catch (Exception e) {
				
			}
			if(folder!=null && scfTradeDTO.getScfId()!=null){
				Long companyID = ParamUtil.getLong(request, "companyID");
				Company company = companyService.findById(companyID);
				if((scfTradeDTO.getInsuranceDocument()!=null && scfTradeDTO.getInsuranceDocument().getSize()>0) || (scfTradeDTO.getPromisoryDocument()!=null && scfTradeDTO.getPromisoryDocument().getSize()>0) ){
					 try {
						scfFolder=DLAppServiceUtil.getFolder(repositoryId, folder.getFolderId(), scfTradeDTO.getScfId());
					} catch (Exception e) {
						_log.error("Error Occured" + e.getMessage());
					}
					
					 if(scfFolder!=null){
						 //Delete the folder as updating the document.
						 try {
							 if(scfTradeDTO.getInsuranceDocument()!=null && scfTradeDTO.getInsuranceDocument().getSize()>0){
								 DLAppServiceUtil.deleteFolder(repositoryId, scfFolder.getFolderId(), "Insurance");
							 }
							 if(scfTradeDTO.getPromisoryDocument()!=null && scfTradeDTO.getPromisoryDocument().getSize()>0){
								 DLAppServiceUtil.deleteFolder(repositoryId, scfFolder.getFolderId(), "Promisory");
							 }
							
						} catch (Exception e) {
							_log.error("Error Occured" + e.getMessage());
						}
						 
						try {
							if(scfTradeDTO.getInsuranceDocument()!=null && scfTradeDTO.getInsuranceDocument().getSize()>0){
							   mimeType = MimeTypesUtil.getContentType(scfTradeDTO.getInsuranceDocument().getInputStream(), scfTradeDTO.getInsuranceDocument().getName());
							   Folder incFolder= DLAppServiceUtil.addFolder(repositoryId, scfFolder.getFolderId(), "Insurance", "InsuranceFolder", serviceContextDlFolder);
							   incfileEntry= DLAppServiceUtil.addFileEntry(themeDisplay.getScopeGroupId(), incFolder.getFolderId(), scfTradeDTO.getInsuranceDocument().getOriginalFilename(), mimeType, scfTradeDTO.getInsuranceDocument().getOriginalFilename(), "InsuranceDoc", "InsuranceDoc", scfTradeDTO.getInsuranceDocument().getInputStream(), scfTradeDTO.getInsuranceDocument().getSize(), serviceContextDlFolder);
							   Role powerUser = RoleLocalServiceUtil.getRole(themeDisplay.getCompanyId(), RoleConstants.POWER_USER);
							   String[] actions = new String[] { ActionKeys.VIEW }; 
							   ResourcePermissionLocalServiceUtil.setResourcePermissions(themeDisplay.getCompanyId(), DLFileEntry.class.getName(), ResourceConstants.SCOPE_COMPANY, String.valueOf(incfileEntry.getFileEntryId()), powerUser.getRoleId(), actions);
							}
							 if(scfTradeDTO.getPromisoryDocument()!=null && scfTradeDTO.getPromisoryDocument().getSize()>0){
								 mimeType = MimeTypesUtil.getContentType(scfTradeDTO.getPromisoryDocument().getInputStream(), scfTradeDTO.getPromisoryDocument().getName());
								 Folder proFolder= DLAppServiceUtil.addFolder(repositoryId, scfFolder.getFolderId(), "Promisory", "PromisoryFolder", serviceContextDlFolder);
								 profileEntry= DLAppServiceUtil.addFileEntry(themeDisplay.getScopeGroupId(), proFolder.getFolderId(), scfTradeDTO.getPromisoryDocument().getOriginalFilename(), mimeType, scfTradeDTO.getPromisoryDocument().getOriginalFilename(), "PromisoryDoc", "PromisoryDoc", scfTradeDTO.getPromisoryDocument().getInputStream(), scfTradeDTO.getPromisoryDocument().getSize(), serviceContextDlFolder);
							 }
						} catch (Exception e) {
							_log.error("Error Occured" + e.getMessage());
						}
					 }
					 //in case of very first time adding the document.
					 else{
						 try {
							 
							 scfFolder= DLAppServiceUtil.addFolder(repositoryId, folder.getFolderId(), scfTradeDTO.getScfId(), "SCFFolder", serviceContextDlFolder);
							 if(scfTradeDTO.getInsuranceDocument()!=null && scfTradeDTO.getInsuranceDocument().getSize()>0){
								 mimeType = MimeTypesUtil.getContentType(scfTradeDTO.getInsuranceDocument().getInputStream(), scfTradeDTO.getInsuranceDocument().getName());
								 Folder incFolder= DLAppServiceUtil.addFolder(repositoryId, scfFolder.getFolderId(), "Insurance", "InsuranceFolder", serviceContextDlFolder);
								 incfileEntry= DLAppServiceUtil.addFileEntry(themeDisplay.getScopeGroupId(), incFolder.getFolderId(), scfTradeDTO.getInsuranceDocument().getOriginalFilename(), mimeType, scfTradeDTO.getInsuranceDocument().getOriginalFilename(), "InsuranceDoc", "InsuranceDoc", scfTradeDTO.getInsuranceDocument().getInputStream(), scfTradeDTO.getInsuranceDocument().getSize(), serviceContextDlFolder);
								 Role powerUser = RoleLocalServiceUtil.getRole(themeDisplay.getCompanyId(), RoleConstants.POWER_USER);
								 String[] actions = new String[] { ActionKeys.VIEW }; 
								 ResourcePermissionLocalServiceUtil.setResourcePermissions(themeDisplay.getCompanyId(), DLFileEntry.class.getName(), ResourceConstants.SCOPE_COMPANY, String.valueOf(incfileEntry.getFileEntryId()), powerUser.getRoleId(), actions);
							 }
							 if(scfTradeDTO.getPromisoryDocument()!=null && scfTradeDTO.getPromisoryDocument().getSize()>0){
								 mimeType = MimeTypesUtil.getContentType(scfTradeDTO.getPromisoryDocument().getInputStream(), scfTradeDTO.getPromisoryDocument().getName());
								 Folder proFolder= DLAppServiceUtil.addFolder(repositoryId, scfFolder.getFolderId(), "Promisory", "PromisoryFolder", serviceContextDlFolder);
								 profileEntry= DLAppServiceUtil.addFileEntry(themeDisplay.getScopeGroupId(), proFolder.getFolderId(), scfTradeDTO.getPromisoryDocument().getOriginalFilename(), mimeType, scfTradeDTO.getPromisoryDocument().getOriginalFilename(), "PromisoryDoc", "PromisoryDoc", scfTradeDTO.getPromisoryDocument().getInputStream(), scfTradeDTO.getPromisoryDocument().getSize(), serviceContextDlFolder);
								 Role powerUser = RoleLocalServiceUtil.getRole(themeDisplay.getCompanyId(), RoleConstants.POWER_USER);
								 String[] actions = new String[] { ActionKeys.VIEW }; 
								 ResourcePermissionLocalServiceUtil.setResourcePermissions(themeDisplay.getCompanyId(), DLFileEntry.class.getName(), ResourceConstants.SCOPE_COMPANY, String.valueOf(profileEntry.getFileEntryId()), powerUser.getRoleId(), actions);
							 }
						} catch (Exception e) {
							_log.error("Error Occured" + e.getMessage());
						}
					 }
					SCFTrade scfTrade = scfTradeService.findById(scfTradeDTO.getId());
					if(scfTradeDTO.getInsuranceDocument()!=null && scfTradeDTO.getInsuranceDocument().getSize()>0){
						scfTrade.setInsuranceDocId(incfileEntry.getFileEntryId());
						scfTrade.setInsuranceDocName(scfTradeDTO.getInsuranceDocument().getOriginalFilename());
						scfTrade.setInsuranceDocUrl(getUrl(themeDisplay, incfileEntry));
						scfTrade.setInsuranceDocType(mimeType);
					}
					if(scfTradeDTO.getPromisoryDocument()!=null && scfTradeDTO.getPromisoryDocument().getSize()>0){
						scfTrade.setPromisoryDocId(profileEntry.getFileEntryId());
						scfTrade.setPromisoryDocName(scfTradeDTO.getPromisoryDocument().getOriginalFilename());
						scfTrade.setPromisoryDocUrl(getUrl(themeDisplay, profileEntry));
						scfTrade.setPromisoryDocType(mimeType);
					}
					scfTrade.setUpdatDate(new Date());
					scfTradeService.updateTrade(scfTrade);
				}				
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
		String status = null;
		SCFTrade scfTrade = null;
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
		scfTradeDTO.setScfId(scfTrade.getScfId());
		scfTradeDTO.setClosingDate(scfTrade.getClosingDate());
		scfTradeDTO.setCompany(scfTrade.getCompany());
		scfTradeDTO.setDuration(scfTrade.getDuration());
		
		String investerPaymentDate=scfTrade.getInvestorPaymentDate()+"";
		investerPaymentDate=investerPaymentDate.substring(0, investerPaymentDate.lastIndexOf("-")+3);
		investerPaymentDate=Constants.formatDateInDDMMYYYY(investerPaymentDate);
		scfTradeDTO.setInvestorPaymentDateString(investerPaymentDate);
		
		scfTradeDTO.setInvestorPaymentDate(scfTrade.getInvestorPaymentDate());
		scfTradeDTO.setOpeningDate(scfTrade.getOpeningDate());
		scfTradeDTO.setPromisoryNote(scfTrade.getPromisoryNote());
		scfTradeDTO.setScfTrade(scfTrade.getScfTrade());
		
		String strringDate=scfTrade.getSellerPaymentDate()+"";
		strringDate=strringDate.substring(0, strringDate.lastIndexOf("-")+3);
		strringDate=Constants.formatDateInDDMMYYYY(strringDate);
		scfTradeDTO.setSellerPaymentDateString(strringDate);
		scfTradeDTO.setSellerPaymentDate(scfTrade.getSellerPaymentDate());
		scfTradeDTO.setStatus(scfTrade.getStatus());
		scfTradeDTO.setTradeAmount(scfTrade.getTradeAmount());
		scfTradeDTO.setTradeNotes(scfTrade.getTradeNotes());
		scfTradeDTO.setTradeSettled(scfTrade.getTradeSettled());
		scfTradeDTO.setWantToInsure(scfTrade.getWantToInsure());
		scfTradeDTO.setInsuranceDocName(scfTrade.getInsuranceDocName());
		scfTradeDTO.setInsuranceDocURL(scfTrade.getInsuranceDocUrl());
		scfTradeDTO.setPromisoryDocName(scfTrade.getPromisoryDocName());
		scfTradeDTO.setPromisoryDocURL(scfTrade.getPromisoryDocUrl());
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

}
