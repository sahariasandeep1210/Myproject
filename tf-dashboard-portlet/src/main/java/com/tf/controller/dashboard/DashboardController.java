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
import com.tf.utility.LiferayUtility;


@Controller
@RequestMapping(value = "VIEW")
public class DashboardController {
	
	protected Log _log = LogFactoryUtil.getLog(DashboardController.class.getName());
	
	@Autowired
	private LiferayUtility liferayUtility;
	
	@RenderMapping
	protected ModelAndView renderCompanyList(ModelMap model,RenderRequest request, RenderResponse response) throws Exception {		
		_log.info("Render Dashboard");
		setPortletURls(model,request);
		return new ModelAndView("newdashboard", model);		
	}

	private void setPortletURls(ModelMap map, RenderRequest request) {
		map.put("mangaeCompanyURL", liferayUtility.setPortletURL( request, "tf-company-portlet",null,null,true));
		map.put("createPOURL", liferayUtility.setPortletURL(request, "tf-po-portlet","render","addPurchaseOrder",true)) ;
	}
	

}
