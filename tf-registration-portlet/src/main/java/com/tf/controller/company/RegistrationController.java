
package com.tf.controller.company;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.portlet.ActionRequest;
import javax.portlet.ActionResponse;
import javax.portlet.RenderRequest;
import javax.portlet.RenderResponse;
import javax.portlet.ResourceRequest;
import javax.portlet.ResourceResponse;

import org.hibernate.exception.ConstraintViolationException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.portlet.ModelAndView;
import org.springframework.web.portlet.bind.annotation.ActionMapping;
import org.springframework.web.portlet.bind.annotation.RenderMapping;
import org.springframework.web.portlet.bind.annotation.ResourceMapping;

import com.google.gson.Gson;
import com.liferay.portal.DuplicateUserEmailAddressException;
import com.liferay.portal.DuplicateUserScreenNameException;
import com.liferay.portal.kernel.exception.PortalException;
import com.liferay.portal.kernel.exception.SystemException;
import com.liferay.portal.kernel.servlet.SessionErrors;
import com.liferay.portal.kernel.util.ParamUtil;
import com.liferay.portal.kernel.util.WebKeys;
import com.liferay.portal.service.ServiceContext;
import com.liferay.portal.service.ServiceContextFactory;
import com.liferay.portal.theme.ThemeDisplay;
import com.mysql.jdbc.exceptions.jdbc4.MySQLIntegrityConstraintViolationException;
import com.tf.controller.BaseController;
import com.tf.model.Company;
import com.tf.model.CompanyModel;
import com.tf.model.Officer;
import com.tf.model.User;
import com.tf.registration.service.RegistrationService;
import com.tf.util.Registration;

/**
 * This controller is responsible for request/response handling on Registration
 * screens
 * 
 * @author gautamkct
 */
@Controller
@RequestMapping(value = "VIEW")
public class RegistrationController extends BaseController {

	private static final String COMPANY 		= "Company";
	private static final String USER		 	= "User";
	private static final String CONFIRMATION	= "Confirmation";
	private static final String CURRENT_SCREEN 	= "currentScreen";
	private static final String ADMIN 			= "Admin";

	@Autowired
	protected RegistrationService registrationService;

	/**
	 * This method will render registration screen
	 * 
	 * @param registration
	 * @param model
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RenderMapping
	protected ModelAndView renderRegisterCompany(
		@ModelAttribute("registration") Registration registration, ModelMap model, RenderRequest request, RenderResponse response)
		throws Exception {

		try {
			String currentScreen = ParamUtil.getString(request, CURRENT_SCREEN, COMPANY);
			model.put(CURRENT_SCREEN, currentScreen);
			Company company = registration.getCompany();
			setUserType(registration, company);
		}
		catch (Exception e) {
			SessionErrors.add(request, "default-error-message");
			_log.error("RegistrationController.renderRegisterCompany() - error occured while registration" + e.getMessage());
		}
		model.put("registration", registration);
		model.put("orgTypeMap", orgTypeMap);
		model.put("companyTypeMap", companyTypeMap);

		return new ModelAndView("registration", model);
	}

	/**
	 * This method will set User type based on company type selected
	 * 
	 * @param registration
	 * @param company
	 */
	private void setUserType(Registration registration, Company company) {

		// In MVP,Seller,SCF company,Investor and whitehall platform user would
		// be Admin.
		if (company != null) {
			registration.getUser().setType(getRole(companyTypeMap.get(Long.valueOf(company.getCompanyType()))));
		}
	}

	@ActionMapping(params = "action=homePage")
	protected void homePage(ModelMap model,
		ActionRequest request,
		ActionResponse response)
		throws Exception {

		response.sendRedirect("/web/guest/home");
	}

	@ActionMapping(params = "action=regCompanyInfo")
	protected void addCompanyInfo(@ModelAttribute("registration") Registration registration, ModelMap model,
		ActionRequest request,
		ActionResponse response)
		throws Exception {

		response.setRenderParameter(CURRENT_SCREEN, USER);
		model.put("registration", registration);
	}

