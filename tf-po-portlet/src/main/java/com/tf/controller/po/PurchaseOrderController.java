package com.tf.controller.po;

import java.util.List;

import javax.portlet.ActionRequest;
import javax.portlet.ActionResponse;
import javax.portlet.RenderRequest;
import javax.portlet.RenderResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.portlet.ModelAndView;
import org.springframework.web.portlet.bind.annotation.ActionMapping;
import org.springframework.web.portlet.bind.annotation.RenderMapping;

import com.liferay.portal.kernel.exception.PortalException;
import com.liferay.portal.kernel.exception.SystemException;
import com.liferay.portal.kernel.log.Log;
import com.liferay.portal.kernel.log.LogFactoryUtil;
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
import com.tf.model.PurchaseOrderModel;
import com.tf.po.model.PurchaseOrderDTO;
import com.tf.service.PurchaseOrderService;


@Controller
@RequestMapping(value = "VIEW")
public class PurchaseOrderController {
	
	protected Log _log = LogFactoryUtil.getLog(PurchaseOrderController.class.getName());
	
	private static final String PO_FOLDER_NAME = "Purchase Orders";
	
	@Autowired
	private PurchaseOrderService purchaseOrderService;
	
	@RenderMapping
	protected ModelAndView defaultRender(ModelMap model,RenderRequest request, RenderResponse response) throws Exception {		
		_log.info("Render PO Order");
		return new ModelAndView("purchaseorder", model);		
	}
	
	@RenderMapping(params="render=addPurchaseOrder")	
	protected ModelAndView addPurchaseOrder(@ModelAttribute("purchaseOrderDTO") PurchaseOrderDTO purchaseOrderDTO, ModelMap model,RenderRequest request, RenderResponse response) throws Exception {	
		_log.info("Render Add Purchase Order");
		model.put("purchaseOrderDTO",purchaseOrderDTO);
		return new ModelAndView("createpurchaseorder", model);	
	} 
	
	@ActionMapping(params="action=addPurchaseOrder")
	protected void addPurchaseOrder(@ModelAttribute("purchaseOrderDTO") PurchaseOrderDTO purchaseOrderDTO, 									
												 ModelMap map, 
												 ActionRequest request,
												 ActionResponse response) throws Exception {
		_log.info("Render Add Purchase Order Action");
		_log.info("purchaseOrderModel>>>>>>>>>>>>>>>"+purchaseOrderDTO);
		boolean uploadDoc=ParamUtil.getBoolean(request, "uploadDocments",false);
		System.out.println("uploadDoc:::::"+uploadDoc);
		if(uploadDoc){
			uploadDocument(map,request,purchaseOrderDTO.getId(),purchaseOrderDTO);
			
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
		
		response.setRenderParameter("render", "addPurchaseOrder");
		
	}

	private PurchaseOrderModel transformPoDTOtoPoModel(PurchaseOrderDTO purchaseOrderDTO) {
		PurchaseOrderModel purchaseOrderModel =new PurchaseOrderModel();
		purchaseOrderModel.setId(purchaseOrderDTO.getId());
		purchaseOrderModel.setSellerId(purchaseOrderDTO.getSellerId());
		purchaseOrderModel.setDebtorCompany(purchaseOrderDTO.getDebtorCompany());
		purchaseOrderModel.setPoNumber(purchaseOrderDTO.getPoNumber());
		purchaseOrderModel.setPoDate(purchaseOrderDTO.getPoDate());
		purchaseOrderModel.setPoAmount(purchaseOrderDTO.getPoAmount());
		purchaseOrderModel.setPoDays(purchaseOrderDTO.getPoDays());
		purchaseOrderModel.setPoNotes(purchaseOrderDTO.getPoNotes());
		return purchaseOrderModel;
	}
	
	private PurchaseOrderDTO transformPoModelToPoDTO(PurchaseOrderModel purchaseOrderModel) {
		PurchaseOrderDTO purchaseOrderDTO =new PurchaseOrderDTO();
		purchaseOrderDTO.setId(purchaseOrderModel.getId());
		purchaseOrderDTO.setSellerId(purchaseOrderModel.getSellerId());
		purchaseOrderDTO.setDebtorCompany(purchaseOrderModel.getDebtorCompany());
		purchaseOrderDTO.setPoNumber(purchaseOrderModel.getPoNumber());
		purchaseOrderDTO.setPoDate(purchaseOrderModel.getPoDate());
		purchaseOrderDTO.setPoAmount(purchaseOrderModel.getPoAmount());
		purchaseOrderDTO.setPoDays(purchaseOrderModel.getPoDays());
		purchaseOrderDTO.setPoNotes(purchaseOrderModel.getPoNotes());
		return purchaseOrderDTO;
	}

	private void uploadDocument(ModelMap map, ActionRequest request,Long poID,PurchaseOrderDTO purchaseOrderDTO) {
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
        try {
        	 folder = DLAppServiceUtil.getFolder(
        			currentSideID, parentFolderId, poID.toString());
        	} catch(NoSuchFolderException e) {
        		folder=createPoFolder(request, poID, currentSideID, parentFolderId,
        				poFolderId, repositoryId);
        	} catch (PortalException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SystemException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
        addFilestoFolder(themeDisplay,purchaseOrderDTO,folder.getFolderId(),request);
        
        
        
		
	}

	private void addFilestoFolder(ThemeDisplay themeDisplay,PurchaseOrderDTO purchaseOrderDTO,Long folderId,ActionRequest request) {
		try { 
			
				 ServiceContext serviceContext = ServiceContextFactory.getInstance(DLFileEntry.class.getName(), request); 
				 String mimeType = MimeTypesUtil.getContentType(purchaseOrderDTO.getInsuranceDoc().getInputStream(), purchaseOrderDTO.getInsuranceDoc().getName());
				 StringBuilder fileName=new StringBuilder(folderId.toString());
				 fileName.append("_")
				 .append(purchaseOrderDTO.getInsuranceDoc().getOriginalFilename());
				 DLAppServiceUtil.addFileEntry(themeDisplay.getScopeGroupId(), folderId, fileName.toString(), mimeType, fileName.toString(), fileName.toString(), "upload", purchaseOrderDTO.getInsuranceDoc().getInputStream(), purchaseOrderDTO.getInsuranceDoc().getSize(), serviceContext); 
			 } catch (Exception e) { 
				 System.out.println("Exception"); e.printStackTrace(); 
				} 
		
	}

	private Folder createPoFolder(ActionRequest request, Long poID,
			long currentSideID, long parentFolderId, long poFolderId,
			long repositoryId) {
		List<Folder> lFolder;
		Folder folder=null;
		try{
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
        	
        }catch (PortalException e) {				
			e.printStackTrace();
		} catch (SystemException e) {
			e.printStackTrace();
		}
		return folder;
	}
	

}
