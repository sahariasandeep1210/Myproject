package com.tf.controller.trade;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

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
import com.liferay.portal.kernel.util.WebKeys;
import com.liferay.portal.security.permission.PermissionChecker;
import com.liferay.portal.theme.ThemeDisplay;
import com.tf.controller.SCFTradeDTO;
import com.tf.model.Company;
import com.tf.model.SCFTrade;
import com.tf.persistance.util.TradeStatus;
import com.tf.service.CompanyService;
import com.tf.service.InvoiceService;
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
	
	@Autowired
	private InvoiceService invoiceService;
	
	@Autowired
	private CompanyService companyService;
	
	@RenderMapping
	protected ModelAndView renderInvoiceList(ModelMap model,
			RenderRequest request, RenderResponse response) throws Exception {
		List<SCFTrade> scftrades=null;
		ThemeDisplay themeDisplay = (ThemeDisplay)request.getAttribute(WebKeys.THEME_DISPLAY);
		PermissionChecker permissionChecker = themeDisplay.getPermissionChecker();
		if(permissionChecker.isOmniadmin() ){
			scftrades=scfTradeService.getScfTrades();
		}else{
			scftrades=new ArrayList<SCFTrade>();
		}		 
		model.put("trades", scftrades);
		return new ModelAndView("tradelist", model);
	}
	
	@RenderMapping(params="render=createTrade")
	protected ModelAndView renderCreateTrade(@ModelAttribute("scfTradeModel") SCFTradeDTO scfTrade,ModelMap model,RenderRequest request, RenderResponse response) throws Exception {	
		long tradeID = ParamUtil.getLong(request, "tradeID"); 
		Long companyId = ParamUtil.getLong(request, "companyId"); 
		String invoiceIds= ParamUtil.getString(request, "invoices");
		System.out.println("tradeIds::::"+invoiceIds);
		Map<Company,BigDecimal> invoiceMap = invoiceService.getInvoicesAmount(invoiceIds);
		Map.Entry<Company,BigDecimal> entry = invoiceMap.entrySet().iterator().next();
		System.out.println("invoicesAmount::::"+entry.getValue());
		scfTrade.setTradeAmount(entry.getValue());
		scfTrade.setCompany(entry.getKey());
		model.put("scfTradeModel", scfTrade);
		model.put("invoiceIds", invoiceIds);
		return new ModelAndView("createscftrade", model);
	}
	
	@ActionMapping(params="action=saveTrade")
	protected void saveTarde(@ModelAttribute("scfTradeModel") SCFTradeDTO scfTradeDTO, 
												 ModelMap model, 
												 ActionRequest request,
												 ActionResponse response) throws Exception{
		Long companyID = ParamUtil.getLong(request, "companyID"); 
		Company company=companyService.findById(companyID);
		scfTradeDTO.setCompany(company);
		SCFTrade scfTrade=transformTOScfTrade(scfTradeDTO);
		scfTrade.setStatus(TradeStatus.NEW.getValue());
		scfTrade=scfTradeService.save(scfTrade);
		System.out.println("scf Trade-----"+scfTradeDTO);		
	}

	private SCFTrade transformTOScfTrade(SCFTradeDTO scfTradeDTO) {
		SCFTrade scfTrade =new SCFTrade();
		scfTrade.setClosingDate(scfTradeDTO.getClosingDate());
		scfTrade.setCompany(scfTradeDTO.getCompany());
		scfTrade.setCreateDate(new Date());
		scfTrade.setDuration(scfTradeDTO.getDuration());
		scfTrade.setInvestorPaymentDate(scfTradeDTO.getInvestorPaymentDate());
		scfTrade.setOpeningDate(scfTradeDTO.getOpeningDate());
		scfTrade.setPromisoryNote(scfTradeDTO.getPromisoryNote());
		scfTrade.setScfTrade(scfTradeDTO.getScfTrade());
		scfTrade.setSellerPaymentDate(scfTradeDTO.getSellerPaymentDate());
		scfTrade.setStatus(scfTradeDTO.getStatus());
		scfTrade.setTradeAmount(scfTradeDTO.getTradeAmount());
		scfTrade.setTradeNotes(scfTradeDTO.getTradeNotes());
		scfTrade.setTradeSettled(scfTradeDTO.getTradeSettled());
		scfTrade.setWantToInsure(scfTradeDTO.getWantToInsure());
		scfTrade.setInvoices(invoiceService.getInvoices(scfTradeDTO.getInvoiceIds()));
		return scfTrade;
	}

}
