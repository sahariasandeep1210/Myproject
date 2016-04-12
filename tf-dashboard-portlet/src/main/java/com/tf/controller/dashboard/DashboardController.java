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
import com.tf.persistance.util.Constants;
import com.tf.service.InvestorService;
import com.tf.util.LiferayUtility;



@Controller
@RequestMapping(value = "VIEW")
public class DashboardController {
	
	protected Log _log = LogFactoryUtil.getLog(DashboardController.class.getName());
	
	@Autowired
	private LiferayUtility liferayUtility;
	
	@Autowired
	private InvestorService investorService;
	
	@RenderMapping
	protected ModelAndView renderCompanyList(ModelMap model,RenderRequest request, RenderResponse response) throws Exception {		
		_log.info("Render Dashboard");
		setPortletURls(model,request); 
		String viewName="newdashboard";
		if(request.isUserInRole(Constants.PRIMARY_INVESTOR_ADMIN)){
			viewName="investordashboard";
		}else if(request.isUserInRole(Constants.SELLER_ADMIN)){
			viewName="sellerdashboard";
		}else if(request.isUserInRole(Constants.SCF_ADMIN)){
			viewName="scfdashboard";
		}
		ThemeDisplay themeDisplay = (ThemeDisplay) request.getAttribute(WebKeys.THEME_DISPLAY);
		PermissionChecker permissionChecker = themeDisplay.getPermissionChecker();
		if (permissionChecker.isOmniadmin()) {
			List<Investor> cashPosition =investorService.getCashPoition();
			model.put("cashPosition",cashPosition);
		}
		
		model.put("dashboardModel", investorService.getDashBoardInformation());
		
		return new ModelAndView(viewName, model);		
	}

	private void setPortletURls(ModelMap map, RenderRequest request) {
		map.put("mangaeCompanyURL", liferayUtility.getPortletURL( request, "tf-company-portlet",null,null,true));
		//map.put("createPOURL", liferayUtility.setPortletURL(request, "tf-po-portlet","render","addPurchaseOrder",true)) ;
	}
	

}
