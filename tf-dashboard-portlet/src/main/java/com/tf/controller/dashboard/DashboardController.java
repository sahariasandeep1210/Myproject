package com.tf.controller.dashboard;

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
import com.tf.persistance.util.Constants;
import com.tf.service.InvestorService;
import com.tf.utility.LiferayUtility;


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
		}
		model.put("dashboardModel", investorService.getDashBoardInformation());
		return new ModelAndView(viewName, model);		
	}

	private void setPortletURls(ModelMap map, RenderRequest request) {
		map.put("mangaeCompanyURL", liferayUtility.setPortletURL( request, "tf-company-portlet",null,null,true));
		//map.put("createPOURL", liferayUtility.setPortletURL(request, "tf-po-portlet","render","addPurchaseOrder",true)) ;
	}
	

}
