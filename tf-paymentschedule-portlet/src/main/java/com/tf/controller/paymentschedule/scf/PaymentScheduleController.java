package com.tf.controller.paymentschedule.scf;

import java.util.List;

import javax.portlet.RenderRequest;
import javax.portlet.RenderResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.portlet.ModelAndView;
import org.springframework.web.portlet.bind.annotation.RenderMapping;

import com.liferay.portal.kernel.log.Log;
import com.liferay.portal.kernel.log.LogFactoryUtil;
import com.liferay.portal.kernel.servlet.SessionErrors;
import com.liferay.portal.kernel.util.WebKeys;
import com.liferay.portal.theme.ThemeDisplay;
import com.tf.model.Company;
import com.tf.persistance.util.Constants;
import com.tf.persistance.util.PaymentScheduleDTO;
import com.tf.service.InvoiceService;
import com.tf.service.UserService;
import com.tf.util.LiferayUtility;
import com.tf.util.PaginationUtil;
import com.tf.util.model.PaginationModel;

/**
 * This controller is responsible for request/response handling on
 * Seller/Company screens
 * 
 * @author pawan
 *
 */
@Controller
@RequestMapping(value = "VIEW")
public class PaymentScheduleController {
	protected Log _log = LogFactoryUtil.getLog(PaymentScheduleController.class.getName());
	
	@Autowired
	protected InvoiceService invoiceService;
	@Autowired
	protected LiferayUtility liferayUtility;
	
	@Autowired
	protected PaginationUtil paginationUtil;
	
	@Autowired
	protected  UserService userService; 
	
	@RenderMapping
	protected ModelAndView renderCompanyList(	
			@ModelAttribute("companyModel") Company company, ModelMap model,
			RenderRequest request, RenderResponse response) throws Exception {
		_log.info("CompanyController :: Render Company List");
		ThemeDisplay themeDisplay = (ThemeDisplay) request
				.getAttribute(WebKeys.THEME_DISPLAY);
		
		//long companyID = ParamUtil.getLong(request, "companyID");
		ThemeDisplay themeDispay = (ThemeDisplay) request
				.getAttribute(WebKeys.THEME_DISPLAY);
		
		try {
			if (request.isUserInRole(Constants.SCF_ADMIN)) {
				model.put("userType", Constants.SCF_ADMIN);
				long companyID = userService.getCompanybyUserID(themeDisplay.getUserId()).getId();
				model.put("userType", Constants.SCF_ADMIN);
				model.put("companyId", companyID);
				Long noOfRecords = 0l;
				PaginationModel paginationModel = paginationUtil.preparePaginationModel(request);
				List<PaymentScheduleDTO> paymentScheduleList=null;
				
				paymentScheduleList = invoiceService.getPaymentScheduleList(paginationModel.getStartIndex(), paginationModel.getPageSize(), companyID, "scf.payment_date", "", "Supplier Paid",false);
				if(paymentScheduleList!=null && paymentScheduleList.size()>0){
					List<PaymentScheduleDTO> paymentScheduleList2 = invoiceService.getPaymentScheduleList(paginationModel.getStartIndex(), paginationModel.getPageSize(), companyID, "scf.payment_date", "", "Supplier Paid",true);
					noOfRecords=(long) paymentScheduleList2.size();
				}
				paginationUtil.setPaginationInfo(noOfRecords, paginationModel);
				model.put("currentUser", themeDispay.getRealUser());
				model.put("paymentScheduleList", paymentScheduleList);
				model.put("paginationModel", paginationModel);

			}
		} catch (Exception e) {
			SessionErrors.add(request, "default-error-message");
			_log.error("CompanyController.createCompany() - error occured while rendering add company screen" + e.getMessage());
		}

		return new ModelAndView("paymentscheduleview", model);
	}

	
}
