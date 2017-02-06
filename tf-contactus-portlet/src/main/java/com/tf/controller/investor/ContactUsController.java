package com.tf.controller.investor;

import javax.portlet.ActionRequest;
import javax.portlet.ActionResponse;
import javax.portlet.PortletConfig;
import javax.portlet.PortletRequest;
import javax.portlet.RenderRequest;
import javax.portlet.RenderResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.portlet.ModelAndView;
import org.springframework.web.portlet.bind.annotation.ActionMapping;
import org.springframework.web.portlet.bind.annotation.RenderMapping;

import com.liferay.portal.kernel.language.LanguageUtil;
import com.liferay.portal.kernel.log.Log;
import com.liferay.portal.kernel.log.LogFactoryUtil;
import com.liferay.portal.kernel.util.JavaConstants;
import com.tf.util.LiferayUtility;
import com.tf.util.model.ContactModel;

/**
 * This controller is responsible for request/response handling on
 * Contact US screens
 * 
 * @author Gautam Sharma
 * 
 */
@Controller
@RequestMapping(value = "VIEW")
public class ContactUsController {
	
	protected Log _log = LogFactoryUtil.getLog(ContactUsController.class);
	
	
	@Autowired
	private LiferayUtility liferayUtility;
	
	
	@RenderMapping
	protected ModelAndView renderInvestorInfo(@ModelAttribute("contactModel") ContactModel contact,
		ModelMap model,RenderRequest request, RenderResponse response) throws Exception {		
		_log.info("Render Contact Us");		
		return new ModelAndView("view", model);		
	}
	
	@ActionMapping(params = "action=sendQuery")
	protected void createCompanyAction(
			@ModelAttribute("contactModel") ContactModel contact, ModelMap model,
			ActionRequest request, ActionResponse response) throws Exception {
	    PortletConfig portletConfig = (PortletConfig) request.getAttribute(JavaConstants.JAVAX_PORTLET_CONFIG);
	    liferayUtility.sendEmail(request, "	info@whitehallfinance.com", "info@whitehallfinance.com", LanguageUtil.get(portletConfig, request.getLocale(), "contactus.email.subject"), getEmailContent(contact,request));
	    response.setRenderParameter("render", "success");	    
	}
	
	
	private String getEmailContent(ContactModel contact,PortletRequest request) {	    
	    String content = liferayUtility.getContentByURLTitle(request, "contactus-email");
	    content=content.replaceAll("\\[FirstName\\]", contact.getFirstName() +" " +contact.getLastName());
	    content=content.replaceAll("\\[CompanyName\\]", contact.getCompanyName());
	    content=content.replaceAll("\\[JobTitle\\]", contact.getJobtitle());
	    content=content.replaceAll("\\[EmailID\\]", contact.getEmailAddress());
	    content=content.replaceAll("\\[ContactNo\\]", contact.getCompanyName());
	    content=content.replaceAll("\\[Message\\]", contact.getMessage());
	    return content;
	}

	@RenderMapping(params = "render=success")
	protected ModelAndView renderSuccess(ModelMap model,RenderRequest request, RenderResponse response) throws Exception {		
		_log.info("Render Success form");		
		return new ModelAndView("thankyou", model);		
	}
	
}
