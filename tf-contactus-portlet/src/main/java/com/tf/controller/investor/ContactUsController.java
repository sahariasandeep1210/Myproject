package com.tf.controller.investor;

import javax.portlet.RenderRequest;
import javax.portlet.RenderResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.portlet.ModelAndView;
import org.springframework.web.portlet.bind.annotation.RenderMapping;

import com.liferay.portal.kernel.log.Log;
import com.liferay.portal.kernel.log.LogFactoryUtil;

/**
 * This controller is responsible for request/response handling on
 * Contact US screens
 * 
 * @author Gautam Sharma
 * 
 */
@Controller
@RequestMapping(value = "VIEW")
public class ContactUsController {
	
	protected Log _log = LogFactoryUtil.getLog(ContactUsController.class);
	
	
	@RenderMapping
	protected ModelAndView renderInvestorInfo(ModelMap model,RenderRequest request, RenderResponse response) throws Exception {		
		_log.info("Render Contact Us");
		
		return new ModelAndView("view", model);		
	}



	
}
