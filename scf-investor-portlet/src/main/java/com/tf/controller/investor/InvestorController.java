package com.tf.controller.investor;

import java.util.Date;
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

import com.liferay.portal.kernel.log.Log;
import com.liferay.portal.kernel.log.LogFactoryUtil;
import com.liferay.portal.kernel.util.WebKeys;
import com.liferay.portal.theme.ThemeDisplay;
import com.tf.model.Company;
import com.tf.model.InvestorPortfolio;
import com.tf.model.InvestorPortfolioHistory;
import com.tf.service.CompanyService;
import com.tf.service.InvestorHistoryService;
import com.tf.service.InvestorService;
import com.tf.service.UserService;

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
	
	@Autowired
	protected  UserService userService; 
	
	@Autowired
	protected  InvestorService investorService;
	
	@Autowired
	protected  CompanyService companyService; 
	
	@Autowired
	protected  InvestorHistoryService investorHistoryService; 
	
	@RenderMapping
	protected ModelAndView renderCompanyList(@ModelAttribute("investorModel")InvestorPortfolio  investorModel,ModelMap model,RenderRequest request, RenderResponse response) throws Exception {		
		_log.info("Render Investor Protfolio");
		ThemeDisplay themeDisplay=(ThemeDisplay)request.getAttribute(WebKeys.THEME_DISPLAY);
		//long userId=userService.getUserbyLiferayUserID(themeDispay.getUserId());
		long companyId=userService.getCompanyIDbyUserID(themeDisplay.getUserId());
		investorModel=investorService.getInvestorByCompanyId(companyId);
		if(investorModel==null){
			investorModel=new InvestorPortfolio();
			investorModel.setMinDiscountRate(20);
			investorModel.setMaxDiscountRate(200);
		}else{
			List<InvestorPortfolioHistory>  investorHistoryList=investorHistoryService.getInvestorHistory(investorModel.getInvestorId());
			model.put("investorHistoryList", investorHistoryList);
		}
		model.put("investorModel", investorModel);
		return new ModelAndView("investorprotfolio", model);		
	}
	
	@ActionMapping(params="action=updateProtfolio")
	protected void add(@ModelAttribute("investorModel")InvestorPortfolio  investorModel, 
												 ModelMap model, 
												 ActionRequest request,
												 ActionResponse response) throws Exception {
		System.out.println("investorModel:::::"+investorModel);
		ThemeDisplay themeDisplay=(ThemeDisplay)request.getAttribute(WebKeys.THEME_DISPLAY);
		if(investorModel.getInvestorId()==null ){		
			long companyId=userService.getCompanyIDbyUserID(themeDisplay.getUserId());
			Company company=companyService.findById(companyId);
			if(company!=null){
				investorModel.setCompanyId(company);
				investorModel.setUpdatedBy(themeDisplay.getUser().getScreenName());
			}
			investorModel.setStartDate(new Date());
			investorService.save(investorModel);
		}else{
			InvestorPortfolio investor=investorService.findById(investorModel.getInvestorId());
			if(investorModel.getDiscountRate().intValue() !=investor.getDiscountRate().intValue() || investorModel.getInvestmentCap()!=investor.getInvestmentCap()){
				
				investorService.updatePortfiloDetails(investor,investorModel, themeDisplay.getUser().getScreenName());
				
				
			}
			
		}
		
	}
	
	
}
