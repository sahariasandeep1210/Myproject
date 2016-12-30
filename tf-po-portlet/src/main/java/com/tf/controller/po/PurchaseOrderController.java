package com.tf.controller.po;

import java.beans.PropertyEditorSupport;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.portlet.ActionRequest;
import javax.portlet.ActionResponse;
import javax.portlet.RenderRequest;
import javax.portlet.RenderResponse;

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

import com.liferay.portal.kernel.exception.PortalException;
import com.liferay.portal.kernel.exception.SystemException;
import com.liferay.portal.kernel.log.Log;
import com.liferay.portal.kernel.log.LogFactoryUtil;
import com.liferay.portal.kernel.repository.model.FileEntry;
import com.liferay.portal.kernel.repository.model.Folder;
import com.liferay.portal.kernel.util.MimeTypesUtil;
import com.liferay.portal.kernel.util.ParamUtil;
import com.liferay.portal.kernel.util.WebKeys;
import com.liferay.portal.service.ServiceContext;
import com.liferay.portal.service.ServiceContextFactory;
import com.liferay.portal.theme.ThemeDisplay;
import com.liferay.portlet.documentlibrary.NoSuchFolderException;
import com.liferay.portlet.documentlibrary.model.DLFileEntry;
import com.liferay.portlet.documentlibrary.model.DLFolder;
import com.liferay.portlet.documentlibrary.model.DLFolderConstants;
import com.liferay.portlet.documentlibrary.service.DLAppServiceUtil;
import com.liferay.portlet.documentlibrary.util.PDFProcessor;
import com.tf.model.PODocument;
import com.tf.model.PurchaseOrderModel;
import com.tf.po.model.PurchaseOrderDTO;
import com.tf.service.PODocumentService;
import com.tf.service.PurchaseOrderService;


@Controller
@RequestMapping(value = "VIEW")
public class PurchaseOrderController {
	
	protected Log _log = LogFactoryUtil.getLog(PurchaseOrderController.class.getName());
	
	private static final String PO_FOLDER_NAME = "Purchase Orders";
	
	
	@Autowired
	private PurchaseOrderService purchaseOrderService;
	
