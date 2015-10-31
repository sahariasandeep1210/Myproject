package com.tf.controller.investor;

import javax.portlet.RenderRequest;
import javax.portlet.RenderResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.portlet.ModelAndView;
import org.springframework.web.portlet.bind.annotation.RenderMapping;

import com.liferay.portal.kernel.log.Log;
import com.liferay.portal.kernel.log.LogFactoryUtil;
import com.tf.model.InvestorPortfolio;

/**
 * This controller is responsible for request/response handling on
 * Investor screens
 * 
 * @author Gautam Sharma
 * 
 */
@Controller
@RequestMapping(value = "VIEW")
public class InvestorController {
	
	protected Log _log = LogFactoryUtil.getLog(InvestorController.class);
	
	@RenderMapping
	protected ModelAndView renderCompanyList(@ModelAttribute("investorModel")InvestorPortfolio  investorModel,ModelMap model,RenderRequest request, RenderResponse response) throws Exception {		
		_log.info("Render Investor Protfolio");
		
		return new ModelAndView("investorprotfolio", model);		
	}
	
	
}
