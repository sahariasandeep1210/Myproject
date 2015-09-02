package com.tf.controller.trade;

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

import com.liferay.portal.kernel.util.ParamUtil;
import com.tf.model.SCFTrade;
import com.tf.service.SCFTradeService;

/**
 * This controller is responsible for request/response handling on
 * SCF Trade  screens
 * 
 * @author Gautam Sharma
 * 
 */
@Controller
@RequestMapping(value = "VIEW")
public class SCFTradeController {
	
	
	@Autowired
	private SCFTradeService scfTradeService;
	
	@RenderMapping
	protected ModelAndView renderInvoiceList(
			@ModelAttribute("scfTradeModel") SCFTrade scfTrade, ModelMap model,
			RenderRequest request, RenderResponse response) throws Exception {
		System.out.println("SCFTradeController.renderInvoiceList() ----------------------");
		List<SCFTrade> scftrades=scfTradeService.getScfTrades();
		model.put("trades", scftrades);
		return new ModelAndView("tradelist", model);
	}
	
	@RenderMapping(params="render=createTrade")
	protected ModelAndView renderCreateTrade(@ModelAttribute("scfTradeModel") SCFTrade scfTrade,ModelMap model,RenderRequest request, RenderResponse response) throws Exception {	
		long tradeID = ParamUtil.getLong(request, "tradeID"); 
		model.put("scfTradeModel", scfTrade);		
		return new ModelAndView("createscftrade", model);
	}
	
	@ActionMapping(params="action=createTrade")
	protected void saveTarde(@ModelAttribute("scfTradeModel") SCFTrade scfTrade, 
												 ModelMap model, 
												 ActionRequest request,
												 ActionResponse response) throws Exception{
		
		System.out.println("scf Trade-----"+scfTrade);
		System.out.println("File-----"+scfTrade.getInsuranceDoc().getName());
		
	}

}