	@Autowired
	private PODocumentService documentService;
	
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

	}
	
	@RenderMapping
	protected ModelAndView defaultRender(@ModelAttribute("purchaseOrderDTO") PurchaseOrderDTO purchaseOrderDTO,ModelMap model,RenderRequest request, RenderResponse response) throws Exception {		
		_log.info("Render PO Order");
		List<PurchaseOrderModel> list= purchaseOrderService.getPurchaseOrderList();
		model.put("list",list);
		return new ModelAndView("purchaseorderlist", model);		
	}
	
	@RenderMapping(params="render=addPurchaseOrder")	
	protected ModelAndView addPurchaseOrder(@ModelAttribute("purchaseOrderDTO") PurchaseOrderDTO purchaseOrderDTO, ModelMap model,RenderRequest request, RenderResponse response) throws Exception {	
		_log.info("Render Add Purchase Order");
		long purchaseOrderId = ParamUtil.getLong(request, "purchaseOrderId"); 
		if(purchaseOrderId>0){
			PurchaseOrderModel purchaseOrderModel=purchaseOrderService.findById(purchaseOrderId);
			purchaseOrderDTO=transformPoModelToPoDTO(purchaseOrderModel);
			List<PODocument> pddocumentsList=documentService.findById(purchaseOrderId);
			model.put("purchaseOrderDTO",purchaseOrderDTO);
			model.put("pddocumentsList",pddocumentsList);
		}else if(request.getAttribute("purchaseOrderId")!=null && (Long)request.getAttribute("purchaseOrderId")>0){
			List<PODocument> pddocumentsList=documentService.findById((Long)request.getAttribute("purchaseOrderId"));
			model.put("pddocumentsList",pddocumentsList);
		}
		return new ModelAndView("createpurchaseorder", model);	
	} 
	
	@ActionMapping(params="action=addPurchaseOrder")
	protected void addPurchaseOrder(@ModelAttribute("purchaseOrderDTO") PurchaseOrderDTO purchaseOrderDTO, 									
												 ModelMap map, 
												 ActionRequest request,
												 ActionResponse response) throws Exception {
		_log.info("Render Add Purchase Order Action");
		boolean uploadDoc=ParamUtil.getBoolean(request, "uploadDocments",false);
		System.out.println("uploadDoc:::::"+uploadDoc);
		if(uploadDoc){
			uploadDocument(map,request,purchaseOrderDTO.getId(),purchaseOrderDTO);
			PurchaseOrderModel purchaseOrderModel=transformPoDTOtoPoModel(purchaseOrderDTO);
			purchaseOrderService.UpdatePurchaseOrder(purchaseOrderModel);
		}else{
			if(purchaseOrderDTO.getId()!=null){
				
			}else{
				PurchaseOrderModel purchaseOrderModel=transformPoDTOtoPoModel(purchaseOrderDTO);
				purchaseOrderModel=purchaseOrderService.addPO(purchaseOrderModel);
				purchaseOrderDTO=transformPoModelToPoDTO(purchaseOrderModel);
			}
			map.put("create", "success");
			map.put("purchaseOrderDTO",purchaseOrderDTO);
		}
		request.setAttribute("purchaseOrderId", purchaseOrderDTO.getId());
		response.setRenderParameter("render", "addPurchaseOrder");
		
	}

	private PurchaseOrderModel transformPoDTOtoPoModel(PurchaseOrderDTO purchaseOrderDTO) {
		PurchaseOrderModel purchaseOrderModel =new PurchaseOrderModel();
		purchaseOrderModel.setId(purchaseOrderDTO.getId());
		Long setSellerId = new Long(purchaseOrderDTO.getSellerId());
		purchaseOrderModel.setSellerId(setSellerId);
		Long debtorCompany = new Long(purchaseOrderDTO.getDebtorCompany());
		purchaseOrderModel.setDebtorCompany(debtorCompany);
		purchaseOrderModel.setPoNumber(purchaseOrderDTO.getPoNumber());
		purchaseOrderModel.setPoDate(purchaseOrderDTO.getPoDate());
		purchaseOrderModel.setPoAmount(purchaseOrderDTO.getPoAmount());
		purchaseOrderModel.setPoDays(purchaseOrderDTO.getPoDays());
		purchaseOrderModel.setPoNotes(purchaseOrderDTO.getPoNotes());
		purchaseOrderModel.setFinanceAmount(purchaseOrderDTO.getFinanceAmount());
		purchaseOrderModel.setDeliveryDate(purchaseOrderDTO.getDeliveryDate());
		purchaseOrderModel.setShippingDate(purchaseOrderDTO.getShippingDate());
		//purchaseOrderModel.setIsTraded(purchaseOrderDTO.getIsTraded());
		return purchaseOrderModel;
	}
	
	private PurchaseOrderDTO transformPoModelToPoDTO(PurchaseOrderModel purchaseOrderModel) {
		PurchaseOrderDTO purchaseOrderDTO =new PurchaseOrderDTO();
		purchaseOrderDTO.setId(purchaseOrderModel.getId());
		/*purchaseOrderDTO.setSellerId(purchaseOrderModel.getSellerId());
		purchaseOrderDTO.setDebtorCompany(purchaseOrderModel.getDebtorCompany());
		*/
		Long setSellerId = new Long(purchaseOrderDTO.getSellerId());
		purchaseOrderModel.setSellerId(setSellerId);
		Long debtorCompany = new Long(purchaseOrderDTO.getDebtorCompany());
		purchaseOrderModel.setDebtorCompany(debtorCompany);
		
		purchaseOrderDTO.setPoNumber(purchaseOrderModel.getPoNumber());
		purchaseOrderDTO.setPoDate(purchaseOrderModel.getPoDate());
		purchaseOrderDTO.setPoAmount(purchaseOrderModel.getPoAmount());
		purchaseOrderDTO.setPoDays(purchaseOrderModel.getPoDays());
		purchaseOrderDTO.setPoNotes(purchaseOrderModel.getPoNotes());
		purchaseOrderDTO.setFinanceAmount(purchaseOrderModel.getFinanceAmount());
		purchaseOrderDTO.setShippingDate(purchaseOrderModel.getShippingDate());
		purchaseOrderDTO.setDeliveryDate(purchaseOrderModel.getDeliveryDate());
		return purchaseOrderDTO;
	}

	private void uploadDocument(ModelMap map, ActionRequest request,Long poID,PurchaseOrderDTO purchaseOrderDTO) throws PortalException, SystemException, IOException {
		System.out.println("PurchaseOrderController.uploadDocument() ::::::::::::::::");
		ThemeDisplay themeDisplay = (ThemeDisplay)request.getAttribute(WebKeys.THEME_DISPLAY);
		long currentSideID = themeDisplay.getScopeGroupId();
        long parentFolderId = DLFolderConstants.DEFAULT_PARENT_FOLDER_ID;
        long poFolderId=0;
       // long userId = themeDisplay.getUserId(); 
        //long groupId = themeDisplay.getScopeGroupId(); 
        long repositoryId = themeDisplay.getScopeGroupId();//repository id is same as groupId
        //boolean mountPoint = false;
        Folder folder=null;
        Folder parentfolder=null;
        parentfolder = DLAppServiceUtil.getFolder(
    			currentSideID, 0, "Purchase Orders");
        if(parentfolder!=null){
            parentFolderId=parentfolder.getFolderId();
        }
        try {
        	 folder = DLAppServiceUtil.getFolder(
        			currentSideID, parentFolderId, poID.toString());
        	} catch(NoSuchFolderException e) {
        		ServiceContext serviceContext = ServiceContextFactory.getInstance(DLFolder.class.getName(), request); 
        		folder=DLAppServiceUtil.addFolder(repositoryId, parentFolderId, poID.toString(), "po folder", serviceContext);
        		/*folder=createPoFolder(request, poID, currentSideID, parentFolderId,
        				poFolderId, repositoryId);*/
        	} 
        addFilestoFolder(themeDisplay,purchaseOrderDTO,folder.getFolderId(),request);
	}

	private void addFilestoFolder(ThemeDisplay themeDisplay,PurchaseOrderDTO purchaseOrderDTO,Long folderId,ActionRequest request) throws PortalException, SystemException, IOException {
			 	 FileEntry fileEntry=null;
			 	 List<PODocument> docList=new ArrayList<PODocument>();			 	  
				 ServiceContext serviceContext = ServiceContextFactory.getInstance(DLFileEntry.class.getName(), request); 
				 String mimeType = MimeTypesUtil.getContentType(purchaseOrderDTO.getInsuranceDoc().getInputStream(), purchaseOrderDTO.getInsuranceDoc().getName());
				 StringBuilder fileNamePrefixSb=new StringBuilder(purchaseOrderDTO.getId().toString());
				 fileNamePrefixSb.append("_");
				 String fileNamePrefix=fileNamePrefixSb.toString();
				 if(purchaseOrderDTO.getInsuranceDoc() !=null && purchaseOrderDTO.getInsuranceDoc().getSize()>0){
					 StringBuilder insurceDocName=new StringBuilder(fileNamePrefix);
					 insurceDocName.append("Insurance_").append(purchaseOrderDTO.getInsuranceDoc().getOriginalFilename());
					 try{
						 DLAppServiceUtil.deleteFileEntryByTitle(themeDisplay.getScopeGroupId(), folderId, "Insurance");
					 }catch(Exception e){
						 _log.error("erro is occured");
					 }
					 fileEntry= DLAppServiceUtil.addFileEntry(themeDisplay.getScopeGroupId(), folderId, insurceDocName.toString(), mimeType, "Insurance", insurceDocName.toString(), "upload", purchaseOrderDTO.getInsuranceDoc().getInputStream(), purchaseOrderDTO.getInsuranceDoc().getSize(), serviceContext);
					 PODocument poDocument =new PODocument();
					 poDocument.setPoID(purchaseOrderDTO.getId());
					 poDocument.setDocumentID(fileEntry.getFileEntryId());
					 poDocument.setDocumentType("Insurance");
					 poDocument.setDocumentName(purchaseOrderDTO.getInsuranceDoc().getOriginalFilename());
					 poDocument.setDocumentUrl(getUrl(themeDisplay,fileEntry));
					 poDocument.setCreate_date(fileEntry.getCreateDate());
					 System.out.println("poDocument:::::"+poDocument);
					 docList.add(poDocument);					
				 }
				 if(purchaseOrderDTO.getInvoiceDoc()!=null && purchaseOrderDTO.getInvoiceDoc().getSize()>0){
					 StringBuilder invoiceDocName=new StringBuilder(fileNamePrefix);
					 invoiceDocName.append("Invoice_").append(purchaseOrderDTO.getInvoiceDoc().getOriginalFilename());
					 invoiceDocName.append("Invoice_").append(purchaseOrderDTO.getInsuranceDoc().getOriginalFilename());
					 try{
						 DLAppServiceUtil.deleteFileEntryByTitle(themeDisplay.getScopeGroupId(), folderId, "Invoice");
					 }catch(Exception e){
						 _log.error("erro is occured");
					 }
					 fileEntry= DLAppServiceUtil.addFileEntry(themeDisplay.getScopeGroupId(), folderId, invoiceDocName.toString(), mimeType, "Invoice", invoiceDocName.toString(), "upload", purchaseOrderDTO.getInvoiceDoc().getInputStream(), purchaseOrderDTO.getInvoiceDoc().getSize(), serviceContext);
					 PODocument poDocument =new PODocument();
					 poDocument.setPoID(purchaseOrderDTO.getId());
					 poDocument.setDocumentID(fileEntry.getFileEntryId());
					 poDocument.setDocumentType("Invoice");
					 poDocument.setDocumentName(purchaseOrderDTO.getInvoiceDoc().getOriginalFilename());
					 poDocument.setDocumentUrl(getUrl(themeDisplay,fileEntry));
					 poDocument.setCreate_date(fileEntry.getCreateDate());
					 System.out.println("poDocument:::::"+poDocument);
					 docList.add(poDocument);
				 }
				 if(purchaseOrderDTO.getDeliveryNoteDoc()!=null && purchaseOrderDTO.getDeliveryNoteDoc().getSize()>0){
					 StringBuilder delieveryDocName=new StringBuilder(fileNamePrefix);
					 delieveryDocName.append("Delievery_").append(purchaseOrderDTO.getDeliveryNoteDoc().getOriginalFilename());
					 try{
						 DLAppServiceUtil.deleteFileEntryByTitle(themeDisplay.getScopeGroupId(), folderId, "Delievery");
					 }catch(Exception e){
						 _log.error("erro is occured");
					 }
					 fileEntry= DLAppServiceUtil.addFileEntry(themeDisplay.getScopeGroupId(), folderId, delieveryDocName.toString(), mimeType, "Delievery", delieveryDocName.toString(), "upload", purchaseOrderDTO.getDeliveryNoteDoc().getInputStream(), purchaseOrderDTO.getDeliveryNoteDoc().getSize(), serviceContext);
					 PODocument poDocument =new PODocument();
					 poDocument.setPoID(purchaseOrderDTO.getId());
					 poDocument.setDocumentID(fileEntry.getFileEntryId());
					 poDocument.setDocumentType("Delievery");
					 poDocument.setDocumentName(purchaseOrderDTO.getDeliveryNoteDoc().getOriginalFilename());
					 poDocument.setDocumentUrl(getUrl(themeDisplay,fileEntry));
					 poDocument.setCreate_date(fileEntry.getCreateDate());
					 System.out.println("poDocument:::::"+poDocument);
					 docList.add(poDocument);
				 }	
				 if(purchaseOrderDTO.getShippingDoc()!=null && purchaseOrderDTO.getShippingDoc().getSize()>0){
					 StringBuilder shippingDocName=new StringBuilder(fileNamePrefix);
					 shippingDocName.append("Shipping_").append(purchaseOrderDTO.getShippingDoc().getOriginalFilename());
					 try{
						 DLAppServiceUtil.deleteFileEntryByTitle(themeDisplay.getScopeGroupId(), folderId, "Shipping");
					 }catch(Exception e){
						 _log.error("erro is occured");
					 }
					 fileEntry= DLAppServiceUtil.addFileEntry(themeDisplay.getScopeGroupId(), folderId, shippingDocName.toString(), mimeType, "Shipping", shippingDocName.toString(), "upload", purchaseOrderDTO.getShippingDoc().getInputStream(), purchaseOrderDTO.getShippingDoc().getSize(), serviceContext);
					 PODocument poDocument =new PODocument();
					 poDocument.setPoID(purchaseOrderDTO.getId());
					 poDocument.setDocumentID(fileEntry.getFileEntryId());
					 poDocument.setDocumentType("Shipping");
					 poDocument.setDocumentName(purchaseOrderDTO.getShippingDoc().getOriginalFilename());
					 poDocument.setDocumentUrl(getUrl(themeDisplay,fileEntry));
					 poDocument.setCreate_date(fileEntry.getCreateDate());
					 System.out.println("poDocument:::::"+poDocument);
					 docList.add(poDocument);
				 }	
				 if(purchaseOrderDTO.getLocDoc()!=null && purchaseOrderDTO.getLocDoc().getSize()>0){
					 StringBuilder locDocName=new StringBuilder(fileNamePrefix);
					 locDocName.append("LOC_").append(purchaseOrderDTO.getLocDoc().getOriginalFilename());
					 try{
						 DLAppServiceUtil.deleteFileEntryByTitle(themeDisplay.getScopeGroupId(), folderId, "LOC");
					 }catch(Exception e){
						 _log.error("erro is occured");
					 }
					 fileEntry= DLAppServiceUtil.addFileEntry(themeDisplay.getScopeGroupId(), folderId, locDocName.toString(), mimeType, "LOC", locDocName.toString(), "upload", purchaseOrderDTO.getLocDoc().getInputStream(), purchaseOrderDTO.getLocDoc().getSize(), serviceContext);
					 PODocument poDocument =new PODocument();
					 poDocument.setPoID(purchaseOrderDTO.getId());
					 poDocument.setDocumentID(fileEntry.getFileEntryId());
					 poDocument.setDocumentType("LOC");
					 poDocument.setDocumentName(purchaseOrderDTO.getLocDoc().getOriginalFilename());
					 poDocument.setDocumentUrl(getUrl(themeDisplay,fileEntry));
					 poDocument.setCreate_date(fileEntry.getCreateDate());
					 System.out.println("poDocument:::::"+poDocument);
					 docList.add(poDocument);
				 }		
				 if(purchaseOrderDTO.getContractDoc()!=null && purchaseOrderDTO.getContractDoc().getSize()>0){
					 StringBuilder contractDocName=new StringBuilder(fileNamePrefix);
					 contractDocName.append("Contract_").append(purchaseOrderDTO.getContractDoc().getOriginalFilename());
					 try{
						 DLAppServiceUtil.deleteFileEntryByTitle(themeDisplay.getScopeGroupId(), folderId, "Contract");
					 }catch(Exception e){
						 _log.error("erro is occured");
					 }
					 fileEntry= DLAppServiceUtil.addFileEntry(themeDisplay.getScopeGroupId(), folderId, contractDocName.toString(), mimeType, "Contract", contractDocName.toString(), "upload", purchaseOrderDTO.getContractDoc().getInputStream(), purchaseOrderDTO.getContractDoc().getSize(), serviceContext);
					 PODocument poDocument =new PODocument();
					 poDocument.setPoID(purchaseOrderDTO.getId());
					 poDocument.setDocumentID(fileEntry.getFileEntryId());
					 poDocument.setDocumentName(purchaseOrderDTO.getContractDoc().getOriginalFilename());
					 poDocument.setDocumentType("Contract");
					 poDocument.setDocumentUrl(getUrl(themeDisplay,fileEntry));
					 poDocument.setCreate_date(fileEntry.getCreateDate());
					 System.out.println("poDocument:::::"+poDocument);
					 docList.add(poDocument);
				 }	
				
				if (docList != null && docList.size() > 0) {
					for (PODocument poDocument : docList) {
						try{
							documentService.deleteDocuments(poDocument);
						}catch(Exception e){
							_log.error("error is occured" + e);
						}
						try {
							documentService.addPODocument(poDocument);
						} catch (Exception e) {
							_log.error("error is occured in addFilestoFolder()" + e);
						}
		
					}
				}
	}



	private Folder createPoFolder(ActionRequest request, Long poID,
			long currentSideID, long parentFolderId, long poFolderId,
			long repositoryId) throws PortalException, SystemException {
		List<Folder> lFolder;
		Folder folder=null;
	
        	lFolder = DLAppServiceUtil.getFolders(currentSideID, parentFolderId);
        	for (Folder currFolder : lFolder){
	            if (currFolder.getName().equalsIgnoreCase(PO_FOLDER_NAME)) {
	            	poFolderId= currFolder.getFolderId();
	                break;
	            }
	        }
        	ServiceContext serviceContext = ServiceContextFactory.getInstance(DLFolder.class.getName(), request); 
        	//DLFolderLocalServiceUtil.addFolder(userId, groupId, repositoryId, mountPoint, poFolderId, poID.toString(), "", hidden, serviceContext);
        	folder = DLAppServiceUtil.addFolder(repositoryId, poFolderId, poID.toString(), "po folder", serviceContext);
        	System.out.println("Folder :: "+folder.getName());       
		return folder;
	}
	
	private String getUrl( ThemeDisplay themeDisplay,FileEntry fileEntry) {
		StringBuilder sb = new StringBuilder();
		sb.append(themeDisplay.getPortalURL());
		sb.append("/c/document_library/get_file?uuid=");
		sb.append(fileEntry.getUuid());
		sb.append("&groupId=");
		sb.append(themeDisplay.getScopeGroupId());
		return sb.toString();
	}
	

}
