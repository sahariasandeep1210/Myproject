package com.tf.controller.investment;


import java.beans.PropertyEditorSupport;
import java.io.IOException;
import java.math.BigDecimal;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Set;

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
import com.tf.model.GenericListModel;
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
import com.tf.util.model.ContactModel;
import com.tf.util.model.PaginationModel;

/**
 * This controller is responsible for request/response handling on SCF Trade
 * screens
 * 
 * @author Gautam Sharma
 */
@Controller
@RequestMapping(value = "VIEW")
public class InvestmentController {

	protected Log _log = LogFactoryUtil.getLog(InvestmentController.class.getName());
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
       
		List<SCFTrade> scftrades = null; String myTradeUrl = null;
		
		ArrayList<MyInvestmentModel> myInvestment = new ArrayList<MyInvestmentModel>();
		MyInvestmentModel	myInvestmentModel; 
		String viewName = "";
		ThemeDisplay themeDisplay = (ThemeDisplay) request.getAttribute(WebKeys.THEME_DISPLAY);
		Long noOfRecords = 0l;
		PaginationModel paginationModel = paginationUtil.preparePaginationModel(request);

		PermissionChecker permissionChecker = themeDisplay.getPermissionChecker();
		if (request.isUserInRole(Constants.PRIMARY_INVESTOR_ADMIN)) {// Only for Primary Investor -- 
					
			   BigDecimal totalTradeAmount = BigDecimal.ZERO;
			   BigDecimal totalSellerTransFee = BigDecimal.ZERO;
			   BigDecimal totalSellerFees = BigDecimal.ZERO;
			   BigDecimal totalInvestorTotalGross = BigDecimal.ZERO;
			   
			   BigDecimal totalGrossCharges = BigDecimal.ZERO;
			   BigDecimal whiteHallTotalChargesTemp = BigDecimal.ZERO;
			   
			   String investorTotalGrossProfit= ""; 
			   String investorTotalNetProfit = "";
			   String totalInvestorAllotment = "";
			   String  whiteHallTotalCharges = "";
			   
			   BigDecimal investorTotalGrossProfitTemp = BigDecimal.ZERO;// These variables are used when search is not null
			   BigDecimal investorTotalNetProfitTemp = BigDecimal.ZERO;
			   BigDecimal totalInvestorAllotmentTemp = BigDecimal.ZERO;
			   
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
				String sortCompany_order = ParamUtil.getString(request, "sortVal_order");// Sorting value ascending- Descending order 
				model.put("sortCompany_order", sortCompany_order);
				model.put("sort_Column", columnName);
				model.put("sort_order", order);
				myTradeUrl = liferayUtility.getPortletURL(request, "scf-trade-portlet", "render", "investorDetails", true);// To make hiperlink and redirect to MY Investment portlet.
				
				 System.out.println(" *****SortingValue**************" +sortCompany_order+" "+ columnName + " "+order );
			String search = ParamUtil.getString(request, "Search");
		    Long companyId  = liferayUtility.getWhitehallCompanyID(request);
		    Long investorID=investorService.getInvestorIDByCompanyId(companyId);
		    scftrades = scfTradeService.getScfTradeListForInvestor(search, value,fromDate,toDate,investorID, paginationModel.getStartIndex(), paginationModel.getPageSize(), false,columnName,order);
			List<SCFTrade> list= scfTradeService.getScfTradeListForInvestor(search, value,fromDate,toDate, investorID, paginationModel.getStartIndex(), paginationModel.getPageSize(), true,columnName,order);
			
		    System.out.println("*************************** TradeController_Search 2**** " +search);

			List listSum = scfTradeService.getSumOfSCFTradeProperties(search,null,false,investorID);
			   if (null != listSum || listSum.size() > 0) {// Getting the sum of values of specific columns
			    Object[] obj = (Object[]) listSum.get(0);
			    totalTradeAmount = obj[0]!=null?(BigDecimal) obj[0]:BigDecimal.ZERO;
			    totalSellerTransFee =  obj[1] !=null ? (BigDecimal) obj[1]:BigDecimal.ZERO;
			    
			    totalSellerFees = obj[2]!=null ?(BigDecimal) obj[2]:BigDecimal.ZERO;
			    
			    totalInvestorTotalGross = obj[3]!=null?(BigDecimal) obj[3]:BigDecimal.ZERO;
			    
			    totalGrossCharges = totalGrossCharges.add(totalSellerTransFee) .add(totalSellerFees).add(totalInvestorTotalGross);
			    
			  /*  totalInvestorAllotment = (BigDecimal) obj[4]; 
			    investorTotalGrossProfit  = (BigDecimal) obj[5];
			    investorTotalNetProfit  = (BigDecimal) obj[6];*/
			    
			  //  whiteHallTotalCharges   = (BigDecimal) obj[7];
			   }
			   if(list!=null & list.size()>0){
			    noOfRecords=(long) list.get(list.size()-1).getId();
			   }
			model.put("totalTradeAmount", totalTradeAmount);
			model.put("totalSellerTransFee", totalSellerTransFee);
			model.put("totalSellerFees", totalSellerFees);
			model.put("totalInvestorTotalGross", totalInvestorTotalGross);
			model.put("totalGrossCharges", totalGrossCharges);
			
			model.put("scftrades", scftrades);
			model.put("userType", Constants.PRIMARY_INVESTOR_ADMIN);
			viewName = "inverstortradelist";
		 
	 	  
		    List<Object[]> sumOfTradesProfit =    scfTradeService.getSumOfTradesAllotmentForParticularInvestor( investorID);
		    for (Object[] row : sumOfTradesProfit) {
		    	
		    	
		    	System.out.println("SumOFnetProfit"+ row[0]);	
		    	System.out.println("SumOFnetProfit"+ row[1]);
		    	totalInvestorAllotment = String.valueOf(row[0]);
		    	investorTotalNetProfit = String.valueOf(row[1]);
				investorTotalGrossProfit = String.valueOf(row[2]);
				whiteHallTotalCharges = String.valueOf(row[3]);
			   }
		    
		    int rowNo = 0;
		  
			for (SCFTrade scf : scftrades) {

				rowNo++;
				
				myInvestmentModel = new MyInvestmentModel();
				myInvestmentModel.setRowNo(rowNo);
				myInvestmentModel.setTradeNumber(scf.getScfId());
				myInvestmentModel.setStatus(scf.getStatus());
				myInvestmentModel.setTradeId(scf.getId().toString());
				myInvestmentModel.setTotalTradeAmount(scf.getTradeAmount().toString());
				
				myInvestmentModel.setDuration(scf.getDuration().toString());
				myInvestmentModel.setStartDate(scf.getSellerPaymentDate());
				myInvestmentModel.setEndDate(scf.getClosingDate());
				
				Long tradeID = scf.getId();
				System.out.println("*****TradeId***" + tradeID);

				
				SCFTrade scfTrade = scfTradeService.findTradeDeatailsForInvestor(tradeID, investorID);

				
				Set<Allotment> set = scfTrade.getAllotments();
				List<Allotment> listAllot = new ArrayList<Allotment>(set);
				Allotment obj = listAllot.get(0);
				

				myInvestmentModel.setMyAllotment(String.valueOf(obj
						.getAllotmentAmount()));
				myInvestmentModel.setGrossProfit(String.valueOf(obj
						.getInvestorGrossProfit()));
				myInvestmentModel.setNetProfit(String.valueOf(obj
						.getInvestorNetProfit()));
				myInvestmentModel.setWhiteHallCharges(String.valueOf(obj.getWhitehallProfitShare()));
				myInvestmentModel.setReceivableAmount(String.valueOf(obj.getAllotmentAmount().add(obj.getInvestorNetProfit())));
				myInvestmentModel.setBps(obj.getMarketDiscount().toString());
				if(obj.getVatInvestorFee()!=null){
				myInvestmentModel.setVatInvestorFee((obj.getVatInvestorFee()).toString());
				}
				
				myInvestment.add(myInvestmentModel);
				
			
				    totalInvestorAllotmentTemp =  totalInvestorAllotmentTemp.add(obj.getAllotmentAmount());
				    investorTotalGrossProfitTemp = investorTotalGrossProfitTemp.add(obj.getInvestorGrossProfit());
				    investorTotalNetProfitTemp = investorTotalNetProfitTemp.add(obj.getInvestorNetProfit());
				    whiteHallTotalChargesTemp = whiteHallTotalChargesTemp.add(obj.getWhitehallProfitShare());
				
			}
			if (search != null && search.trim().length()>0 ){

				//Collections.sort(myInvestment,new MyInvestmentModel.OrderByNetProfit());
				totalInvestorAllotment = totalInvestorAllotmentTemp.toString();
				investorTotalGrossProfit = investorTotalGrossProfitTemp.toString();
				investorTotalNetProfit =  investorTotalNetProfitTemp.toString();
				whiteHallTotalCharges = whiteHallTotalChargesTemp.toString();
			}
			model.put("totalInvestorAllotment", totalInvestorAllotment);
			model.put("investorTotalGrossProfit", investorTotalGrossProfit);
			model.put("investorTotalNetProfit", investorTotalNetProfit);
			model.put("whiteHallTotalCharges", whiteHallTotalCharges);
			model.put("receivableAmount", Float.parseFloat(totalInvestorAllotment)+Float.parseFloat(investorTotalNetProfit) );
			model.put("search", search);
			model.put("myTradeUrl", myTradeUrl);
			model.put("myInvestment", myInvestment);
			paginationUtil.setPaginationInfo(noOfRecords, paginationModel);
			System.out.println("paginationsss:" + paginationModel);
			model.put("paginationModel", paginationModel);
			return new ModelAndView(viewName, model);
		}else if (liferayUtility.getPermissionChecker(request).isOmniadmin() || request.isUserInRole(Constants.WHITEHALL_ADMIN)) {
	      	viewName = "";
				model.put("userType", Constants.ADMIN);
			
				
				String columnName = ParamUtil.getString(request, "sort_Column");
				String order = ParamUtil.getString(request, "sort_order");
				String sortCompany_order = ParamUtil.getString(request, "sortVal_order");// Sorting value ascending- Descending order 
				model.put("sortCompany_order", sortCompany_order);
				model.put("sort_Column", columnName);
				model.put("sort_order", order);
				System.out.println("Order Sorting "+sortCompany_order + " "+ columnName +" "+ order );
				
				GenericListModel genericListModel = invoiceService.getSCFInvestorShortFall();
				
				model.put("myTradeUrl", myTradeUrl);
				model.put("myInvestment", myInvestment);
				paginationUtil.setPaginationInfo(noOfRecords, paginationModel);
				System.out.println("paginationsss:" + paginationModel);
				model.put("paginationModel", paginationModel);
				model.put("investorShorFallList", genericListModel.getList());
				
				return new ModelAndView("investorShortFall", model);
		
	} else {

			return new ModelAndView(null, model);
		}
		
}

	
	
	private void getMoreData(ModelMap model , Long id,RenderRequest request){
		
		Long tradeID = id; //ParamUtil.getLong(request, "tradeID");
		System.out.println("*****LinkClick***"+ tradeID);
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
		
		System.out.println("*********Get Allotments "+ scfTrade.getAllotments());
		
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