package com.tf.controller.invoice;

import java.math.BigDecimal;
import java.util.ArrayList;
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
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.portlet.ModelAndView;
import org.springframework.web.portlet.bind.annotation.ActionMapping;
import org.springframework.web.portlet.bind.annotation.RenderMapping;

import com.liferay.portal.kernel.repository.model.FileEntry;
import com.liferay.portal.kernel.repository.model.Folder;
import com.liferay.portal.kernel.util.MimeTypesUtil;
import com.liferay.portal.kernel.util.WebKeys;
import com.liferay.portal.security.permission.PermissionChecker;
import com.liferay.portal.service.ServiceContext;
import com.liferay.portal.service.ServiceContextFactory;
import com.liferay.portal.theme.ThemeDisplay;
import com.liferay.portlet.documentlibrary.model.DLFileEntry;
import com.liferay.portlet.documentlibrary.model.DLFolder;
import com.liferay.portlet.documentlibrary.model.DLFolderConstants;
import com.liferay.portlet.documentlibrary.service.DLAppServiceUtil;
import com.tf.dto.InvoiceDTO;
import com.tf.model.Company;
import com.tf.model.Invoice;
import com.tf.model.InvoiceDocument;
import com.tf.persistance.util.Constants;
import com.tf.service.CompanyService;
import com.tf.service.InvoiceDocumentService;
import com.tf.service.InvoiceService;

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
	protected InvoiceService invoiceService;	
	
	@Autowired
	protected InvoiceDocumentService invoiceDocumentService;
	
	@Autowired
	protected CompanyService companyService;

	@RenderMapping(params = "render=invoiceDocuments")
	protected ModelAndView renderInvoiceDocumentList(
			@ModelAttribute("invoiceModel") InvoiceDTO invoice, ModelMap model,
			RenderRequest request, RenderResponse response) throws Exception {
		System.out.println("In render");		
		List<InvoiceDocument> invoiceDocumentList = invoiceDocumentService.getInvoiceDocuments();
		List<Company> companyList = companyService.getCompanies("5");
		model.put("companyList", companyList);
		model.put("invoiceList", invoiceDocumentList);
		model.put(ACTIVETAB,"invoiceDocuments");
		return new ModelAndView("invoicedoclist", model);
	}


	@RenderMapping
	protected ModelAndView renderInvoiceList(
			@ModelAttribute("invoiceModel") InvoiceDTO invoice, ModelMap model,
			RenderRequest request, RenderResponse response) throws Exception {
		System.out.println("In Default render");	
		List<Invoice> invoices= new ArrayList<Invoice>();
		ThemeDisplay themeDisplay = (ThemeDisplay)request.getAttribute(WebKeys.THEME_DISPLAY);
		PermissionChecker permissionChecker = themeDisplay.getPermissionChecker();
		if(permissionChecker.isOmniadmin() ){
			invoices=invoiceService.getInvoices();
		}else if(request.isUserInRole(Constants.SCF_ADMIN)){
			invoices=invoiceService.getInvoices(themeDisplay.getUser().getCompanyId());
		}
		request.getPortletSession().removeAttribute("invoiceDTO");
		request.getPortletSession().removeAttribute("invoiceList");	
		model.put("invoicesList", invoices);
		model.put("defaultRender", Boolean.TRUE);
		model.put(ACTIVETAB,"invoiceslist");
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
					invoiceModel.setScfCompany(companyService.findById(invoice.getScfCompany()));
					currentRow=currentRow++;

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
							invoiceModel.setSellerCompanyRegistrationNumber(cell.getStringCellValue());
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
						index++;
					}
					invoiceList.add(invoiceModel);
				}

			}
			
			request.getPortletSession().setAttribute("invoiceDTO", invoice);
			request.getPortletSession().setAttribute("invoiceList", invoiceList);

			/*if (invoiceList != null && invoiceList.size() > 0) {	
					invoiceService.addInvoices(invoiceList);				
					invoiceDocumentService.addInvoiceDocument(invoiceDocument);
			}	*/
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
		// FileInputStream inputStream = new FileInputStream();
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
		invoiceDocument.setDocumentUrl(getUrl(themeDisplay, fileEntry));
		invoiceDocument.setDocumentType(mimeType);

		if (invoiceList != null && invoiceList.size() > 0) {
			invoiceService.addInvoices(invoiceList);
			invoiceDocumentService.addInvoiceDocument(invoiceDocument);
		}
		response.setRenderParameter("render","invoiceDocuments");

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
