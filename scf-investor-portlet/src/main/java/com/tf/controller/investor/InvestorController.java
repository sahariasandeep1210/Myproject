package com.tf.controller.investor;

import java.io.IOException;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.portlet.ActionRequest;
import javax.portlet.ActionResponse;
import javax.portlet.RenderRequest;
import javax.portlet.RenderResponse;
import javax.portlet.ResourceRequest;
import javax.portlet.ResourceResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.portlet.ModelAndView;
import org.springframework.web.portlet.bind.annotation.ActionMapping;
import org.springframework.web.portlet.bind.annotation.RenderMapping;
import org.springframework.web.portlet.bind.annotation.ResourceMapping;

import com.liferay.portal.kernel.log.Log;
import com.liferay.portal.kernel.log.LogFactoryUtil;
import com.liferay.portal.kernel.util.ParamUtil;
import com.liferay.portal.kernel.util.WebKeys;
import com.liferay.portal.theme.ThemeDisplay;
import com.tf.controller.investor.util.InvestorDTO;
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
	private static final int MINDISCOUNT=20;
	private static final int MAXDISCOUNT=180;
	
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
		long investorId=0l;
		 List<InvestorPortfolio> investorPortfolioList=null;
		List<Company> companyList = new ArrayList<Company>();
		companyList = companyService.getCompanies("5");
		//long userId=userService.getUserbyLiferayUserID(themeDisplay.getUserId());
		Map<Long,List<InvestorPortfolio>>  map=investorService.getInvestorPortfolioByUserId(themeDisplay.getUserId());
		for(Map.Entry<Long, List<InvestorPortfolio>> entry : map.entrySet()){
			investorId=entry.getKey();
			model.put("investorID", investorId);
			investorPortfolioList=entry.getValue();		
		}
		Map<String,BigDecimal> totalsMap=investorService.getProtfolioTotals(investorId);
		Map<Long,BigDecimal> totalCreditMap=investorService.findTotalCreditLine(investorId);
		setTotalCreditLine(totalCreditMap,investorPortfolioList);
		companyList=prepareCompanyList(companyList,investorPortfolioList);
		model.put("investorHistoryList", investorPortfolioList);
	
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
		prepareDiscountList(model);
		model.put("totalsMap", totalsMap);	
		model.put("investorDTO", investorDTO);		
		model.put("companyList", companyList);
		
		return new ModelAndView("investorprotfolio", model);		
	}
	
	

	private void setTotalCreditLine(Map<Long, BigDecimal> totalCreditMap,
			List<InvestorPortfolio> investorPortfolioList) {
		for (InvestorPortfolio investorPortfolio :investorPortfolioList){
			investorPortfolio.setCurrentCreditLine(totalCreditMap.get(investorPortfolio.getCompany().getId()));
		}
		
	}



	private List<Company> prepareCompanyList(List<Company> companyList,
			List<InvestorPortfolio> investorPortfolioList) {
		for(InvestorPortfolio investorPortfolio: investorPortfolioList){
			if(!(BigDecimal.ZERO.compareTo(investorPortfolio.getMyCreditLine()) == 0 )){
				companyList.remove(investorPortfolio.getCompany());	
			}
					
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
		investorDTO.setInvestorModel(filterNullValues(investorDTO.getInvestorModel(),themeDisplay));
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
		ThemeDisplay themeDisplay=(ThemeDisplay)request.getAttribute(WebKeys.THEME_DISPLAY);
		InvestorPortfolio investorModel = new InvestorPortfolio();
		long profolioId= ParamUtil.getLong(request, "profolioId",0);
		BigDecimal currentCreditLine =new BigDecimal(ParamUtil.getString(request, "currentCreditLine","0"));
		BigDecimal myCreditLine =new BigDecimal(ParamUtil.getString(request, "myCreditLine","0"));
		int discountRate =ParamUtil.getInteger(request, "discountRate");
		investorModel.setCurrentCreditLine(currentCreditLine);
		investorModel.setMyCreditLine(myCreditLine);
		investorModel.setDiscountRate(discountRate);
		InvestorPortfolio investor=investorService.findById(profolioId);
		//if(discountRate !=investor.getDiscountRate().intValue() || currentCreditLine !=investor.getCurrentCreditLine() || myCreditLine!=investor.getMyCreditLine()){
		if(discountRate !=investor.getDiscountRate().intValue() || currentCreditLine.compareTo(investor.getCurrentCreditLine()) != 0 || myCreditLine.compareTo(investor.getMyCreditLine())!=0){
			
			investorService.updatePortfiloDetails(investor,investorModel, themeDisplay.getUser().getScreenName());
			
			
		}
		System.out.println("profolioId:::"+profolioId);
		System.out.println("currentCreditLine:::"+currentCreditLine);
		System.out.println("myCreditLine:::"+myCreditLine);
		System.out.println("discountRate:::"+discountRate);
	}
	
	@ResourceMapping("historyURL")
	public ModelAndView fetchHistory(ResourceRequest request, ResourceResponse response, ModelMap modelMap)throws IOException {
		long protfolioID = ParamUtil.getLong(request, "protfolioID",0);
		List<InvestorPortfolioHistory>  investorHistoryList=investorHistoryService.getInvestorHistory(protfolioID);
		modelMap.put("investorHistoryList", investorHistoryList);
		modelMap.put("protfolioID", protfolioID);
		return new ModelAndView("investorprotfoliohistory");
	}
	
	
	


	/**
	 * This method will discard InvestorPortfolio object which is having null Discount Rate.
	 * 
	 * @param 
	 * @return List<InvestorPortfolio>
	 */
	private List<InvestorPortfolio> filterNullValues(List<InvestorPortfolio> investorPortfolios,ThemeDisplay themeDisplay) {
		List<InvestorPortfolio> updatedInvestorPortfolios=new ArrayList<InvestorPortfolio>();
		for(InvestorPortfolio investorPortfolio :investorPortfolios){
			if(investorPortfolio!=null && investorPortfolio.getDiscountRate()!=null && investorPortfolio.getMyCreditLine()!=null && investorPortfolio.getCurrentCreditLine()!=null){
				investorPortfolio.setMinDiscountRate(MINDISCOUNT);
				investorPortfolio.setMaxDiscountRate(MAXDISCOUNT);
				investorPortfolio.setAvailToInvest(investorPortfolio.getMyCreditLine());
				investorPortfolio.setStartDate(new Date());
				investorPortfolio.setUpdatedBy(themeDisplay.getUser().getScreenName());
				updatedInvestorPortfolios.add(investorPortfolio);
			}			
		}
		return updatedInvestorPortfolios;		
	}
	
	/**
	 * @param model
	 */
	private void prepareDiscountList(ModelMap model) {
		List<Integer> list=new ArrayList<Integer>();
		int i=MINDISCOUNT;
		while( i<=MAXDISCOUNT){
			list.add(i);
			i=i+5;
		}
		model.put("discountList", list);
	}
	
	
}
