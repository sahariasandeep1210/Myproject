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
import com.liferay.portal.service.ServiceContext;
import com.liferay.portal.service.ServiceContextFactory;
import com.liferay.portal.theme.ThemeDisplay;
import com.liferay.portlet.documentlibrary.model.DLFileEntry;
import com.liferay.portlet.documentlibrary.model.DLFolderConstants;
import com.liferay.portlet.documentlibrary.service.DLAppServiceUtil;
import com.tf.dto.InvoiceDTO;
import com.tf.model.Invoice;
import com.tf.model.InvoiceDocument;
import com.tf.service.InvoiceDocumentService;
import com.tf.service.InvoiceService;

/**
 * This controller is responsible for request/response handling on
 * Seller/Company screens
 * 
 * @author pawan
 * 
 */
@Controller
@RequestMapping(value = "VIEW")
public class InvoiceController {

	@Autowired
	protected InvoiceService invoiceService;
	
	
	@Autowired
	protected InvoiceDocumentService invoiceDocumentService;

	@RenderMapping(params = "render=invoiceDocuments")
	protected ModelAndView renderInvoiceDocumentList(
			@ModelAttribute("invoiceModel") InvoiceDTO invoice, ModelMap model,
			RenderRequest request, RenderResponse response) throws Exception {
		System.out.println("In render");		
		List<InvoiceDocument> invoiceDocumentList = invoiceDocumentService.getInvoiceDocuments();
		model.put("invoiceList", invoiceDocumentList);
		return new ModelAndView("invoicedoclist", model);
	}
	
	@RenderMapping
	protected ModelAndView renderInvoiceList(
			@ModelAttribute("invoiceModel") InvoiceDTO invoice, ModelMap model,
			RenderRequest request, RenderResponse response) throws Exception {
		System.out.println("In Default render");		
		List<Invoice> invoices = invoiceService.getInvoices();
		model.put("invoiceList", invoices);
		return new ModelAndView("invoicelist", model);
	}

	@ActionMapping(params = "action=importInvoice")
	protected void callAction(
			@ModelAttribute("invoiceModel") InvoiceDTO invoice, ModelMap model,
			ActionRequest request, ActionResponse response) throws Exception {
		FileEntry fileEntry = null;
		Invoice invoiceModel = null;
		InvoiceDocument invoiceDocument = null;
		Workbook workbook = null;
		List<Invoice> invoiceList = new ArrayList<Invoice>();
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
		String userName = themeDisplay.getUser().getScreenName();
		String mimeType = MimeTypesUtil.getContentType(invoice.getInvoiceDoc()
				.getInputStream(), invoice.getInvoiceDoc().getName());
		ServiceContext serviceContext = ServiceContextFactory.getInstance(
				DLFileEntry.class.getName(), request);
		fileEntry = DLAppServiceUtil.addFileEntry(themeDisplay
					.getScopeGroupId(), parentFolderId, invoice.getInvoiceDoc()
					.getOriginalFilename(), mimeType, invoice.getInvoiceDoc()
					.getOriginalFilename(), invoice.getInvoiceDoc().getOriginalFilename(),
					"upload", invoice.getInvoiceDoc().getInputStream(), invoice.getInvoiceDoc().getSize(), serviceContext);
		try {
			workbook = new XSSFWorkbook(invoice.getInvoiceDoc()
					.getInputStream());
			int numberOfSheets = workbook.getNumberOfSheets();
			invoiceDocument = new InvoiceDocument();
			invoiceDocument.setDocumentId(fileEntry.getFileEntryId());
			invoiceDocument.setUploadDate(new Date());
			invoiceDocument.setUploadedby(userName);
			invoiceDocument.setDocumentName(invoice.getInvoiceDoc().getOriginalFilename());
			invoiceDocument.setDocumentUrl(getUrl(themeDisplay, fileEntry));
			invoiceDocument.setDocumentType(mimeType);
			for (int i = 0; i < numberOfSheets; i++) {
				Sheet sheet = workbook.getSheetAt(i);
				// every sheet has rows, iterate over them
				Iterator<Row> rowIterator = sheet.iterator();
				while (rowIterator.hasNext()) {
					invoiceModel = new Invoice();

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
						}
						index++;
					}
					invoiceList.add(invoiceModel);
				}

			}

			if (invoiceList != null && invoiceList.size() > 0) {
				for (Invoice invoice2 : invoiceList) {
					invoiceService.addInvoice(invoice2);
				}
			}
			
			invoiceDocumentService.addInvoiceDocument(invoiceDocument);
		response.setRenderParameter("render","invoiceDocuments");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {

		}

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
