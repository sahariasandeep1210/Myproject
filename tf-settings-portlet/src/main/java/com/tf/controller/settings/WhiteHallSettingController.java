package com.tf.controller.settings;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

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

import com.google.gson.Gson;
import com.liferay.portal.kernel.log.Log;
import com.liferay.portal.kernel.log.LogFactoryUtil;
import com.liferay.portal.kernel.servlet.SessionErrors;
import com.liferay.portal.kernel.util.ParamUtil;
import com.tf.dto.InvestorModel;
import com.tf.model.Company;
import com.tf.model.GeneralSetting;
import com.tf.model.SellerSetting;
import com.tf.model.SellerSettingModel;
import com.tf.persistance.util.CompanyTypes;
import com.tf.persistance.util.InvestorDTO;
import com.tf.service.CompanyService;
import com.tf.service.GeneralSettingService;
import com.tf.service.InvestorService;
import com.tf.service.SettingService;

/**
 * This controller is responsible for request/response handling on
 * Whitehall settings screens
 * 
 * @author Gautam Sharma
 * 
 */
@Controller
@RequestMapping(value = "VIEW")
public class WhiteHallSettingController {
	
	private static final String INVESTOR 					= "investor";
	private static final String GENERAL_SETTINGS 			= "generalsetting";
	private static final String SELLER 						= "seller";
	private static final String SCF_COMPANY 				= "scfCompany";
	private  final static String ACTIVETAB			 		="activetab";	
	protected Log _log 										= LogFactoryUtil.getLog(WhiteHallSettingController.class);
	
	@Autowired
	private InvestorService investorService;
	
	@Autowired
	private SettingService settingService;
	
	@Autowired
	private CompanyService companyService;
	@Autowired
	private GeneralSettingService generalSettingService;

	
	
	@RenderMapping(params = "render=generalsetting")
	protected ModelAndView renderGenraletings(@ModelAttribute("generalSettingModel")GeneralSetting  generalSettingModel,ModelMap model,RenderRequest request, RenderResponse response) throws Exception {		
		_log.info("Render WhiteHall Settings Screen");
		try {			
			GeneralSetting generalSetting=generalSettingService.getGeneralSetting();
			model.put(ACTIVETAB, GENERAL_SETTINGS);
			model.put("generalSetting", generalSetting);
		} catch (Exception e) {
			SessionErrors.add(request, "default-error-message");
			_log.error("WhiteHallSettingController.renderSellerSetings() - error occured while rendering Whitehall Settings Screen"+e.getMessage());
		}
		return new ModelAndView(GENERAL_SETTINGS, model);		
	}
	
	@RenderMapping
	protected ModelAndView renderInvestorSettings(@ModelAttribute("investorModel")InvestorModel  investorModel,ModelMap model,RenderRequest request, RenderResponse response) throws Exception {		
		_log.info("Render WhiteHall Settings Screen");
		try {
			List<InvestorDTO> investorList=investorService.getInvestorDetails();
			model.put("investorList", investorList);
			model.put(ACTIVETAB, INVESTOR);
			model.put("investorModel", investorModel);	
		} catch (Exception e) {
			SessionErrors.add(request, "default-error-message");
			_log.error("WhiteHallSettingController.renderWhitehallSettings() - error occured while rendering Whitehall Settings Screen"+e.getMessage());
		}
		return new ModelAndView(INVESTOR, model);		
	}
	
	@ActionMapping(params="action=saveInvestorSettings")
	protected void updateInvestorSettings(@ModelAttribute("investorModel")InvestorModel  investorModel,
												 ModelMap model, 
												 ActionRequest request,
												 ActionResponse response) throws Exception {
		investorService.updateInvestorDetails(investorModel.getInvestorDTO());		
		response.setRenderParameter("render", "investorSettings");
		
	}
	
	@ActionMapping(params="action=saveGeneralSettings")
	protected void saveGeneralSettings(@ModelAttribute("generalSettingModel")GeneralSetting  generalSettingModel,
												 ModelMap model,
												 ActionRequest request,
												 ActionResponse response) throws Exception {
		generalSettingService.saveGeneralSettings(generalSettingModel);
		
		response.setRenderParameter("render", "generalSettings");
		
	}
	
	@RenderMapping(params = "render=sellerSetings")
	protected ModelAndView renderSellerSetings(@ModelAttribute("sellerDTO")SellerSetting  sellerDTO,ModelMap model,RenderRequest request, RenderResponse response) throws Exception {		
		_log.info("Render WhiteHall Settings Screen");

		try {			
			
			List<Company> companyList = new ArrayList<Company>();
			companyList=companyService.getSellerCompaniesUsingJoinForAdmin();
			List<SellerSettingModel> sellerSettings=settingService.getSellersSettingUsingJoin();				
			model.put("sellerSettings", sellerSettings);
			model.put("companyList", companyList);
            model.put(ACTIVETAB, SELLER);	

		} catch (Exception e) {
			SessionErrors.add(request, "default-error-message");
			_log.error("WhiteHallSettingController.renderSellerSetings() - error occured while rendering Whitehall Settings Screen"+e.getMessage());
		}
		return new ModelAndView(SELLER, model);		
	}
	
	@ActionMapping(params="action=saveSellerSettings")
	protected void saveSellerSettings(@ModelAttribute("sellerDTO")SellerSetting  sellerDTO,
												 ModelMap model, 
												 ActionRequest request,
												 ActionResponse response) throws Exception {		
		long companyId=ParamUtil.getLong(request, "sellerCompany",0l);		
		if(companyId!=0){
			SellerSetting sellerSetting =settingService.getSellerSetting(companyId);
			if(sellerSetting ==null){
		    	//create scenario
				sellerSetting = new SellerSetting();
				sellerSetting.setCompany(companyService.loadById(companyId));
				sellerSetting.setCreateDate(new Date());
				sellerSetting.setSellerTransFee(sellerDTO.getSellerTransFee());
				sellerSetting.setSellerFinFee(sellerDTO.getSellerFinFee());
		    	settingService.saveSellerSettings(sellerSetting);
		     }
		    else{
		    	//update scenario
		    	sellerSetting.setSellerTransFee(sellerDTO.getSellerTransFee());
		    	sellerSetting.setSellerFinFee(sellerDTO.getSellerFinFee());
		    	sellerSetting.setUpdateDate(new Date());
		        settingService.saveSellerSettings(sellerSetting);
		        }
		}
		model.put("sellerCompany",companyId);
	    response.setRenderParameter("render", "sellerSetings");
	}
	

	@ResourceMapping
    public void fetchSettings(ResourceRequest request, ResourceResponse response)throws IOException {
	

		long userSelection =Long.valueOf(ParamUtil.getString(request, "userSelection",""));
		String settingmodel=null;
		try {
		SellerSetting sellerList = settingService.getSellerSetting(userSelection);
		if(sellerList!=null){
			SellerSetting cloneSellerList = new SellerSetting();
			cloneSellerList.setId(sellerList.getId());
			cloneSellerList.setSellerFinFee(sellerList.getSellerFinFee());
			cloneSellerList.setSellerTransFee(sellerList.getSellerTransFee());
			Gson gson=new Gson();
		    settingmodel=gson.toJson(cloneSellerList);
		    response.getWriter().println(settingmodel);		
		}	   
		} catch (Exception e) {
			_log.error("Error occured while fetchSettings"+e.getMessage());
			response.setProperty(ResourceResponse.HTTP_STATUS_CODE, "400");
		}
		
	}	
	
}
