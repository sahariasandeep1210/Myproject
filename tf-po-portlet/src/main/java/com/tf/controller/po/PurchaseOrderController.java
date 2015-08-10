package com.tf.controller.po;

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

import com.liferay.portal.kernel.log.Log;
import com.liferay.portal.kernel.log.LogFactoryUtil;
import com.tf.model.PurchaseOrderModel;
import com.tf.service.PurchaseOrderService;


@Controller
@RequestMapping(value = "VIEW")
public class PurchaseOrderController {
	
	protected Log _log = LogFactoryUtil.getLog(PurchaseOrderController.class.getName());
	
	@Autowired
	private PurchaseOrderService purchaseOrderService;
	
	@RenderMapping
	protected ModelAndView defaultRender(ModelMap model,RenderRequest request, RenderResponse response) throws Exception {		
		_log.info("Render PO Order");
		return new ModelAndView("purchaseorder", model);		
	}
	
	@RenderMapping(params="render=addPurchaseOrder")	
	protected ModelAndView addPurchaseOrder(@ModelAttribute("purchaseOrderModel") PurchaseOrderModel purchaseOrderModel, ModelMap model,RenderRequest request, RenderResponse response) throws Exception {	
		_log.info("Render Add Purchase Order");
		model.put("purchaseOrderModel",purchaseOrderModel);
		return new ModelAndView("createpurchaseorder", model);	
	} 
	
	@ActionMapping(params="action=addPurchaseOrder")
	protected void addPurchaseOrder(@ModelAttribute("purchaseOrderModel") PurchaseOrderModel purchaseOrderModel, 
												 ModelMap map, 
												 ActionRequest request,
												 ActionResponse response) throws Exception {
		_log.info("Render Add Purchase Order Action");
		_log.info("purchaseOrderModel>>>>>>>>>>>>>>>"+purchaseOrderModel);
		purchaseOrderModel=purchaseOrderService.addPO(purchaseOrderModel);
		map.put("create", "success");
		map.put("purchaseOrderModel",purchaseOrderModel);
		response.setRenderParameter("render", "addPurchaseOrder");
		
	}
	

}