	@ActionMapping(params = "action=registerCompany")
	protected void registerCompany(@ModelAttribute("registration") Registration registration,
		ModelMap model,
		ActionRequest request,
		ActionResponse response)
		throws Exception {

		try {
			completeCompanyRegistration(registration, request, response);
			response.setRenderParameter(CURRENT_SCREEN, CONFIRMATION);
		}
		catch (PortalException e) {
			if (e instanceof DuplicateUserEmailAddressException) {
				response.setRenderParameter(CURRENT_SCREEN, USER);
				SessionErrors.add(request, "error-user-email");
			}
			else if (e instanceof DuplicateUserScreenNameException) {
				response.setRenderParameter(CURRENT_SCREEN, USER);
				SessionErrors.add(request, "error-user-screenname");
			}
		}
		catch (Exception e) {
			if (e instanceof ConstraintViolationException || e instanceof MySQLIntegrityConstraintViolationException) {
				response.setRenderParameter(CURRENT_SCREEN, COMPANY);
				SessionErrors.add(request, "error-company-registration");
			}
		}
		model.put("registration", registration);

	}

	private void completeCompanyRegistration(Registration registration,
		ActionRequest request, ActionResponse response)
		throws PortalException, SystemException, IOException {

		String passwordUnencrypted;
		ThemeDisplay themeDisplay = (ThemeDisplay) request.getAttribute(WebKeys.THEME_DISPLAY);
		User user = registration.getUser();
		ServiceContext serviceContext = ServiceContextFactory.getInstance(
			com.liferay.portal.model.User.class.getName(), request);
		passwordUnencrypted = registrationService.registerCompany(registration, themeDisplay, user,
			serviceContext, request);
		response.setRenderParameter("tempPassword", passwordUnencrypted);
	}

	@RenderMapping(params = "render=createUser")
	protected ModelAndView renderCreateUser(@ModelAttribute("userModel") User user, ModelMap model, RenderRequest request, RenderResponse response)
		throws Exception {

		long userID = ParamUtil.getLong(request, "userID");
		long companyID = ParamUtil.getLong(request, "companyID");
		List<Officer> officers;
		Map<String, String> userTypesMap;
		try {
			if (userID != 0) {
				user = userService.findById(userID);
			}
			officers = officerService.findOfficersByCompanyId(companyID);
			userTypesMap = adminUtility.getUserTypes(
				adminUtility.getUserID(request),
				companyService.getCompanyTypebyID(companyID), request);
			model.put("userModel", user);
			model.put("officers", officers);
			model.put("userTypesMap", userTypesMap);
		}
		catch (Exception e) {
			SessionErrors.add(request, "default-error-message");
			_log.error("RegistrationController.renderCreateUser() - error occured while rendering user screen in registration process" +
				e.getMessage());
		}
		model.put("companyID", companyID);
		return new ModelAndView("createuser", model);
	}

	@ResourceMapping(value = "fetchCompanyDetails")
	public void fetchCompanyDetails(ResourceRequest request,
		ResourceResponse response)
		throws IOException {

		String companyNo = ParamUtil.getString(request, "companyNo");
		String companyModelString = "";
		try {
			if (!StringUtils.isEmpty(companyNo)) {
				// JSONObject companyObject =
				// JSONFactoryUtil.createJSONObject();
				CompanyModel cmpModel = companyServices.getCompanyInfo(companyNo);
				Gson gson = new Gson();
				companyModelString = gson.toJson(cmpModel);
			}
			System.out.println(companyModelString);
			response.getWriter().println(companyModelString);
		}
		catch (Exception e) {
			_log.error("Error occured while fetching company information" + e.getMessage());
			response.setProperty(ResourceResponse.HTTP_STATUS_CODE, "400");
		}

	}

	private String getRole(String companyType) {

		StringBuilder userRole = new StringBuilder(companyType);
		userRole.append(" ");
		userRole.append(ADMIN);
		return userRole.toString();
	}

}
