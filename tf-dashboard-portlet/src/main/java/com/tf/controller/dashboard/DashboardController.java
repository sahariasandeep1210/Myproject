package com.tf.controller.dashboard;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.portlet.RenderRequest;
import javax.portlet.RenderResponse;
import javax.portlet.ResourceRequest;
import javax.portlet.ResourceResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.portlet.ModelAndView;
import org.springframework.web.portlet.bind.annotation.RenderMapping;
import org.springframework.web.portlet.bind.annotation.ResourceMapping;

import com.google.gson.Gson;
import com.liferay.portal.kernel.exception.PortalException;
import com.liferay.portal.kernel.exception.SystemException;
import com.liferay.portal.kernel.log.Log;
import com.liferay.portal.kernel.log.LogFactoryUtil;
import com.liferay.portal.kernel.util.ParamUtil;
import com.liferay.portal.kernel.util.WebKeys;
import com.liferay.portal.security.permission.PermissionChecker;
import com.liferay.portal.theme.ThemeDisplay;
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
		    	String selectedCompanyFromDropDown = ParamUtil.getString(request, "selectedCompany");// Getting the value from drop down
		    	System.out.println("**********SelectedCompanyFrom JSP "+ selectedCompanyFromDropDown);
		    	Long selectedCompanyId = null;
		    	List<Object[]> creditAvailForSCFCompany = null;
		    	
		        	Long investorID=investorService.getInvestorIDByCompanyId(liferayUtility.getWhitehallCompanyID(request));
		        	
		        	dashBoardService.setInvestorStackedBarChartInformation(dashModel,investorID);
		        	
		    	dashModel.setInvestorPortfolios(investorService.getInvestorPortfolioDataForInvestorGraph(investorID)); 
		    	
		    	dashModel.setTotalCreditAvail(investorService.getTotalCreditAvailForInvestorGraph(investorID));
		    	
		    	
		    	List<Object[]> allScfCompaniesFromInvestorPortfolio = investorService.getAllScfCompaniesFromInvestorPortfolio();// getting scf companies to show in drop down list
		    
		    	 for (Object[] row : allScfCompaniesFromInvestorPortfolio) {
						
						System.out.println("******allScfCompaniesFromInvestorPortfolio*****"+ row[0] );// id
						System.out.println("******allScfCompaniesFromInvestorPortfolio*****"+ row[1] );// Name
						selectedCompanyId =  Long.parseLong(row[0].toString());// for first time 
						break;
						
					}
		    	
		    	 if(selectedCompanyFromDropDown !=null && selectedCompanyFromDropDown.trim().length()>0 ){
		    		 
		    		 selectedCompanyId = Long.parseLong(selectedCompanyFromDropDown);
		    	 }
		    	
		    	 if(selectedCompanyId != null){
		    		 creditAvailForSCFCompany =	investorService.getCreditAvailForSCFCompany(selectedCompanyId);// retrieving the data corresponding to selected company id 
		    	
                 for (Object[] row : creditAvailForSCFCompany) {
					
					/*System.out.println("******AvailableCreditLine*****"+ row[0] );// Avail Amount
					System.out.println("******AvailableCreditLine*****"+ row[1] );// BPS
					System.out.println("******AvailableCreditLine*****"+ row[2] );// Company Name
					*/
				}
		     }
              
		    	
		    	List<Object[]> graphArraySettled =dashBoardService.getSettledTradeAsPerSCFCompanies(investorID);/* This function is added to show settled 
		    	value corresponding to scf company 
				*/
				for (Object[] row : graphArraySettled) {
					
					/*System.out.println("******SettledValueInSeparateQueryController*****"+ row[0] );// Company id
					System.out.println("******SettledValueInSeparateQueryController*****"+ row[1] );//Settled Amount 
					System.out.println("******SettledValueInSeparateQueryController*****"+ row[2] );
					System.out.println("******SettledValueInSeparateQueryController*****"+ row[3] );// Company Name*/}
				
				userType=Constants.PRIMARY_INVESTOR_ADMIN;	
		    	model.put("investorID", investorID);
		    	model.put("graphArraySettled", graphArraySettled);
		    	model.put("creditAvailForSCFCompany", creditAvailForSCFCompany);
		    	model.put("allScfCompaniesFromInvestorPortfolio", allScfCompaniesFromInvestorPortfolio);
		    	model.put("selectedCompanyId", selectedCompanyId);
		    	
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

	@ResourceMapping("refreshGraphCall")
	public void graphRefreshCall(ResourceRequest request, ResourceResponse response,ModelMap modelMap)
			throws IOException, PortalException, SystemException {
		String jsonString="";
		try {
			if(request.isUserInRole(Constants.SCF_ADMIN)){
				     DashboardModel dashModel=new DashboardModel();	
				    String userType=null;
				    Long companyId =null;
				    ThemeDisplay themeDisplay = (ThemeDisplay) request.getAttribute(WebKeys.THEME_DISPLAY);
				companyId = userService.getCompanybyUserID(themeDisplay.getUserId()).getId();
				dashModel.setInvestorPortfolios(investorService.getInvestorPortfolioDataForGraph(companyId));
				dashModel.setTotalCreditAvail(investorService.getTotalCreditAvailForGraph(companyId));			
				userType=Constants.SCF_ADMIN;
				DashboardModel setDashBoardInformation = dashBoardService.setDashBoardInformation(dashModel,userType, companyId);
				modelMap.addAttribute("dashboardModel", setDashBoardInformation);
					// JSONObject companyObject =
					// JSONFactoryUtil.createJSONObject();
					Gson gson = new Gson();
					if(setDashBoardInformation!=null && setDashBoardInformation.getInvestorPortfolios()!=null && setDashBoardInformation.getInvestorPortfolios().size()>0){
						 jsonString = gson.toJson(setDashBoardInformation.getInvestorPortfolios());
					}
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 response.getWriter().println(jsonString);
	}	
}
