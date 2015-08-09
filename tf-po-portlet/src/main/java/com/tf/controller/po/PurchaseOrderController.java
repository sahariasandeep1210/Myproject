package com.tf.controller.po;

import javax.portlet.RenderRequest;
import javax.portlet.RenderResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.portlet.ModelAndView;
import org.springframework.web.portlet.bind.annotation.RenderMapping;

import com.liferay.portal.kernel.log.Log;
import com.liferay.portal.kernel.log.LogFactoryUtil;


@Controller
@RequestMapping(value = "VIEW")
public class PurchaseOrderController {
	
	protected Log _log = LogFactoryUtil.getLog(PurchaseOrderController.class.getName());
	
	@RenderMapping
	protected ModelAndView defaultRender(ModelMap model,RenderRequest request, RenderResponse response) throws Exception {		
		_log.info("Render PO Order");
		return new ModelAndView("purchaseorder", model);		
	}
	

}
