package com.tf.controller.settings;

import com.google.gson.Gson;
import com.liferay.portal.kernel.log.Log;
import com.liferay.portal.kernel.log.LogFactoryUtil;
import com.liferay.portal.kernel.servlet.SessionErrors;
import com.liferay.portal.kernel.util.JavaConstants;
import com.liferay.portal.kernel.util.ParamUtil;
import com.tf.dto.InvestorModel;
import com.tf.model.Company;
import com.tf.model.GeneralSetting;
import com.tf.model.SellerSetting;
import com.tf.persistance.util.CompanyTypes;
import com.tf.persistance.util.InvestorDTO;
import com.tf.service.CompanyService;
import com.tf.service.GeneralSettingService;
import com.tf.service.InvestorService;
import com.tf.service.SettingService;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.portlet.ActionRequest;
import javax.portlet.ActionResponse;
import javax.portlet.PortletConfig;
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
			model.put(ACTIVETAB, GENERAL_SETTINGS);
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

			String companyType = CompanyTypes.SELLER.getValue();			
			companyList = companyService.getCompanies(companyType);
			

			companyList=companyService.getCompanies(CompanyTypes.SELLER.getValue());
			List<SellerSetting> sellerSettings=settingService.getSellersSetting();				
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
	   /*SellerSetting sellerSetting;
	   long companyId=ParamUtil.getLong(request, "sellerCompany");
	   SellerSetting sellerLists = settingService.getSellerSetting(companyId);
	   List<SellerSetting> sellers=settingService.getSellerList(companyId);
 
	   if(null==sellerLists.getId()){
	   
		   sellerDTO.setCompany(companyService.loadById(companyId));
		   sellerDTO.setCreateDate(new Date());
	       settingService.saveSellerSettings(sellerDTO);
	    }
	   else{
		   System.out.println("DDDDDD"+sellerLists.getId());
		   sellerSetting=settingService.findBySellerId(sellerLists.getId());
		   sellerSetting.setUpdateDate(new Date());
		   settingService.updateSellerSettings(sellerSetting);
	   }*/
		SellerSetting sellerLists=null;
		long companyId=ParamUtil.getLong(request, "sellerCompany");
	    SellerSetting sellerList = settingService.getSellerSetting(companyId);
	    System.out.println("12:"+sellerDTO);
	    if(null == sellerList){
		    System.out.println("123:"+sellerDTO);

	     sellerLists = new SellerSetting();
	     sellerLists.setCompany(companyService.loadById(companyId));
	     sellerLists.setCreateDate(new Date());
	    sellerLists.setSellerTransFee(sellerDTO.getSellerTransFee());
	    sellerLists.setSellerFinFee(sellerDTO.getSellerFinFee());
	     settingService.saveSellerSettings(sellerLists);
	     }
	    else{
		    System.out.println("124:"+sellerDTO);

	    	sellerLists=settingService.findBySellerId(sellerList.getId());
	    	sellerLists.setSellerTransFee(sellerDTO.getSellerTransFee());
            sellerLists.setSellerFinFee(sellerDTO.getSellerFinFee());
		    sellerLists.setUpdateDate(new Date());

	        settingService.saveSellerSettings(sellerLists);
	        }
}
	

	@ResourceMapping
    public void fetchSettings(ResourceRequest request, ResourceResponse response)throws IOException {
	

		long userSelection =Long.valueOf(ParamUtil.getString(request, "userSelection",""));
		String settingmodel=null;
		System.out.println("userSelections::::"+userSelection);
		try {
		SellerSetting sellerList = settingService.getSellerSetting(userSelection);
		SellerSetting cloneSellerList = new SellerSetting();
		cloneSellerList.setId(sellerList.getId());
		cloneSellerList.setSellerFinFee(sellerList.getSellerFinFee());
		cloneSellerList.setSellerTransFee(sellerList.getSellerTransFee());
		Gson gson=new Gson();
	    settingmodel=gson.toJson(cloneSellerList);
	    response.getWriter().println(settingmodel);
		} catch (Exception e) {
			_log.error("Error occured while fetchSettings"+e.getMessage());
			response.setProperty(ResourceResponse.HTTP_STATUS_CODE, "400");
		}
		
	}
	
	private PortletConfig getPortletConfig(PortletRequest request) {
		PortletConfig portletConfig = (PortletConfig) request.getAttribute(JavaConstants.JAVAX_PORTLET_CONFIG); 
		return portletConfig;
	}
	
	
}
