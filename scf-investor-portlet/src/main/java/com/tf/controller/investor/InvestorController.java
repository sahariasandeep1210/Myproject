package com.tf.controller.investor;

import java.util.ArrayList;
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

import com.liferay.portal.kernel.log.Log;
import com.liferay.portal.kernel.log.LogFactoryUtil;
import com.liferay.portal.kernel.util.ParamUtil;
import com.liferay.portal.kernel.util.WebKeys;
import com.liferay.portal.theme.ThemeDisplay;
import com.tf.controller.investor.util.InvestorDTO;
import com.tf.model.Company;
import com.tf.model.InvestorPortfolio;
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
	protected ModelAndView renderInvestorInfo(@ModelAttribute("investorDTO")InvestorDTO  investorDTO,ModelMap model,RenderRequest request, RenderResponse response) throws Exception {		
		_log.info("Render Investor Protfolio");
		ThemeDisplay themeDisplay=(ThemeDisplay)request.getAttribute(WebKeys.THEME_DISPLAY);
		 List<InvestorPortfolio> investorPortfolioList=null;
		List<Company> companyList = new ArrayList<Company>();
		companyList = companyService.getCompanies("5");
		//long userId=userService.getUserbyLiferayUserID(themeDisplay.getUserId());
		Map<Long,List<InvestorPortfolio>>  map=investorService.getInvestorPortfolioByUserId(themeDisplay.getUserId());
		for(Map.Entry<Long, List<InvestorPortfolio>> entry : map.entrySet()){
			model.put("investorID", entry.getKey());
			investorPortfolioList=entry.getValue();
			model.put("investorHistoryList", investorPortfolioList);
			
		}
		companyList=prepareCompanyList(companyList,investorPortfolioList);
	
		//long companyId=investorService.getInvestorPortfolioByUserId(userId)
		/*investorModel=investorService.getInvestorByCompanyId(companyId);
		if(investorModel==null){
			investorModel=new InvestorPortfolio();
			investorModel.setMinDiscountRate(20);
			investorModel.setMaxDiscountRate(200);
		}else{
			//List<InvestorPortfolioHistory>  investorHistoryList=investorHistoryService.getInvestorHistory(investorModel.getInvestorId());
			//model.put("investorHistoryList", investorHistoryList);
		}
		model.put("investorModel", investorModel);*/
		model.put("investorDTO", investorDTO);		
		model.put("companyList", companyList);
		
		return new ModelAndView("investorprotfolio", model);		
	}
	
	private List<Company> prepareCompanyList(List<Company> companyList,
			List<InvestorPortfolio> investorPortfolioList) {
		for(InvestorPortfolio investorPortfolio: investorPortfolioList){
			companyList.remove(investorPortfolio.getCompany());
			
		}
		return companyList;
		
	}

	@ActionMapping(params="action=updateProtfolio")
	protected void add(@ModelAttribute("investorDTO")InvestorDTO  investorDTO, 
												 ModelMap model, 
												 ActionRequest request,
												 ActionResponse response) throws Exception {
		ThemeDisplay themeDisplay=(ThemeDisplay)request.getAttribute(WebKeys.THEME_DISPLAY);
		Company company=userService.getCompanybyUserID(themeDisplay.getUserId());
		
		long investorID=ParamUtil.get(request, "investorID", 0);
		System.out.println("investorID:::::"+investorID);
		System.out.println("investorModel:::::"+investorDTO);
		investorDTO.setInvestorModel(filterNullValues(investorDTO.getInvestorModel()));
		//setCompany(investorDTO,company);
		investorService.addInvestorPortfolios(investorDTO.getInvestorModel(), investorID);
		/*ThemeDisplay themeDisplay=(ThemeDisplay)request.getAttribute(WebKeys.THEME_DISPLAY);
		if(investorModel.getInvestor().getInvestorId()==null ){		
			long companyId=userService.getCompanyIDbyUserID(themeDisplay.getUserId());
			Company company=companyService.findById(companyId);
			if(company!=null){
				investorModel.setCompany(company);
				investorModel.setUpdatedBy(themeDisplay.getUser().getScreenName());
			}
			investorModel.setStartDate(new Date());
			investorService.save(investorModel);
		}else{
			InvestorPortfolio investor=investorService.findById(investorModel.getInvestor().getInvestorId());
			if(investorModel.getDiscountRate().intValue() !=investor.getDiscountRate().intValue() || investorModel.getCurrentCreditLine()!=investor.getCurrentCreditLine()){
				
				investorService.updatePortfiloDetails(investor,investorModel, themeDisplay.getUser().getScreenName());
				
				
			}
			
		}*/
		
	}	
	
	@ActionMapping(params="action=editProtfolio")
	protected void add(ModelMap model, 
												 ActionRequest request,
												 ActionResponse response) throws Exception {
		long profolioId= ParamUtil.getLong(request, "profolioId",0);
		String currentCreditLine =ParamUtil.getString(request, "currentCreditLine");
		String myCreditLine =ParamUtil.getString(request, "myCreditLine");
		String discountRate =ParamUtil.getString(request, "discountRate");
		System.out.println("profolioId:::"+profolioId);
		System.out.println("currentCreditLine:::"+currentCreditLine);
		System.out.println("myCreditLine:::"+myCreditLine);
		System.out.println("discountRate:::"+discountRate);
	}
	
	
	


	/**
	 * This method will discard InvestorPortfolio object which is having null Discount Rate.
	 * 
	 * @param 
	 * @return List<InvestorPortfolio>
	 */
	private List<InvestorPortfolio> filterNullValues(List<InvestorPortfolio> investorPortfolios) {
		List<InvestorPortfolio> updatedInvestorPortfolios=new ArrayList<InvestorPortfolio>();
		for(InvestorPortfolio investorPortfolio :investorPortfolios){
			if(investorPortfolio!=null && investorPortfolio.getDiscountRate()!=null){
				updatedInvestorPortfolios.add(investorPortfolio);
			}			
		}
		return updatedInvestorPortfolios;		
	}
	
	
}
