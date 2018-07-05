
package com.tf.controller.invoice;

import java.beans.PropertyEditorSupport;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.math.BigDecimal;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.portlet.ActionRequest;
import javax.portlet.ActionResponse;
import javax.portlet.PortletConfig;
import javax.portlet.RenderRequest;
import javax.portlet.RenderResponse;
import javax.portlet.ResourceRequest;
import javax.portlet.ResourceResponse;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;		
import java.net.MalformedURLException;		
import java.net.URL;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.DataFormatter;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
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

import com.liferay.portal.kernel.language.LanguageUtil;
import com.liferay.portal.kernel.log.Log;
import com.liferay.portal.kernel.log.LogFactoryUtil;
import com.liferay.portal.kernel.mail.MailMessage;
import com.liferay.portal.kernel.repository.model.FileEntry;
import com.liferay.portal.kernel.repository.model.Folder;
import com.liferay.portal.kernel.servlet.SessionErrors;
import com.liferay.portal.kernel.servlet.SessionMessages;
import com.liferay.portal.kernel.util.JavaConstants;
import com.liferay.portal.kernel.util.MimeTypesUtil;
import com.liferay.portal.kernel.util.ParamUtil;
import com.liferay.portal.kernel.util.StringPool;
import com.liferay.portal.kernel.util.WebKeys;
import com.liferay.portal.service.ServiceContext;
import com.liferay.portal.service.ServiceContextFactory;
import com.liferay.portal.theme.ThemeDisplay;
import com.liferay.portlet.documentlibrary.model.DLFileEntry;
import com.liferay.portlet.documentlibrary.model.DLFolder;
import com.liferay.portlet.documentlibrary.model.DLFolderConstants;
import com.liferay.portlet.documentlibrary.service.DLAppServiceUtil;
import com.liferay.util.mail.MailEngine;
import com.liferay.util.mail.MailEngineException;
import com.mysql.jdbc.StringUtils;
import com.tf.dto.InvoiceDTO;
import com.tf.model.Company;
import com.tf.model.GeneralSetting;
import com.tf.model.GenericListModel;
import com.tf.model.Invoice;
import com.tf.model.InvoiceDocument;
import com.tf.model.InvoiceNotTraded;
import com.tf.persistance.util.CompanyTypes;
import com.tf.persistance.util.Constants;
import com.tf.persistance.util.InSuffcientFund;
import com.tf.persistance.util.InvalidDuration;
import com.tf.persistance.util.InvoiceStatus;
import com.tf.persistance.util.ValidationUtil;
import com.tf.service.CompanyService;
import com.tf.service.FcmTokenService;
import com.tf.service.GeneralSettingService;
import com.tf.service.InvoiceDocumentService;
import com.tf.service.InvoiceService;
import com.tf.service.UserService;
import com.tf.util.LiferayUtility;
import com.tf.util.PaginationUtil;
import com.tf.util.model.PaginationModel;


/**
 * This controller is responsible for request/response handling on Invoice
 * screens
 * 
 * @author Gautam Sharma
 */
@Controller
@RequestMapping(value = "VIEW")
public class InvoiceController {

	private final static String ACTIVETAB = "activetab";
	
	@Autowired
	protected ValidationUtil validationUtil;

	@Autowired
	protected UserService userService;
	
	@Autowired		
	protected FcmTokenService fcmTokenService;

	@Autowired
	private InSuffcientFund fund;

	@Autowired
	protected InvoiceService invoiceService;

	@Autowired
	protected InvoiceDocumentService invoiceDocumentService;

	@Autowired
	protected CompanyService companyService;

	@Autowired
	protected LiferayUtility liferayUtility;

	@Autowired
	protected PaginationUtil paginationUtil;
	

	@Autowired
	protected GeneralSettingService generalSettingService;
	


