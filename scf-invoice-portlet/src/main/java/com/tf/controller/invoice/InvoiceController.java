package com.tf.controller.invoice;

import com.liferay.portal.kernel.log.Log;
import com.liferay.portal.kernel.log.LogFactoryUtil;
import com.liferay.portal.kernel.repository.model.FileEntry;
import com.liferay.portal.kernel.repository.model.Folder;
import com.liferay.portal.kernel.servlet.SessionErrors;
import com.liferay.portal.kernel.util.MimeTypesUtil;
import com.liferay.portal.kernel.util.ParamUtil;
import com.liferay.portal.kernel.util.WebKeys;
import com.liferay.portal.service.ServiceContext;
import com.liferay.portal.service.ServiceContextFactory;
import com.liferay.portal.theme.ThemeDisplay;
import com.liferay.portlet.documentlibrary.model.DLFileEntry;
import com.liferay.portlet.documentlibrary.model.DLFolder;
import com.liferay.portlet.documentlibrary.model.DLFolderConstants;
import com.liferay.portlet.documentlibrary.service.DLAppServiceUtil;
import com.mysql.jdbc.StringUtils;
import com.tf.dto.InvoiceDTO;
import com.tf.model.Company;
import com.tf.model.Invoice;
import com.tf.model.InvoiceDocument;
import com.tf.persistance.util.Constants;
import com.tf.persistance.util.InvoiceStatus;
import com.tf.service.CompanyService;
import com.tf.service.InvoiceDocumentService;
import com.tf.service.InvoiceService;
import com.tf.service.UserService;
import com.tf.util.LiferayUtility;

import java.beans.PropertyEditorSupport;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.portlet.ActionRequest;
import javax.portlet.ActionResponse;
import javax.portlet.RenderRequest;
import javax.portlet.RenderResponse;

import org.apache.poi.ss.usermodel.Cell;
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

/**
 * This controller is responsible for request/response handling on
 * Invoice screens
 * 
 * @author Gautam Sharma
 * 
 */
@Controller
@RequestMapping(value = "VIEW")
public class InvoiceController {
	
	private  final static String ACTIVETAB="activetab";	

	@Autowired
	protected UserService userService;	
	
	@Autowired
	protected InvoiceService invoiceService;
	
	@Autowired
	protected InvoiceDocumentService invoiceDocumentService;
	
	@Autowired
	protected CompanyService companyService;
	
	@Autowired
	protected LiferayUtility liferayUtility;
	
	

