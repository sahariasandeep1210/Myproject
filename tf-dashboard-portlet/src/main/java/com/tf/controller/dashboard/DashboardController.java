package com.tf.controller.dashboard;

import java.util.ArrayList;
import java.util.List;

import javax.portlet.RenderRequest;
import javax.portlet.RenderResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.portlet.ModelAndView;
import org.springframework.web.portlet.bind.annotation.RenderMapping;

import com.liferay.portal.kernel.log.Log;
import com.liferay.portal.kernel.log.LogFactoryUtil;
import com.liferay.portal.kernel.util.ParamUtil;
import com.liferay.portal.kernel.util.WebKeys;
import com.liferay.portal.security.permission.PermissionChecker;
import com.liferay.portal.theme.ThemeDisplay;
import com.tf.model.Company;
import com.tf.model.Investor;
import com.tf.model.SellerScfCompanyMapping;
import com.tf.persistance.util.Constants;
import com.tf.persistance.util.DashboardModel;
import com.tf.service.DashBoardService;
import com.tf.service.InvestorService;
import com.tf.service.SellerScfMappingService;
import com.tf.service.UserService;
import com.tf.util.LiferayUtility;



@Controller
@RequestMapping(value = "VIEW")
public class DashboardController {
	
	protected Log _log = LogFactoryUtil.getLog(DashboardController.class.getName());
	
	@Autowired
	private LiferayUtility liferayUtility;
	
	@Autowired
	private DashBoardService dashBoardService;
	
	@Autowired
	private InvestorService investorService;
	
	@Autowired
	protected UserService userService;
	
	@Autowired
	protected SellerScfMappingService sellerScfMappingService;
	
	@RenderMapping
	protected ModelAndView renderCompanyList(ModelMap model,RenderRequest request, RenderResponse response) throws Exception {		
		_log.info("Render Dashboard");
		String viewName = "admindashboard";
		try {
			List<SellerScfCompanyMapping> sellerRegList = new ArrayList<SellerScfCompanyMapping>();
		    String userType=null;
		    Long companyId =null;
		    ThemeDisplay themeDisplay = (ThemeDisplay) request.getAttribute(WebKeys.THEME_DISPLAY);
		    PermissionChecker permissionChecker = themeDisplay.getPermissionChecker();
		    DashboardModel dashModel=new DashboardModel();	

		    if (permissionChecker.isOmniadmin() || request.isUserInRole(Constants.WHITEHALL_ADMIN)) {
		    	userType=Constants.WHITEHALL_ADMIN;
		    	List<Investor> cashPosition =investorService.getCashPoition();
		    	model.put("cashPosition",cashPosition);
		    	model.put("dashboardModel", dashBoardService.setDashBoardInformation(dashModel,userType, companyId));
		    	
		    } else if(request.isUserInRole(Constants.PRIMARY_INVESTOR_ADMIN)){
		    	
		        	Long investorID=investorService.getInvestorIDByCompanyId(liferayUtility.getWhitehallCompanyID(request));
		        	
		        	dashBoardService.setInvestorStackedBarChartInformation(dashModel,investorID);
		        	
		    	dashModel.setInvestorPortfolios(investorService.getInvestorPortfolioDataForInvestorGraph(investorID)); 
		    	
		    	dashModel.setTotalCreditAvail(investorService.getTotalCreditAvailForInvestorGraph(investorID));
		    	
		    	userType=Constants.PRIMARY_INVESTOR_ADMIN;	
		    	model.put("investorID", investorID);
		    	model.put("dashboardModel", dashBoardService.setDashBoardInformation(dashModel,userType, companyId));
		    	
		    	///dashBoardService.setDashBoardInformation(dashModel,userType, companyId);
		    	//System.out.println("*****GraphCheckInformation*******"+ dashBoardService.setDashBoardInformation(dashModel,userType, companyId));
		    	viewName="investordashboard";
		    }else if(request.isUserInRole(Constants.SELLER_ADMIN)){
		    	Long sellerCmpID = userService.getCompanybyUserID(themeDisplay.getUserId()).getId();
		    	sellerRegList = sellerScfMappingService.getSellerCompanies(sellerCmpID);
		    	model.put("sellerRegList", sellerRegList);
		    	companyId=ParamUtil.getLong(request, "sellercompNo");
		    	if(companyId.equals("") || companyId==null || companyId==0){
		    		companyId=sellerScfMappingService.getSellerScfompany(sellerCmpID);
		    	}
		    	model.put("companyId", companyId);
		    	if (companyId !=null && companyId >0) {
		    	    dashModel.setInvestorPortfolios(investorService.getInvestorPortfolioDataForGraph(companyId));
		    	    dashModel.setTotalCreditAvail(investorService.getTotalCreditAvailForGraph(companyId));
		    	    model.put("dashboardModel", dashBoardService.setDashBoardInformation(dashModel,userType, companyId));
		    		
		    	}
		    	userType=Constants.SELLER_ADMIN;
		    	viewName="sellerdashboard";
		    }else if(request.isUserInRole(Constants.SCF_ADMIN)){
		    	companyId = userService.getCompanybyUserID(themeDisplay.getUserId()).getId();
		    	dashModel.setInvestorPortfolios(investorService.getInvestorPortfolioDataForGraph(companyId));
		    	dashModel.setTotalCreditAvail(investorService.getTotalCreditAvailForGraph(companyId));			
		    	userType=Constants.SCF_ADMIN;
		    	viewName="scfdashboard";
		    	model.put("dashboardModel", dashBoardService.setDashBoardInformation(dashModel,userType, companyId));
		    	
		    }
		    
		    setPortletURls(dashModel,request);
		} catch (Exception e) {
		    // TODO Auto-generated catch block
		    e.printStackTrace();
		}
		
		return new ModelAndView(viewName, model);		
	}



	private void setPortletURls(DashboardModel dashModel, RenderRequest request) {
		dashModel.setCreateCompanyURL(liferayUtility.getPortletURL( request, "tf-company-portlet","render","createCompany",true));
		dashModel.setCreateInvoiceURL(liferayUtility.getPortletURL( request, "scf-invoice-portlet","render","createInvoice",true));	
		dashModel.setCreateInvestorURL(liferayUtility.getPortletURL( request, "tf-company-portlet","render","createInvestor",true));
	}

	


	

}
