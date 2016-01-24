package com.tf.controller.investor;

import java.io.IOException;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.portlet.ActionRequest;
import javax.portlet.ActionResponse;
import javax.portlet.PortletRequest;
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
import com.liferay.portal.security.permission.PermissionChecker;
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
	private static final int MINDISCOUNT=400;
	private static final int MAXDISCOUNT=600;
	
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
		 String viewName=prepareInvestorProtfolioInformation(request,investorDTO, model, themeDisplay,
				investorId, investorPortfolioList);		
		prepareDiscountList(model);
		return new ModelAndView(viewName, model);		
	}



	private String prepareInvestorProtfolioInformation(RenderRequest request,InvestorDTO investorDTO,
			ModelMap model, ThemeDisplay themeDisplay, long investorId,
			List<InvestorPortfolio> investorPortfolioList) {
		String viewName="investorprotfolio";
		if(getPermissionChecker(request).isOmniadmin() ){
			List<InvestorPortfolio> list =investorService.findAllInvestorProtFolios();
			model.put("investorList", list);	
			viewName="allinvestorprotfolios";
		}else{
			List<Company> companyList = new ArrayList<Company>();
			companyList = companyService.getCompanies("5");
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
			
			model.put("totalsMap", totalsMap);	
			model.put("investorDTO", investorDTO);		
			model.put("companyList", companyList);
		}
		return viewName;
		
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
		long investorID=ParamUtil.get(request, "investorID", 0);
		investorDTO.setInvestorModel(filterNullValues(investorDTO.getInvestorModel(),themeDisplay));
		investorService.addInvestorPortfolios(investorDTO.getInvestorModel(), investorID);	
		
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
		if(discountRate !=investor.getDiscountRate().intValue()  || myCreditLine.compareTo(investor.getMyCreditLine())!=0){	
			updateAvailtoInvest(investor,investorModel);
			investorService.updatePortfiloDetails(investor,investorModel, themeDisplay.getUser().getScreenName());		
		}		
	}
	
	private void updateAvailtoInvest(InvestorPortfolio investor,
			InvestorPortfolio investorModel) {
		if(investor.getAmountInvested()!=null){			
			investorModel.setAvailToInvest(investorModel.getMyCreditLine().subtract(investor.getAmountInvested()));
		}else{
			investorModel.setAvailToInvest(investorModel.getMyCreditLine());
		}
		
	}



	@ResourceMapping("historyURL")
	public ModelAndView fetchHistory(ResourceRequest request, ResourceResponse response, ModelMap modelMap)throws IOException {
		long protfolioID = ParamUtil.getLong(request, "protfolioID",0);
		List<InvestorPortfolioHistory>  investorHistoryList=investorHistoryService.getInvestorHistory(protfolioID);
		modelMap.put("investorHistoryList", investorHistoryList);
		modelMap.put("protfolioID", protfolioID);
		return new ModelAndView("investorprotfoliohistory");
	}
	
	
	@ResourceMapping("crtLinebreakdownURL")
	public ModelAndView crtLinebreakdown(ResourceRequest request, ResourceResponse response, ModelMap modelMap)throws IOException {
		long scfcompany = ParamUtil.getLong(request, "scfcompany",0); 
		long investorID = ParamUtil.getLong(request, "investorID",0);
		Company company=companyService.findById(scfcompany);
		List<InvestorPortfolio>  investorList=investorService.findTotalCreditLineBreakDown(scfcompany);
		modelMap.put("investorList", investorList);
		modelMap.put("scfCompany", company.getName());
		modelMap.put("investorID", investorID);
		return new ModelAndView("investorprotfoliobreak");
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
			if(investorPortfolio!=null && investorPortfolio.getDiscountRate()!=null && investorPortfolio.getMyCreditLine()!=null){
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
			i=i+10;
		}
		model.put("discountList", list);
	}
	
	
	private PermissionChecker getPermissionChecker(PortletRequest request){
		ThemeDisplay themeDisplay = (ThemeDisplay)request.getAttribute(WebKeys.THEME_DISPLAY);
		PermissionChecker permissionChecker = themeDisplay.getPermissionChecker();
		return permissionChecker;	
	}
	
	
	
}
