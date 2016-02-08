package com.tf.controller.settings;

import com.google.gson.Gson;
import com.liferay.portal.kernel.language.LanguageUtil;
import com.liferay.portal.kernel.log.Log;
import com.liferay.portal.kernel.log.LogFactoryUtil;
import com.liferay.portal.kernel.servlet.SessionErrors;
import com.liferay.portal.kernel.util.JavaConstants;
import com.liferay.portal.kernel.util.ParamUtil;
import com.tf.dto.InvestorModel;
import com.tf.model.Company;
import com.tf.model.SellerSetting;
import com.tf.persistance.util.CompanyTypes;
import com.tf.persistance.util.InvestorDTO;
import com.tf.service.CompanyService;
import com.tf.service.InvestorService;
import com.tf.service.SettingService;

import java.io.IOException;
import java.math.BigDecimal;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

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

	
	
	@RenderMapping(params = "render=generalsetting")
	protected ModelAndView renderGenraletings(ModelMap model,RenderRequest request, RenderResponse response) throws Exception {		
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
	
	@RenderMapping(params = "render=sellerSetings")
	protected ModelAndView renderSellerSetings(@ModelAttribute("sellerDTO")SellerSetting  sellerDTO,ModelMap model,RenderRequest request, RenderResponse response) throws Exception {		
		_log.info("Render WhiteHall Settings Screen");

		try {			
			List<Object[]> listOfObjects = settingService.getSellersName();
			System.out.println("dhanussss:"+listOfObjects);
/*			List<List<String>> mainSellerList = new ArrayList<List<String>>(); 
*/			for (Object []objArray : listOfObjects) {
				System.out.println("dhauhs 1 :"+objArray[0] + objArray[1] + objArray[2] + objArray[3] + objArray[4]);
				/*List<String> subSellerList = new ArrayList<String>();
				
				//change here
				subSellerList.add((String)objArray[0]);
				subSellerList.add((objArray[1].toString())+"");
				subSellerList.add((objArray[2].toString())+"");
				DateFormat df = new SimpleDateFormat("dd/MM/yyyy");
				String createDate = df.format(objArray[3]);
				subSellerList.add(createDate);
				String updateDate = df.format(objArray[4]);
				subSellerList.add(updateDate);
				//upto here
				
				mainSellerList.add(subSellerList);*/
			}
			
			/*// displayed by this logic
			for(List<String> subList : mainSellerList) {
				String testString = "";
				for(String str : subList) {
					testString = testString + str + "  ";
				}
				System.out.println("dhauhs 2 :" + testString );
			}*/
			
/*			model.put("mainSellerList", mainSellerList);
*/			
			List<Company> companyList = new ArrayList<Company>();
			String companyType = CompanyTypes.SELLER.getValue();			
			companyList = companyService.getCompanies(companyType);
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
		SellerSetting sellerSetting=null;
		long companyId=ParamUtil.getLong(request, "sellerCompany");
		Company company=companyService.findById(companyId);
		List<SellerSetting> sel=settingService.findByCompanyId(companyId);
		for(SellerSetting compId:sel){
           if(companyId!=compId.getCompanyId()){
        	 sellerSetting=new SellerSetting();
       	    sellerSetting.setComapnyId(company.getId());
       		sellerSetting.setSellerTransFee(sellerDTO.getSellerTransFee());
       		sellerSetting.setSellerFinFee(sellerDTO.getSellerFinFee());
       		sellerSetting.setCreateDate(new Date());
            settingService.saveSellerSettings(sellerSetting);
           }
           else {
			sellerSetting=settingService.findBySellerId(compId.getId());
			sellerSetting.setComapnyId(companyId);
       		sellerSetting.setSellerTransFee(sellerDTO.getSellerTransFee());
            sellerSetting.setSellerFinFee(sellerDTO.getSellerFinFee());
			settingService.updateSellerSettings(sellerSetting);
		}
	}
		
	response.setRenderParameter("render", "sellerSetings");
		
	}
	

	
	

	@ResourceMapping
	public void fetchSettings(ResourceRequest request, ResourceResponse response)throws IOException {
	

		long userSelection =Long.valueOf(ParamUtil.getString(request, "userSelection",""));
		BigDecimal transaction=null;
		BigDecimal finance=null;
		String settingmodel=null;
		System.out.println("userSelections::::"+userSelection);
		List<SellerSetting> sellerList=settingService.findByCompanyId(userSelection);
		for(SellerSetting sell:sellerList){
			if(sell.getCompanyId()==userSelection){
				transaction=sell.getSellerTransFee();
				finance=sell.getSellerFinFee();
				Gson gson=new Gson();
				settingmodel=gson.toJson(sell);
			}
		}
	
		
        
		response.getWriter().println(settingmodel);
		

		/*if(userSelection.equals(LanguageUtil.get(getPortletConfig(request), request.getLocale(), INVESTOR))){
			List<InvestorDTO> investorList=investorService.getInvestorDetails();
			modelMap.put("investorList", investorList);
			viewName=INVESTOR;
		}		*/
	}
	
	private PortletConfig getPortletConfig(PortletRequest request) {
		PortletConfig portletConfig = (PortletConfig) request.getAttribute(JavaConstants.JAVAX_PORTLET_CONFIG); 
		return portletConfig;
	}
	
	
}
