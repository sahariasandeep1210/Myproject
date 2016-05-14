package com.tf.controller.dashboard;

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
import com.liferay.portal.kernel.util.WebKeys;
import com.liferay.portal.security.permission.PermissionChecker;
import com.liferay.portal.theme.ThemeDisplay;
import com.tf.model.Investor;
import com.tf.model.InvestorPortfolio;
import com.tf.persistance.util.Constants;
import com.tf.persistance.util.DashboardModel;
import com.tf.service.DashBoardService;
import com.tf.service.InvestorService;
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
	
	@RenderMapping
	protected ModelAndView renderCompanyList(ModelMap model,RenderRequest request, RenderResponse response) throws Exception {		
		_log.info("Render Dashboard");
		String viewName="admindashboard";
		String userType=null;
		ThemeDisplay themeDisplay = (ThemeDisplay) request.getAttribute(WebKeys.THEME_DISPLAY);
		PermissionChecker permissionChecker = themeDisplay.getPermissionChecker();
		
		List<InvestorPortfolio> investorPortfolios=null;

		if (permissionChecker.isOmniadmin()) {
			userType=Constants.WHITEHALL_ADMIN;
			List<Investor> cashPosition =investorService.getCashPoition();
			model.put("cashPosition",cashPosition);
		} else if(request.isUserInRole(Constants.PRIMARY_INVESTOR_ADMIN)){
			userType=Constants.PRIMARY_INVESTOR_ADMIN;
			investorPortfolios=investorService.getInvestorPortfolioDataForGraph(null);
			viewName="investordashboard";
		}else if(request.isUserInRole(Constants.SELLER_ADMIN)){
			userType=Constants.SELLER_ADMIN;
			viewName="sellerdashboard";
		}else if(request.isUserInRole(Constants.SCF_ADMIN)){
			long companyId = userService.getCompanybyUserID(themeDisplay.getUserId()).getId();
			investorPortfolios=investorService.getInvestorPortfolioDataForGraph(companyId);
			userType=Constants.SCF_ADMIN;
			viewName="scfdashboard";
		}
		
		
	
		
		
		DashboardModel dashModel=new DashboardModel();
		model.put("investorPortfolios", investorPortfolios);
		setPortletURls(dashModel,request);
		//model.put("dashboardModel", investorService.getDashBoardInformation());
		model.put("dashboardModel", dashBoardService.setDashBoardInformation(dashModel,userType, null));
		
		return new ModelAndView(viewName, model);		
	}

	
	






	private void setPortletURls(DashboardModel dashModel, RenderRequest request) {
		dashModel.setCreateCompanyURL(liferayUtility.getPortletURL( request, "tf-company-portlet","render","createCompany",true));
		dashModel.setCreateInvoiceURL(liferayUtility.getPortletURL( request, "scf-invoice-portlet","render","createInvoice",true));
		//map.put("mangaeCompanyURL", liferayUtility.getPortletURL( request, "tf-company-portlet",null,null,true));
		//map.put("createPOURL", liferayUtility.setPortletURL(request, "tf-po-portlet","render","addPurchaseOrder",true)) ;
	}
	

}