	@InitBinder
	public void binder(WebDataBinder binder) {

		binder.registerCustomEditor(Date.class, new PropertyEditorSupport() {
			public void setAsText(String value) {
				try {
					setValue(new SimpleDateFormat("MM/dd/yyyy").parse(value));
				} catch (Exception e) {
					setValue(value);
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
		
	}
	
	

	@RenderMapping(params = "render=invoiceDocuments")
	protected ModelAndView renderInvoiceDocumentList(
			@ModelAttribute("invoiceModel") InvoiceDTO invoice, ModelMap model,
			RenderRequest request, RenderResponse response) throws Exception {
		try {
			List<Company> companyList = new ArrayList<Company>();
			ThemeDisplay themeDisplay = liferayUtility.getThemeDisplay(request);
			List<InvoiceDocument> invoiceDocumentList = new ArrayList<InvoiceDocument>();
			if (liferayUtility.getPermissionChecker(request).isOmniadmin()) {
				invoiceDocumentList = invoiceDocumentService
						.getInvoiceDocuments();
				companyList = companyService.getCompanies("5");
				model.put("userType", Constants.ADMIN);
			} else if (request.isUserInRole(Constants.SCF_ADMIN)) {
				invoiceDocumentList = invoiceDocumentService
						.getInvoiceDocuments(themeDisplay.getUser().getUserId());
				long companyId = userService.getCompanyIDbyUserID(themeDisplay
						.getUserId());
				companyList.add(companyService.findById(companyId));
				model.put("userType", Constants.SCF_ADMIN);
			}
			model.put("companyList", companyList);
			model.put("invoiceList", invoiceDocumentList);
			model.put(ACTIVETAB, "invoiceDocuments");
		} catch (Exception e) {
			SessionErrors.add(request, "default-error-message");
			_log.error("InvoiceController.renderInvoiceDocumentList() - error occured while rendering invoice documents "+e.getMessage());
		}
		return new ModelAndView("invoicedoclist", model);
	}

	
	@RenderMapping(params = "render=createInvoice")
	protected ModelAndView renderCreateInvoice(
			@ModelAttribute("invoiceModel") InvoiceDTO invoice, ModelMap model,
			RenderRequest request, RenderResponse response) throws Exception {
		List<Company> companyList = companyService.getCompanies("5");
		model.put("companyList", companyList);
		return new ModelAndView("createinvoice", model);
	}
	@ActionMapping(params = "update=updateInvoice")
	protected void updateInvoice(
			@ModelAttribute("invoiceModel") InvoiceDTO invoice, ModelMap model,
			ActionRequest request, ActionResponse response) {
		long invoiceId=ParamUtil.getLong(request, "invoiceId");
		Invoice invs=invoiceService.getInvoicesById(invoiceId);
        if(invs == null){
        	Invoice invoiceModel = transfromInvoiceDtoToInvoiceModel(invoice);
			List<Invoice> invoices = new ArrayList<Invoice>();
			invoices.add(invoiceModel);
			invoiceService.addInvoices(invoices);
        }
        else{
        	Invoice invoiceModel= new Invoice();
    		invoiceModel.setId(invs.getId());
    		invoiceModel.setInvoiceNumber(invoice.getInvoiceNumber());
    		invoiceModel.setInvoiceDate(invoice.getInvoiceDate());
    		invoiceModel.setSellerCompanyRegistrationNumber(invoice.getSellerRegNo());
    		invoiceModel.setSellerCompanyVatNumber(invoice.getSellerVatNumber());
    		invoiceModel.setInvoiceAmount(invoice.getInvoiceAmount());
    		invoiceModel.setVatAmount(invoice.getInvoiceAmount());
    		invoiceModel.setInvoiceDesc(invoice.getInvoiceDesc());
    		invoiceModel.setDuration(invoice.getDuration());
    		invoiceModel.setPayment_date(invoice.getPaymentDate());
    		invoiceModel.setCurrency(invoice.getCurrency());
    		invoiceModel.setStatus(InvoiceStatus.NEW.getValue());
    		invoiceModel.setDueDate(invoice.getDueDate());
    		Company scfCompany=companyService.findById(invoice.getScfCompany());
    		invoiceModel.setScfCompany(scfCompany);
    		List<Invoice> invoices = new ArrayList<Invoice>();
			invoices.add(invoiceModel);
			invoiceService.addInvoices(invoices);

        }
	}
	@ActionMapping(params = "action=addInvoice")
	protected void addInvoice(
			@ModelAttribute("invoiceModel") InvoiceDTO invoice, ModelMap model,
			ActionRequest request, ActionResponse response) {
		try {
			  System.out.println("Invoicesss:"+invoice);
			 
			Invoice invoiceModel = transfromInvoiceDtoToInvoiceModel(invoice);
			List<Invoice> invoices = new ArrayList<Invoice>();
			invoices.add(invoiceModel);
			invoiceService.addInvoices(invoices);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private Invoice transfromInvoiceDtoToInvoiceModel(InvoiceDTO invoice) {
		Invoice invoiceModel= new Invoice();
		invoiceModel.setId(invoice.getId());
		invoiceModel.setInvoiceNumber(invoice.getInvoiceNumber());
		invoiceModel.setInvoiceDate(invoice.getInvoiceDate());
		invoiceModel.setSellerCompanyRegistrationNumber(invoice.getSellerRegNo());
		invoiceModel.setSellerCompanyVatNumber(invoice.getSellerVatNumber());
		invoiceModel.setInvoiceAmount(invoice.getInvoiceAmount());
		invoiceModel.setVatAmount(invoice.getInvoiceAmount());
		invoiceModel.setInvoiceDesc(invoice.getInvoiceDesc());
		invoiceModel.setDuration(invoice.getDuration());
		invoiceModel.setPayment_date(invoice.getPaymentDate());
		invoiceModel.setCurrency(invoice.getCurrency());
		invoiceModel.setStatus(InvoiceStatus.NEW.getValue());
		invoiceModel.setDueDate(invoice.getDueDate());
		Company scfCompany=companyService.findById(invoice.getScfCompany());
		invoiceModel.setScfCompany(scfCompany);
		return invoiceModel;
	}
	@RenderMapping(params = "render=updateInvoices")
	protected ModelAndView renderupdateInvoices(
			@ModelAttribute("invoiceModel") InvoiceDTO invoiceModel, ModelMap model,
			RenderRequest request, RenderResponse response) throws Exception {
		List<Company> companyList = companyService.getCompanies("5");
		long invoiceId=ParamUtil.getLong(request, "invoiceID");
		if(invoiceId >0){
		Invoice invoice=invoiceService.getInvoicesById(invoiceId);
		
			Company	scfCompanies=invoice.getScfCompany();
			invoiceModel.setId(invoice.getId());
			invoiceModel.setCompanyId(scfCompanies.getId());
			invoiceModel.setInvoiceNumber(invoice.getInvoiceNumber());
			invoiceModel.setInvoiceDate((invoice.getInvoiceDate()));
			invoiceModel.setSellerRegNo(invoice.getSellerCompanyRegistrationNumber());
			invoiceModel.setSellerVatNumber(invoice.getSellerCompanyVatNumber());
			invoiceModel.setCurrency(invoice.getCurrency());
			invoiceModel.setDueDate(invoice.getDueDate());
			invoiceModel.setDuration(invoice.getDuration());
			invoiceModel.setInvoiceAmount(invoice.getInvoiceAmount());
			invoiceModel.setPaymentDate(invoice.getPayment_date());
            invoiceModel.setVatAmount(invoice.getVatAmount());
            model.put("scfCompanies", scfCompanies);
		
		model.put("invoices", invoice);

	}			
		model.put("companyList", companyList);
		model.put("invoiceModel", invoiceModel);
	    return new ModelAndView("createinvoice",model);
		
	}
	@RenderMapping
	protected ModelAndView renderInvoiceList(
			RenderRequest request, RenderResponse response,ModelMap model) throws Exception {
		try {
			List<Invoice> invoices = new ArrayList<Invoice>();
			ThemeDisplay themeDisplay = (ThemeDisplay) request
					.getAttribute(WebKeys.THEME_DISPLAY);
			if (liferayUtility.getPermissionChecker(request).isOmniadmin()
					|| request.isUserInRole(Constants.WHITEHALL_ADMIN)) {
				invoices = invoiceService.getInvoices();
				model.put("userType", Constants.ADMIN);
			} else if (request.isUserInRole(Constants.SCF_ADMIN)) {
				invoices = invoiceService.getInvoices(themeDisplay.getUser()
						.getUserId());
				model.put("userType", Constants.SCF_ADMIN);
			} else if (request.isUserInRole(Constants.SELLER_ADMIN)) {
				long companyId = userService.getCompanyIDbyUserID(themeDisplay
						.getUserId());
				invoices = invoiceService
						.getInvoicesByCompanyNumber(companyService.findById(
								companyId).getRegNumber());
				model.put("userType", Constants.SELLER_ADMIN);
			}
			request.getPortletSession().removeAttribute("invoiceDTO");
			request.getPortletSession().removeAttribute("invoiceList");
			model.put("invoicesList", invoices);
			model.put("defaultRender", Boolean.TRUE);
			model.put(ACTIVETAB, "invoiceslist");
		} catch (Exception e) {
			SessionErrors.add(request, "default-error-message");
			_log.error("InvoiceController.renderInvoiceList() - error occured while rendering invoices "+e.getMessage());
		}
		return new ModelAndView("invoicelist", model);
	}

	@ActionMapping(params = "action=importInvoice")
	protected void callAction(
			@ModelAttribute("invoiceModel") InvoiceDTO invoice, ModelMap model,
			ActionRequest request, ActionResponse response) throws Exception {
		request.getPortletSession().removeAttribute("invoiceDTO");
		request.getPortletSession().removeAttribute("invoiceList");		
		int currentRow=0;
		Invoice invoiceModel = null;		
		Workbook workbook = null;
		List<Invoice> invoiceList = new ArrayList<Invoice>();
		String zero="0";
		Company scfCompany= companyService.findById(invoice.getScfCompany());
	
		try {
			workbook = new XSSFWorkbook(invoice.getInvoiceDoc()
					.getInputStream());
			int numberOfSheets = workbook.getNumberOfSheets();			
			for (int i = 0; i < numberOfSheets; i++) {
				Sheet sheet = workbook.getSheetAt(i);
				// every sheet has rows, iterate over them
				Iterator<Row> rowIterator = sheet.iterator();
				while (rowIterator.hasNext()) {
					invoiceModel = new Invoice();
					invoiceModel.setScfCompany(scfCompany);
					currentRow=currentRow+1;

					Row row = rowIterator.next();
					// Every row has columns, get the column iterator and
					// iterate over them
					Iterator<Cell> cellIterator = row.cellIterator();
					int index = 0;
					while (cellIterator.hasNext()) {
						Cell cell = cellIterator.next();
						// Get the Cell object
						if (index == 0) {
							invoiceModel.setInvoiceNumber((long) cell.getNumericCellValue());
						} else if (index == 1) {
							invoiceModel.setInvoiceDate(cell.getDateCellValue());

						} else if (index == 2) {
							cell.setCellType(Cell.CELL_TYPE_STRING);							
							if(!StringUtils.isNullOrEmpty(cell.getStringCellValue()) && !cell.getStringCellValue().startsWith("0")){
								//this fix to add 0 as prefix to company number as
								//companieshouse.gov.uk services has all company number staring from 0
								StringBuilder sb=new StringBuilder(zero);
								sb.append(cell.getStringCellValue());
								invoiceModel.setSellerCompanyRegistrationNumber(sb.toString());
								sb=null;
							}else{
								invoiceModel.setSellerCompanyRegistrationNumber(cell.getStringCellValue());
							}
							
						} else if (index == 3) {
							invoiceModel.setSellerCompanyVatNumber(cell.getStringCellValue());
						} else if (index == 4) {
							invoiceModel.setInvoiceAmount(BigDecimal.valueOf(cell.getNumericCellValue()));
						} else if (index == 5) {
							invoiceModel.setVatAmount(BigDecimal.valueOf(cell.getNumericCellValue()));
						} else if (index == 6) {
							invoiceModel.setInvoiceDesc(cell.getStringCellValue());
						} else if (index == 7) {
							invoiceModel.setDuration((int) (cell.getNumericCellValue()));
						} else if (index == 8) {
							invoiceModel.setPayment_date(cell.getDateCellValue());
						} else if (index == 9) {
							invoiceModel.setCurrency(cell.getStringCellValue());
						}else if (index == 10) {
							invoiceModel.setDueDate(cell.getDateCellValue());
						}
						
						invoiceModel.setStatus(InvoiceStatus.NEW.getValue());
						index++;
					}
					invoiceList.add(invoiceModel);
				}

			}
			
		request.getPortletSession().setAttribute("invoiceDTO", invoice);
		request.getPortletSession().setAttribute("invoiceList", invoiceList);		
		model.put("documentUpload",Boolean.TRUE);
		model.put("invoicesList",invoiceList);
		response.setRenderParameter("render","invoiceDocuments");
		} catch (Exception e) {
			model.put("errorOccured",true);
			e.printStackTrace();
		
		} finally {
			model.put("currentRow",currentRow);
		}

	}
	
	@SuppressWarnings("unchecked")
	@ActionMapping(params = "action=saveInvoices")
	protected void saveInvoices(ModelMap model,
			ActionRequest request, ActionResponse response) throws Exception {
		InvoiceDTO invoice= (InvoiceDTO)request.getPortletSession().getAttribute("invoiceDTO");		
		List<Invoice> invoiceList = (List<Invoice>)request.getPortletSession().getAttribute("invoiceList");
	
		
		FileEntry fileEntry = null;
		Folder folder=null;
		InvoiceDocument invoiceDocument = null;
		ThemeDisplay themeDisplay = (ThemeDisplay) request
				.getAttribute(WebKeys.THEME_DISPLAY);
		long currentSideID = themeDisplay.getScopeGroupId();
		long parentFolderId = DLFolderConstants.DEFAULT_PARENT_FOLDER_ID;
		Folder parentfolder = null;
		parentfolder = DLAppServiceUtil.getFolder(currentSideID, 0, "Invoices");
		if (parentfolder != null) {
			parentFolderId = parentfolder.getFolderId();
		}
		 Integer	folderCount=DLAppServiceUtil.getFoldersCount(currentSideID,  parentFolderId) ;         
		ServiceContext serviceContextDlFolder = ServiceContextFactory.getInstance(DLFolder.class.getName(), request); 
		folder=DLAppServiceUtil.addFolder(currentSideID, parentFolderId, folderCount.toString(), "Invoices Document Folder", serviceContextDlFolder);
		String userName = themeDisplay.getUser().getScreenName();
		String mimeType = MimeTypesUtil.getContentType(invoice.getInvoiceDoc()
				.getInputStream(), invoice.getInvoiceDoc().getName());
		ServiceContext serviceContext = ServiceContextFactory.getInstance(
				DLFileEntry.class.getName(), request);
		fileEntry = DLAppServiceUtil.addFileEntry(themeDisplay
				.getScopeGroupId(), folder.getFolderId(), invoice.getInvoiceDoc()
				.getOriginalFilename(), mimeType, invoice.getInvoiceDoc()
				.getOriginalFilename(), invoice.getInvoiceDoc()
				.getOriginalFilename(), "upload", invoice.getInvoiceDoc()
				.getInputStream(), invoice.getInvoiceDoc().getSize(),
				serviceContext);
		invoiceDocument = new InvoiceDocument();
		invoiceDocument.setDocumentId(fileEntry.getFileEntryId());
		invoiceDocument.setUploadDate(new Date());
		invoiceDocument.setUploadedby(userName);
		invoiceDocument.setDocumentName(invoice.getInvoiceDoc()
				.getOriginalFilename());
		invoiceDocument.setDocumentUrl(liferayUtility.getDocumentURL(themeDisplay, fileEntry));
		invoiceDocument.setDocumentType(mimeType);

		if (invoiceList != null && invoiceList.size() > 0) {
			invoiceService.addInvoices(invoiceList);
			invoiceDocument.setScfCompany(invoiceList.get(0).getScfCompany());
			invoiceDocumentService.addInvoiceDocument(invoiceDocument);
		}
		response.setRenderParameter("render","invoiceDocuments");

	}
	
	@ActionMapping(params = "action=requestFinance")
	protected void requestFinance(ModelMap model,
			ActionRequest request, ActionResponse response) throws Exception {
		String invoiceIds= ParamUtil.getString(request, "invoices");
		if(!StringUtils.isNullOrEmpty(invoiceIds)){
			long companyId = liferayUtility.getWhitehallCompanyID(request);
			long userId=userService.getUserbyLiferayUserID(liferayUtility.getLiferayUserID(request));
			List<String> invoicesIdList=Arrays.asList(invoiceIds.split(","));
			invoiceService.triggerAllotment(invoicesIdList,companyId,userId);
		}
		
	}	
	
	protected Log _log = LogFactoryUtil.getLog(InvoiceController.class.getName());
}
