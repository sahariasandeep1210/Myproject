package com.tf.report;

import java.io.IOException;
import java.util.List;

import javax.portlet.ActionRequest;
import javax.portlet.ActionResponse;
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

import com.liferay.portal.kernel.log.Log;
import com.liferay.portal.kernel.log.LogFactoryUtil;
import com.liferay.portal.kernel.util.Validator;
import com.tf.model.SellerScfCompanyMapping;
import com.tf.model.WhiteHallTransaction;
import com.tf.persistance.util.Constants;
import com.tf.service.SellerScfMappingService;
import com.tf.util.LiferayUtility;
import com.tf.util.PaginationUtil;
import com.tf.util.model.PaginationModel;

/**
 * This controller is responsible for request/response handling on Custom
 * notification menu
 * 
 * @author Gautam Sharma
 */
@Controller
@RequestMapping(value = "VIEW")
public class CustomNotificationController {
	
	@Autowired
	protected LiferayUtility liferayUtility;
	
	@Autowired
	protected SellerScfMappingService sellerScfMappingService;
	
	@Autowired
	protected PaginationUtil paginationUtil;

	@RenderMapping
	protected ModelAndView renderReportList(
			@ModelAttribute("reportModel") WhiteHallTransaction whiteHallTransaction, ModelMap model,
			RenderRequest request, RenderResponse response) throws Exception {
		long companyID=liferayUtility.getWhitehallCompanyID(request);
		List<SellerScfCompanyMapping> sellerScfMappings=null; 
		Long count=sellerScfMappingService.getSellerScfMappingCountBasedOnId(companyID);
		if(Validator.isNotNull(count) && count>0){
			PaginationModel paginationModel = paginationUtil.preparePaginationModel(request);
			sellerScfMappings = sellerScfMappingService.getSellerScfMapping(
					paginationModel.getStartIndex(), paginationModel.getPageSize(),null, companyID, new String[]{Constants.STATUS.PENDING.toString()});
		}
		model.put("sellerScfMappings", sellerScfMappings);
		model.put("count", count);
	        return new ModelAndView("notification", model);
	}
	
	
	
	@ActionMapping(params = "action=taskApproveReject")
	public void taskApproveReject(ActionRequest request,ActionResponse response, ModelMap modelMap) throws IOException {
		String id=request.getParameter("id");
		String status=request.getParameter("status");
		System.out.println("into actionMapping");
		if(org.apache.commons.lang.StringUtils.isNotEmpty(status) && org.apache.commons.lang.StringUtils.isNotEmpty(id)){
			boolean statusBoolean=Boolean.parseBoolean(status);
			sellerScfMappingService.updateStatus(Long.parseLong(id), statusBoolean?Constants.STATUS.APPROVED.toString():Constants.STATUS.REJECTED.toString(),"");
		}
	}
    private static Log _log = LogFactoryUtil.getLog(CustomNotificationController.class);

}