	@InitBinder
	public void binder(WebDataBinder binder) {

		binder.registerCustomEditor(Date.class, new PropertyEditorSupport() {

			public void setAsText(String value) {
				try {
					setValue(new SimpleDateFormat(Constants.DATE_FORMAT).parse(value));
				}
				catch (Exception e) {
					setValue(value);
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

	}

	@RenderMapping(params = "render=invoiceDocuments")
	protected ModelAndView renderInvoiceDocumentList(
		@ModelAttribute("invoiceModel") InvoiceDTO invoice, ModelMap model,
		RenderRequest request, RenderResponse response)
		throws Exception {
		try {
			List<Company> companyList = new ArrayList<Company>();

			ThemeDisplay themeDisplay = liferayUtility.getThemeDisplay(request);
			List<InvoiceDocument> invoiceDocumentList =	new ArrayList<InvoiceDocument>();
			if (liferayUtility.getPermissionChecker(request).isOmniadmin()) {
				invoiceDocumentList =invoiceDocumentService.getInvoiceDocuments();
				companyList = companyService.getCompanies(CompanyTypes.SCF_COMPANY.getValue());
				model.put("userType", Constants.ADMIN);
			}
			else if (request.isUserInRole(Constants.SCF_ADMIN)) {
				invoiceDocumentList = invoiceDocumentService.getInvoiceDocuments(themeDisplay.getUser().getUserId());
				long companyId = userService.getCompanyIDbyUserID(themeDisplay.getUserId());
				companyList.add(companyService.findById(companyId));
				model.put("userType", Constants.SCF_ADMIN);
			}
			model.put("companyList", companyList);
			model.put("invoiceList", invoiceDocumentList);
			model.put(ACTIVETAB, "invoiceDocuments");
		}
		catch (Exception e) {
			SessionErrors.add(request, "default-error-message");
			_log.error("InvoiceController.renderInvoiceDocumentList() - error occured while rendering invoice documents " +
				e.getMessage());
		}
		return new ModelAndView("invoicedoclist", model);
	}
	
	@RenderMapping(params = "render=invoiceNotTraded")
	protected ModelAndView renderInvoiceNotTraded(
		RenderRequest request, RenderResponse response, ModelMap model)
		throws Exception {
  
   try {
		PaginationModel paginationModel = paginationUtil.preparePaginationModel(request);
		ThemeDisplay themeDisplay =
			(ThemeDisplay) request.getAttribute(WebKeys.THEME_DISPLAY);
		DateFormat formatter = new SimpleDateFormat(Constants.DATE_FORMAT);
		
		//fields are being used for server side sorting
		String columnName = ParamUtil.getString(request, "sort_Column","scf.update_date");
		String order = ParamUtil.getString(request, "sort_order","DESC");
		String sortCompany_order = ParamUtil.getString(request, "sortVal_order");
		model.put("sortCompany_order", sortCompany_order);
		model.put("sort_Column", columnName);
		model.put("sort_order", order);
		
		Date fromDate = null;
		Date toDate = null;
		String tradeURL=null;
		String fromDateString = null;
		String toDateString = null;
		String search = ParamUtil.getString(request, "Search");
		String value = ParamUtil.getString(request, "dateList");
		String from = ParamUtil.getString(request, "fromDate");
		String to = ParamUtil.getString(request, "toDate");
		Long companyID = null;
		String registrationNo=null;
		
		GenericListModel genericListModel=null;
		List<InvoiceNotTraded> invoiceNotTraded=null;
		if (!StringUtils.isNullOrEmpty(from)) {
			fromDate = formatter.parse(from);
		}
		if (!StringUtils.isNullOrEmpty(to)) {
			toDate = formatter.parse(to);
		}
		if (!StringUtils.isNullOrEmpty(from)) {
			fromDateString = Constants.formatDate(from);
		}
		if (!StringUtils.isNullOrEmpty(to)) {
			toDateString = Constants.formatDate(to);
		}
		
		tradeURL=liferayUtility.getPortletURL(request, "scf-trade-portlet", "render", "createTrade", true);
		if (liferayUtility.getPermissionChecker(request).isOmniadmin() ||
			request.isUserInRole(Constants.WHITEHALL_ADMIN)) {
			model.put("userType", Constants.ADMIN);
		}
		else if (request.isUserInRole(Constants.SCF_ADMIN)) {
		        companyID = liferayUtility.getWhitehallCompanyID(request);
			model.put("userType", Constants.SCF_ADMIN);
		}
		else if (request.isUserInRole(Constants.SELLER_ADMIN)) {
			long companyId = userService.getCompanyIDbyUserID(themeDisplay.getUserId());
			registrationNo=companyService.findById(companyId).getRegNumber();
			tradeURL=liferayUtility.getPortletURL(request, "scf-trade-portlet", "render", "singleTrade", true);
			model.put("userType", Constants.SELLER_ADMIN);
		}
		if(!StringUtils.isNullOrEmpty(search) || !StringUtils.isNullOrEmpty(value)){
			
		   genericListModel =invoiceService.getInvoiceNotTradedOnSearch(search, fromDateString, toDateString, value,
					paginationModel.getStartIndex(), paginationModel.getPageSize(),companyID,registrationNo,order,columnName);
		} else {	
		
			genericListModel =  invoiceService.getInvoicesNotTraded(companyID,paginationModel.getStartIndex(), paginationModel.getPageSize(),registrationNo,order,columnName);
			 	
		   
		}
	
		model.put("tradeURL",tradeURL);
		model.put("value", value);
		model.put("search", search);
		model.put("from", from);
		model.put("to", to);
		request.getPortletSession().removeAttribute("invoiceDTO");
		request.getPortletSession().removeAttribute("invoiceList");
		request.getPortletSession().removeAttribute("validInvoiceList");
		request.getPortletSession().removeAttribute("invalidnvoiceList");
		paginationUtil.setPaginationInfo(genericListModel.getCount(), paginationModel);
		model.put("paginationModel", paginationModel);
		
		model.put("invoicesNotTradedList", genericListModel.getList());
		model.put("totalTradeAmounts",genericListModel.getTotalAmount());
		model.put("defaultRender", Boolean.TRUE);
		model.put(ACTIVETAB, "invoiceNotTraded");
	
	}
	catch (Exception e) {
		SessionErrors.add(request, "default-error-message");
	
		_log.error("InvoiceController.renderInvoiceList() - error occured while rendering invoices " +
			e.getMessage() );
	}
	return new ModelAndView("invoiceNotTraded", model);

	}
	
	 public static String dateFormater(String dateFromJSON, String expectedFormat, String oldFormat) {
		    SimpleDateFormat dateFormat = new SimpleDateFormat(oldFormat);
		    Date date = null;
		    String convertedDate = null;
		    try {
		        date = dateFormat.parse(dateFromJSON);
		        SimpleDateFormat simpleDateFormat = new SimpleDateFormat(expectedFormat);
		        convertedDate = simpleDateFormat.format(date);
		    } catch (Exception e) {
		        e.printStackTrace();
		    }

		    return convertedDate;
		}


	@RenderMapping(params = "render=createInvoice")
	protected ModelAndView renderCreateInvoice(
		@ModelAttribute("invoiceModel") InvoiceDTO invoice, ModelMap model,
		RenderRequest request, RenderResponse response)
		throws Exception {
		long companyId = 0 ;
		List<Company> companyList = new ArrayList<Company>();
		List<Company> sellerRegList = new ArrayList<Company>();
		System.out.println(" CreateInvoice6 " + companyList + " "+sellerRegList );
		ThemeDisplay themeDisplay =
						(ThemeDisplay) request.getAttribute(WebKeys.THEME_DISPLAY);
        if(liferayUtility.getPermissionChecker(request).isOmniadmin() ||
				request.isUserInRole(Constants.WHITEHALL_ADMIN)){
    		companyList = companyService.getCompanies(CompanyTypes.SCF_COMPANY.getValue());
    		
    		System.out.println(" CreateInvoice7 " + companyList + " "+sellerRegList );
    		
        }else if(request.isUserInRole(Constants.SCF_ADMIN)){
        	companyId =userService.getCompanyIDbyUserID(themeDisplay.getUserId());
        	companyList=companyService.getCompaniesById(companyId);
        	invoice.setScfCompany(companyId);
        	System.out.println(" CreateInvoice8 " + companyList + " "+companyId );
        }
        //getting the all seller 
        if(companyId == 0){
        	///sellerRegList=companyService.getSellerCompanies(CompanyTypes.SELLER.getValue());
        	sellerRegList=companyService.getSellerCompaniesUsingJoinForAdmin();
        }else{
        	sellerRegList=companyService.getSellerCompaniesUsingJoin(CompanyTypes.SELLER.getValue(),companyId);
        }
		model.put("companyList", companyList);
		model.put("sellerRegList", sellerRegList);
		return new ModelAndView("createinvoice", model);
	}

	@ActionMapping(params = "update=updateInvoice")
	protected void updateInvoice(
		@ModelAttribute("invoiceModel") InvoiceDTO invoice, ModelMap model,
		ActionRequest request, ActionResponse response) {

		Long invoiceId = ParamUtil.getLong(request, "invoiceId", 0);
		invoice.setId(invoiceId);
		long scfCompanyId = ParamUtil.getLong(request, "scfCompany");
		System.out.println(" CreateInvoice1 " + invoiceId + " "+scfCompanyId );

		try {
			Invoice invoice2 =
				invoiceService.getInvoicesByInvoiceNumAndCompanyId(
					invoice.getInvoiceNumber(), scfCompanyId);

			PortletConfig portletConfig =
				(PortletConfig) request.getAttribute(JavaConstants.JAVAX_PORTLET_CONFIG);

			Company company = companyService.findById(scfCompanyId);
			GeneralSetting generalSetting=generalSettingService.getGeneralSetting();
			System.out.println(" CreateInvoice2 " + company + " " );
			
			if (invoice2 != null && invoiceId != invoice2.getId()) {
				
				System.out.println(" CreateInvoice3 " + invoice2.getId() + " " );
				
				SessionErrors.add(request, "invoice.duplicate.error");
				StringBuilder sb = new StringBuilder();
				model.put(
					"errorMessage",
					sb.append(LanguageUtil.get(portletConfig, request.getLocale(), "invoice.duplicate.number.company")).append(
						invoice.getInvoiceNumber()).append(StringPool.SPACE).append(
						LanguageUtil.get(portletConfig, request.getLocale(), "invoice.duplicate.number")).append(StringPool.SPACE).append(
						company.getName()).append(StringPool.SPACE).append(
						LanguageUtil.get(portletConfig, request.getLocale(), "invoice.duplicate.message")));

				model.put("invoice", invoice);
				model.put("company", company);
				response.setRenderParameter("render", "createInvoice");

			} else if((invoice.getPaymentDate().getTime()-new Date().getTime())/ (1000 * 60 * 60 * 24) < 0){
				SessionErrors.add(request, "invoice.minPaymentDuration.invalid");
				model.put("invoiceModel", invoice);
				System.out.println(" CreateInvoice4 " + invoice + " " );
				response.setRenderParameter("render", "createInvoice");
				
			} else if((generalSetting!=null && generalSetting.getMinPaymentDateDuartion() !=null) && (((invoice.getPaymentDate().getTime()-new Date().getTime())/ (1000 * 60 * 60 * 24)) < generalSetting.getMinPaymentDateDuartion())){
				SessionErrors.add(request, "invoice.minPaymentDuration.error");
				model.put("errorMessage",LanguageUtil.get(portletConfig, request.getLocale(), "invoice.payment.duration.error"));
				model.put("invoiceModel", invoice);
				model.put("company", company);
				model.put("minPaymentDurationDate", generalSetting.getMinPaymentDateDuartion());
				System.out.println(" CreateInvoice5 " + generalSetting.getMinPaymentDateDuartion() + " " );
				response.setRenderParameter("render", "createInvoice");
			}
			else {
				if (invoiceId > 0) {
					// Update record
					
					Invoice inv = invoiceService.getInvoicesById(invoiceId);
					inv.setInvoiceNumber(invoice.getInvoiceNumber());
					inv.setInvoiceDate(invoice.getInvoiceDate());
					inv.setSellerCompanyRegistrationNumber(invoice.getSellerRegNo());
					inv.setInvoiceAmount(invoice.getInvoiceAmount());
					inv.setInvoiceDesc(invoice.getInvoiceDesc());
					inv.setDuration(invoice.getDuration());
					inv.setPayment_date(invoice.getPaymentDate());
					inv.setCurrency(invoice.getCurrency());
					inv.setInvoiceDesc(invoice.getInvoiceDesc());
					inv.setUpdateDate(new Date());
					Company scfCompany =
						companyService.findById(invoice.getScfCompany(	));
					inv.setScfCompany(scfCompany);
					List<Invoice> invoices = new ArrayList<Invoice>();
					invoices.add(inv);
					invoiceService.addInvoices(invoices);
					System.out.println(" CreateInvoice10 " + company + " " );
				}
				else {
					Invoice invoiceModel = transfromInvoiceDtoToInvoiceModel(invoice);
					List<Invoice> invoices = new ArrayList<Invoice>();
					invoices.add(invoiceModel);
					invoiceService.addInvoices(invoices);
					System.out.println(" CreateInvoice11 " + company + " " );
					//sendEmail();
					// Email Notification
					try {
						// invoices has been added, now we need to trigger email
						// notification
						sendNotificationOnApp(invoice.getSellerRegNo());
						String articleName = "create-invoice-by-scf-company";
						String content = liferayUtility.getContentByURLTitle(request, articleName);
						String articleNameTable = "create-invoice-by-scf-company-table";
						String contentTable = liferayUtility.getContentByURLTitle(request, articleNameTable);
						// The reason behind keeping this code outside if/else
						// is : we need to send
						// notification to user irrespective of invoice created
						// by Whitehall admin or SCF company admin
						Company cmp = companyService.getCompaniesByRegNum(invoiceModel.getSellerCompanyRegistrationNumber());
						System.out.println(" CreateInvoice12 " + company + " " );
						// Sending mail to Seller
						sendInvoiceCreateNotification(request, portletConfig, invoiceModel, content, contentTable, cmp, Boolean.FALSE);
						
						if (liferayUtility.getPermissionChecker(request).isOmniadmin()) {
							// Sending mail to SCF company
							cmp = invoiceModel.getScfCompany();
							sendInvoiceCreateNotification(request, portletConfig, invoiceModel, content, contentTable, cmp, Boolean.FALSE);
							System.out.println(" CreateInvoice13 " + company + " " );
						}
						else {
							sendInvoiceCreateNotification(request, portletConfig, invoiceModel, content, contentTable, cmp, Boolean.TRUE);
							
							System.out.println(" CreateInvoice14 " + company + " " );
						}
					}
					catch (Exception e) {
						_log.error(e.getMessage());
					}
				

			}
			}
		}
		catch (Exception e) {

			_log.error(e.getMessage());

		}

	}
	
	private void sendNotificationOnApp(String sellerRegNo ) throws IOException{
		 
		String userId =  fcmTokenService.getUserId(sellerRegNo);
		System.out.println("*******UserId **************" + userId);
		 String token =   fcmTokenService.getFcmToken(userId);
		   System.out.println("*******token**************"+ token);
		   
		   String url = "https://fcm.googleapis.com/fcm/send";
			URL obj = new URL(url);
			HttpURLConnection con = (HttpURLConnection) obj.openConnection();

			//add reuqest header
			con.setRequestMethod("POST");
			con.addRequestProperty("Content-Type", "application/json");
			con.setRequestProperty("Authorization", "key=AIzaSyCRoBKtxSEkZ9UxxqPRCPgkmfau39z8q7A");
			
			String urlParameters =	new String("{ \"notification\":{ \"title\":\"WhiteHall Finance\", \"body\":\"A new invoice is added by scf company \", \"sound\":\"default\", \"click_action\":\"FCM_PLUGIN_ACTIVITY\" },  \"data\":{ \"action\":\"ping\", \"message\": \"\" }, \"to\":\" "+token+"\", \"priority\":\"high\" }");
			
			// Send post request
			con.setDoOutput(true);
			DataOutputStream wr = new DataOutputStream(con.getOutputStream());
			wr.writeBytes(urlParameters);
			wr.flush();
			wr.close();

			int responseCode = con.getResponseCode();
			System.out.println("\nSending 'POST' request to URL : " + url);
			System.out.println("Post parameters : " + urlParameters);
			System.out.println("Response Code : " + responseCode);

			BufferedReader in = new BufferedReader(
			        new InputStreamReader(con.getInputStream()));
			String inputLine;
			StringBuffer response = new StringBuffer();

			while ((inputLine = in.readLine()) != null) {
				response.append(inputLine);
			}
			in.close();
			
			//print result
			System.out.println(response.toString());

		 
	 }
	 
	
    private void sendEmail() throws MailEngineException, AddressException{
    	 MailMessage mailMessage = new MailMessage();
			mailMessage.setHTMLFormat(true);
			mailMessage.setBody("Hello how are you");
			System.out.println(" CreateInvoice12 "  + " " );
			try {
				mailMessage.setFrom(new InternetAddress("nuevothoughts.abhishek@gmail.com","Abhishek"));
				
				mailMessage.setSubject("set mail subject here");
				mailMessage.setTo(new InternetAddress("nuevothoughts.abhishek@gmail.com"));
				MailEngine.send(mailMessage);
			} catch (UnsupportedEncodingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
    	
    }
	private void sendInvoiceCreateNotification(
		ActionRequest request, PortletConfig portletConfig,
		Invoice invoiceModel, String content, String contentTable, Company cmp, boolean mailToAdmin) {
		System.out.println(" CreateInvoice15 " + cmp + " " );
		if (mailToAdmin) {
			// needs to be replaced omni admin name
			content = content.replaceAll("\\[PH-NAME\\]", liferayUtility.getThemeDisplay(request).getUser().getFullName());
		}
		else {
			content = content.replaceAll("\\[PH-NAME\\]", cmp.getName());
		}
		content = content.replaceAll("\\[PH-REGARDS\\]", "White Hall Finance");
		
		Integer endIndex = contentTable.indexOf("<tbody>");
		String tempstart = contentTable.substring(0, endIndex);
	
		String tempstr = tempstart + "<tbody><tr><td>" + invoiceModel.getInvoiceNumber() + "</td><td>" + invoiceModel.getInvoiceAmount() + "</td><td>" +
			invoiceModel.getInvoiceDate() + "</td></tr></tbody></table>";
		content = content.replaceAll("\\[PH-CONTENT\\]", tempstr);

		String from = LanguageUtil.get(portletConfig, request.getLocale(), "invoice.sender.email");
		String to = userService.findUserOjectByCompanyId(cmp.getId());

		 System.out.print("Send_Notification " + " to "+ to + " from "+ from );
		if (!StringUtils.isNullOrEmpty(content) && !StringUtils.isNullOrEmpty(from) && !StringUtils.isNullOrEmpty(to)) {
			liferayUtility.sendEmail(request, from, to, "Your invoice has been created.", content);
		}
	}

	@ActionMapping(params = "action=addInvoice")
	protected void addInvoice(
		@ModelAttribute("invoiceModel") InvoiceDTO invoice, ModelMap model,
		ActionRequest request, ActionResponse response) {

		try {
			Invoice invoiceModel = transfromInvoiceDtoToInvoiceModel(invoice);
			List<Invoice> invoices = new ArrayList<Invoice>();
			invoices.add(invoiceModel);
			invoiceService.addInvoices(invoices);
		}
		catch (Exception e) {
			e.printStackTrace();
		}
	}

	private Invoice transfromInvoiceDtoToInvoiceModel(InvoiceDTO invoice) {

		Invoice invoiceModel = new Invoice();
		Date date=new Date();
		invoiceModel.setInvoiceNumber(invoice.getInvoiceNumber());
		invoiceModel.setInvoiceDate(invoice.getInvoiceDate());
		invoiceModel.setSellerCompanyRegistrationNumber(invoice.getSellerRegNo());
		invoiceModel.setSellerCompanyVatNumber(invoice.getSellerVatNumber());
		invoiceModel.setInvoiceAmount(invoice.getInvoiceAmount());
		invoiceModel.setInvoiceDesc(invoice.getInvoiceDesc());
		invoiceModel.setPayment_date(invoice.getPaymentDate());
		invoiceModel.setCurrency(invoice.getCurrency());
		invoiceModel.setStatus(InvoiceStatus.NEW.getValue());
		invoiceModel.setCreateDate(date);
		invoiceModel.setUpdateDate(date);
		Company scfCompany = companyService.findById(invoice.getScfCompany());
		invoiceModel.setScfCompany(scfCompany);
		return invoiceModel;
	}

	@RenderMapping(params = "render=updateInvoices")
	protected ModelAndView renderupdateInvoices(
		@ModelAttribute("invoiceModel") InvoiceDTO invoiceModel,
		ModelMap model, RenderRequest request, RenderResponse response)
		throws Exception {
	    	List<Company> sellerRegList = new ArrayList<Company>();
		List<Company> companyList = new ArrayList<Company>();
		
		
		try {
		    
		    long invoiceId = ParamUtil.getLong(request, "invoiceID");
		    _log.info("InvoiceId is ------"+invoiceId);
		    if (invoiceId > 0) {
			Invoice invoice = invoiceService
				.getInvoicesById(invoiceId);
			Company scfCompanies = invoice.getScfCompany();
			invoiceModel.setId(invoice.getId());
			invoiceModel.setScfCompany(scfCompanies.getId());
			invoiceModel.setInvoiceNumber(invoice
				.getInvoiceNumber());
			invoiceModel.setInvoiceDate((invoice.getInvoiceDate()));
			invoiceModel.setSellerRegNo(invoice
				.getSellerCompanyRegistrationNumber());
			invoiceModel.setSellerVatNumber(invoice
				.getSellerCompanyVatNumber());
			invoiceModel.setCurrency(invoice.getCurrency());
			invoiceModel.setInvoiceDesc(invoice.getInvoiceDesc());
			invoiceModel.setDuration(invoice.getDuration());
			invoiceModel.setInvoiceAmount(invoice
				.getInvoiceAmount());
			invoiceModel.setPaymentDate(invoice.getPayment_date());
			invoiceModel.setVatAmount(invoice.getVatAmount());
			invoiceModel.setStatus(invoice.getStatus());
			model.put("scfCompanies", scfCompanies);
			model.put("invoices", invoice);
			companyList.add(scfCompanies);
			if (!InvoiceStatus.NEW.getValue().equalsIgnoreCase(
				invoice.getStatus())) {
			    sellerRegList
				    .add(companyService.getCompaniesByRegNum(invoice
					    .getSellerCompanyRegistrationNumber()));
			    //making it read only when status other than New
			    model.put("readOnly", Boolean.TRUE);
			} else {
			    //getting the all seller 
			    //sellerRegList=companyService.getSellerCompanies(CompanyTypes.SELLER.getValue());
			    sellerRegList = companyService
				    .getSellerCompaniesUsingJoinForAdmin();
			}

			if ((liferayUtility.getPermissionChecker(request)
				.isOmniadmin() || request
				.isUserInRole(Constants.WHITEHALL_ADMIN)
				&& !InvoiceStatus.NEW.getValue()
					.equalsIgnoreCase(invoice.getStatus()))) {
			    companyList = companyService
				    .getCompanies(CompanyTypes.SCF_COMPANY
					    .getValue());

			          }

		    }
		} catch (Exception e) {
		    _log.error(e.getMessage());
		}
		if(request.isUserInRole(Constants.SELLER_ADMIN)){
			model.put("userType",Constants.SELLER_ADMIN);
			model.put("readOnly", Boolean.TRUE);
		}
		
	        model.put("sellerRegList", sellerRegList);
		model.put("companyList", companyList);
		model.put("invoiceModel", invoiceModel);
		return new ModelAndView("createinvoice", model);

	}
	
	
	@ActionMapping(params = "delete=deleteInvoice")
	protected void deleteInvoice(
		ActionRequest request, ActionResponse response, ModelMap model)
		throws Exception {
		Long invoiceId=ParamUtil.getLong(request, "invoiceId");
		Invoice invoice=invoiceService.getInvoicesById(invoiceId);
		invoiceService.deleteInvoice(invoice);
		PortletConfig portletConfig =
						(PortletConfig) request.getAttribute(JavaConstants.JAVAX_PORTLET_CONFIG);
					SessionMessages.add(request, "invoice.success.delete");
					model.put(
						"successMessage",
						LanguageUtil.get(
							portletConfig, request.getLocale(), "invoice.success.delete"));

	}
	@RenderMapping
	protected ModelAndView renderInvoiceList(
		RenderRequest request, RenderResponse response, ModelMap model)
		throws Exception {

		try {
			PaginationModel paginationModel = paginationUtil.preparePaginationModel(request);
			ThemeDisplay themeDisplay =
				(ThemeDisplay) request.getAttribute(WebKeys.THEME_DISPLAY);
			DateFormat formatter = new SimpleDateFormat(Constants.DATE_FORMAT);
			BigDecimal totalInvoiceAmount = BigDecimal.ZERO;
			
			//fiels are being used for server side sorting
			String columnName = ParamUtil.getString(request, "sort_Column","scf.update_date");
			String order = ParamUtil.getString(request, "sort_order","DESC");
			String sortCompany_order = ParamUtil.getString(request, "sortVal_order");
			model.put("sortCompany_order", sortCompany_order);
			model.put("sort_Column", columnName);
			model.put("sort_order", order);
			
			Date fromDate = null;
			Date toDate = null;
			String tradeURL=null;
			String fromDateString = null;
			String toDateString = null;
			String search = ParamUtil.getString(request, "Search");
			String value = ParamUtil.getString(request, "dateList");
			String from = ParamUtil.getString(request, "fromDate");
			String to = ParamUtil.getString(request, "toDate");
			Long companyID= null;
			String registrationNo=null;
			
			GenericListModel genericListModel=null;
			if (!StringUtils.isNullOrEmpty(from)) {
				fromDate = formatter.parse(from);
			}
			if (!StringUtils.isNullOrEmpty(to)) {
				toDate = formatter.parse(to);
			}
			if (!StringUtils.isNullOrEmpty(from)) {
				fromDateString = Constants.formatDate(from);
			}
			if (!StringUtils.isNullOrEmpty(to)) {
				toDateString = Constants.formatDate(to);
			}
			
			tradeURL=liferayUtility.getPortletURL(request, "scf-trade-portlet", "render", "createTrade", true);
			if (liferayUtility.getPermissionChecker(request).isOmniadmin() ||
				request.isUserInRole(Constants.WHITEHALL_ADMIN)) {
				model.put("userType", Constants.ADMIN);
			}
			else if (request.isUserInRole(Constants.SCF_ADMIN)) {
			        companyID = liferayUtility.getWhitehallCompanyID(request);
				model.put("userType", Constants.SCF_ADMIN);
			}
			else if (request.isUserInRole(Constants.SELLER_ADMIN)) {
				long companyId = userService.getCompanyIDbyUserID(themeDisplay.getUserId());
				registrationNo=companyService.findById(companyId).getRegNumber();
				tradeURL=liferayUtility.getPortletURL(request, "scf-trade-portlet", "render", "singleTrade", true);
				model.put("userType", Constants.SELLER_ADMIN);
			}
			if(!StringUtils.isNullOrEmpty(search) || !StringUtils.isNullOrEmpty(value)){
			   genericListModel =invoiceService.getInvoicesByFilter(search, fromDateString, toDateString, value,
						paginationModel.getStartIndex(), paginationModel.getPageSize(),companyID,registrationNo,order,columnName);
			} else {				
			   genericListModel = invoiceService.getInvoices(companyID,paginationModel.getStartIndex(), paginationModel.getPageSize(),registrationNo,order,columnName);
			}
			
			if(genericListModel.getList()!=null && genericListModel.getList().size()>0){
				List<Invoice> invoiceList = (List<Invoice>) genericListModel.getList();
				for (Invoice invObj : invoiceList) {
					totalInvoiceAmount=totalInvoiceAmount.add(invObj.getInvoiceAmount());
				}
			}
			
			
			model.put("tradeURL",tradeURL);
			model.put("value", value);
			model.put("search", search);
			model.put("from", from);
			model.put("to", to);
			request.getPortletSession().removeAttribute("invoiceDTO");
			request.getPortletSession().removeAttribute("invoiceList");
			request.getPortletSession().removeAttribute("validInvoiceList");
			request.getPortletSession().removeAttribute("invalidnvoiceList");
			paginationUtil.setPaginationInfo(genericListModel.getCount(), paginationModel);
			model.put("paginationModel", paginationModel);
			model.put("invoicesList", genericListModel.getList());
			model.put("totalInvoiceAmount", totalInvoiceAmount);
			model.put("defaultRender", Boolean.TRUE);
			model.put(ACTIVETAB, "invoiceslist");
		}
		catch (Exception e) {
			SessionErrors.add(request, "default-error-message");
			_log.error("InvoiceController.renderInvoiceList() - error occured while rendering invoices " +
				e.getMessage());
		}
		return new ModelAndView("invoicelist", model);
	}

	@ActionMapping(params = "action=importInvoice")
	protected void callAction(
		@ModelAttribute("invoiceModel") InvoiceDTO invoice, ModelMap model,
		ActionRequest request, ActionResponse response)
		throws Exception {

		request.getPortletSession().removeAttribute("invoiceDTO");
		request.getPortletSession().removeAttribute("invoiceList");
		request.getPortletSession().removeAttribute("validInvoiceList");
		request.getPortletSession().removeAttribute("invalidnvoiceList");
		int currentRow = 0;
		Invoice invoiceModel = null;
		Workbook workbook = null;
		List<Invoice> validInvoiceList = new ArrayList<Invoice>();
		List<Invoice> invalidnvoiceList = new ArrayList<Invoice>();
		String zero = "0";
		Company scfCompany = companyService.findById(invoice.getScfCompany());

		try {
			workbook =new XSSFWorkbook(invoice.getInvoiceDoc().getInputStream());
			int numberOfSheets = workbook.getNumberOfSheets();
			DataFormatter formatter = new DataFormatter();
			for (int i = 0; i < numberOfSheets; i++) {
				Sheet sheet = workbook.getSheetAt(i);
				// every sheet has rows, iterate over them
				Iterator<Row> rowIterator = sheet.iterator();
				while (rowIterator.hasNext()) {
					invoiceModel = new Invoice();
					invoiceModel.setScfCompany(scfCompany);
					currentRow = currentRow + 1;
					
					Row row = rowIterator.next();
					// Every row has columns, get the column iterator and
					// iterate over them
					if(currentRow==1){
						continue;
					}
					Iterator<Cell> cellIterator = row.cellIterator();
					int index = 0;
					while (cellIterator.hasNext()) {
						Cell cell = cellIterator.next();
						// Get the Cell object
						if (index == 0) {
						    	//invoiceModel.setInvoiceDate(cell.getDateCellValue());
							invoiceModel.setInvoiceNumber(formatter.formatCellValue(cell));
						}
						else if (index == 1) {
							invoiceModel.setInvoiceDate(cell.getDateCellValue());

						}
						else if (index == 2) {
							cell.setCellType(Cell.CELL_TYPE_STRING);
						/*	if (!StringUtils.isNullOrEmpty(cell.getStringCellValue()) &&
								!cell.getStringCellValue().startsWith("0")) {
								// this fix to add 0 as prefix to company number
								// as
								// companieshouse.gov.uk services has all
								// company number staring from 0
								StringBuilder sb = new StringBuilder(zero);
								sb.append(cell.getStringCellValue());
								invoiceModel.setSellerCompanyRegistrationNumber(sb.toString());
								sb = null;
							}*/
							//else {
								invoiceModel.setSellerCompanyRegistrationNumber(cell.getStringCellValue());
							//}

						}
						else if (index == 3) {
							invoiceModel.setInvoiceAmount(BigDecimal.valueOf(cell.getNumericCellValue()));
						}
						else if (index == 4) {
							invoiceModel.setInvoiceDesc(cell.getStringCellValue());
						}
						else if (index == 5) {
							invoiceModel.setPayment_date(cell.getDateCellValue());
						}
						else if (index == 6) {
							invoiceModel.setCurrency(cell.getStringCellValue());
						}	
						
						//in case of sheet has unnessary columns. 
						else if(index>6){
							break;
						}   
						invoiceModel.setStatus(InvoiceStatus.NEW.getValue());
						index++;
					}
					Integer valid=invoiceService.validInvoiceImport(invoiceModel.getInvoiceNumber(), invoiceModel.getScfCompany().getId());
					if(valid!=null && valid>0){
						invalidnvoiceList.add(invoiceModel);
					}else{
					    Date date=new Date();
					    invoiceModel.setCreateDate(date);
					    invoiceModel.setUpdateDate(date);
					    validInvoiceList.add(invoiceModel);
					}
				}

			}

			request.getPortletSession().setAttribute("invoiceDTO", invoice);
			request.getPortletSession().setAttribute("invalidnvoiceList", invalidnvoiceList);
			request.getPortletSession().setAttribute("validInvoiceList", validInvoiceList);
			model.put("documentUpload", Boolean.TRUE);
			model.put("invalidnvoiceList", invalidnvoiceList);
			model.put("validInvoiceList", validInvoiceList);
			response.setRenderParameter("render", "invoiceDocuments");
		}
		catch (Exception e) {
		    	model.put("documentUpload", Boolean.TRUE);
			model.put("errorOccured", true);
			response.setRenderParameter("render", "invoiceDocuments");
			e.printStackTrace();

		}
		finally {
			model.put("currentRow", currentRow);
		}

	}

	@SuppressWarnings("unchecked")
	@ActionMapping(params = "action=saveInvoices")
	protected void saveInvoices(
		ModelMap model, ActionRequest request, ActionResponse response)
		throws Exception {

		InvoiceDTO invoice =
			(InvoiceDTO) request.getPortletSession().getAttribute("invoiceDTO");
		List<Invoice> invoiceList =
			(List<Invoice>) request.getPortletSession().getAttribute(
				"validInvoiceList");

		FileEntry fileEntry = null;
		Folder folder = null;
		InvoiceDocument invoiceDocument = null;
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
				"Invoices Document Folder", serviceContextDlFolder);
		String userName = themeDisplay.getUser().getScreenName();
		String mimeType =
			MimeTypesUtil.getContentType(
				invoice.getInvoiceDoc().getInputStream(),
				invoice.getInvoiceDoc().getName());
		ServiceContext serviceContext =
			ServiceContextFactory.getInstance(
				DLFileEntry.class.getName(), request);
		fileEntry =
			DLAppServiceUtil.addFileEntry(
				themeDisplay.getScopeGroupId(), folder.getFolderId(),
				invoice.getInvoiceDoc().getOriginalFilename(), mimeType,
				invoice.getInvoiceDoc().getOriginalFilename(),
				invoice.getInvoiceDoc().getOriginalFilename(), "upload",
				invoice.getInvoiceDoc().getInputStream(),
				invoice.getInvoiceDoc().getSize(), serviceContext);
		invoiceDocument = new InvoiceDocument();
		invoiceDocument.setDocumentId(fileEntry.getFileEntryId());
		invoiceDocument.setUploadDate(new Date());
		invoiceDocument.setUploadedby(userName);
		invoiceDocument.setDocumentName(invoice.getInvoiceDoc().getOriginalFilename());
		invoiceDocument.setDocumentUrl(liferayUtility.getDocumentURL(
			themeDisplay, fileEntry));
		invoiceDocument.setDocumentType(mimeType);

		if (invoiceList != null && invoiceList.size() > 0) {
			invoiceService.addInvoices(invoiceList);
			invoiceDocument.setScfCompany(invoiceList.get(0).getScfCompany());
			invoiceDocumentService.addInvoiceDocument(invoiceDocument);
		}
		response.setRenderParameter("render", "invoiceDocuments");

	}

	@ActionMapping(params = "action=requestFinance")
	protected void requestFinance(
		ModelMap model, ActionRequest request, ActionResponse response)
		throws Exception {

		String invoiceIds = ParamUtil.getString(request, "invoices");
		Date financeDate = null;
		List<String> invoicesIdList = null;
		try {
			if (!StringUtils.isNullOrEmpty(invoiceIds)) {
				long companyId = liferayUtility.getWhitehallCompanyID(request);
				long userId =
					userService.getUserbyLiferayUserID(liferayUtility.getLiferayUserID(request));
				invoicesIdList = Arrays.asList(invoiceIds.split(","));
				financeDate =
					invoiceService.triggerAllotment(
						invoicesIdList, companyId, userId);
			}

			PortletConfig portletConfig =
				(PortletConfig) request.getAttribute(JavaConstants.JAVAX_PORTLET_CONFIG);
			SessionMessages.add(request, "invoice.success.trade");
			model.put(
				"successMessage",
				LanguageUtil.get(
					portletConfig, request.getLocale(), "invoice.success.trade") +
					liferayUtility.getDate(financeDate));

			if (invoicesIdList != null) {
				for (String inv : invoicesIdList) {

					Invoice invm =
						invoiceService.getInvoicesById(Long.valueOf(inv));

					// Email Notification
					try {
						String articleName = "seller-request-for-finanace"; // Web
																			// Content's
																			// UrlTitle
						String content =
							liferayUtility.getContentByURLTitle(
								request, articleName);

						content =
							content.replaceAll(
								"PHNO1", invm.getScfCompany().getName());
						content =
							content.replaceAll("PHNO3", "White Hall Finance");
						String tempstart =
							"<table border=\"1\" cellpadding=\"1\" cellspacing=\"1\" style=\"width:500px;\"><tbody><tr><td><strong>Invoice Number</strong></td><td><strong>Invoice Amount</strong></td><td><strong>Date&nbsp;</strong></td></tr>";
						String tempend = "</tbody></table>";
						String tempstr =
							tempstart + "<tr><td>" + invm.getInvoiceNumber() +
								"</td><td>" + invm.getInvoiceAmount() +
								"</td><td>" + invm.getInvoiceDate() +
								"</td></tr>" + tempend;
						content = content.replaceAll("PHNO10", tempstr);

						String from =
							LanguageUtil.get(
								portletConfig, request.getLocale(),
								"invoice.sender.email");
						// String to =
						// userService.findUserOjectByCompanyId(invoiceModel.getScfCompany().getId());
						String to = "gautam.tf2015@gmail.com";

						System.out.println("\ncontent - " + content);
						System.out.println("\nfrom - " + from);
						System.out.println("\nto - " + to);
						System.out.println("\ntempstr - " + tempstr);

						if (!content.endsWith("") && !from.endsWith("") &&
							!to.endsWith("")) {
							liferayUtility.sendEmail(
								request,
								from,
								to,
								"Your request finance for this invoice has been created.",
								content);
						}

					}
					catch (Exception e) {
						e.printStackTrace();
					}
				}
			}

		}
		catch (InSuffcientFund e) {
			Invoice invoice = invoiceService.findById(Long.valueOf(invoicesIdList.get(0)));
			model.put("scfCompany", invoice.getScfCompany().getName());
			SessionErrors.add(request, "invoice.allotment.error");
			e.getMessage();
		}		
		catch (InvalidDuration e) {
			model.put("minPaymentDurationDate", e.getDuration());
			SessionErrors.add(request, "invoice.minPaymentDuration.error");
			e.getMessage();
		}
	}

	@RenderMapping(params = "action=invoiceRedirect")
	public ModelAndView invoiceRedirect(
		ModelMap model, RenderRequest request, RenderResponse response)
		throws Exception {
		return new ModelAndView("invoicelist", model);
	}

	@ResourceMapping("closeSessionValues")
	public void closeSessionValues(ResourceRequest request,
			ResourceResponse response, ModelMap modelMap) throws IOException {
		request.getPortletSession().removeAttribute("validInvoiceList");
		request.getPortletSession().removeAttribute("invalidnvoiceList");
	}


	protected Log _log =
		LogFactoryUtil.getLog(InvoiceController.class.getName());
}
