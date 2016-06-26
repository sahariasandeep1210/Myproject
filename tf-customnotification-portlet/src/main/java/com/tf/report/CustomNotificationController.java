package com.tf.report;

import javax.portlet.RenderRequest;
import javax.portlet.RenderResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.portlet.ModelAndView;
import org.springframework.web.portlet.bind.annotation.RenderMapping;

import com.liferay.portal.kernel.log.Log;
import com.liferay.portal.kernel.log.LogFactoryUtil;
import com.tf.model.WhiteHallTransaction;

/**
 * This controller is responsible for request/response handling on Custom
 * notification menu
 * 
 * @author Gautam Sharma
 */
@Controller
@RequestMapping(value = "VIEW")
public class CustomNotificationController {


	@RenderMapping
	protected ModelAndView renderReportList(
			@ModelAttribute("reportModel") WhiteHallTransaction whiteHallTransaction, ModelMap model,
			RenderRequest request, RenderResponse response) throws Exception {
	    
	    return new ModelAndView("notification", model);
	    
	    
	}
	


    private static Log _log = LogFactoryUtil.getLog(CustomNotificationController.class);

}
