package com.tf.controller.dashboard;

import javax.portlet.RenderRequest;
import javax.portlet.RenderResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.portlet.ModelAndView;
import org.springframework.web.portlet.bind.annotation.RenderMapping;

import com.liferay.portal.kernel.log.Log;
import com.liferay.portal.kernel.log.LogFactoryUtil;


@Controller
@RequestMapping(value = "VIEW")
public class DashboardController {
	
	protected Log _log = LogFactoryUtil.getLog(DashboardController.class.getName());
	
	@RenderMapping
	protected ModelAndView renderCompanyList(ModelMap model,RenderRequest request, RenderResponse response) throws Exception {		
		_log.info("Render Dashboard");
		return new ModelAndView("dashboard", model);		
	}
	

}
