package com.tf.report;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
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
import com.liferay.portal.kernel.util.ParamUtil;
import com.mysql.jdbc.StringUtils;
import com.tf.model.WhiteHallTransaction;
import com.tf.persistance.util.Constants;
import com.tf.service.WhiteHallTransactionService;
import com.tf.util.PaginationUtil;
import com.tf.util.model.PaginationModel;

/**
 * This controller is responsible for request/response handling on Report
 * screens
 * 
 * @author DhanushKodi
 */
@Controller
@RequestMapping(value = "VIEW")
public class ReportController {
	@Autowired
	protected PaginationUtil paginationUtil;
	@Autowired
	protected WhiteHallTransactionService whiteHallTransactionService;

	@RenderMapping
	protected ModelAndView renderReportList(
			@ModelAttribute("reportModel") WhiteHallTransaction whiteHallTransaction, ModelMap model,
			RenderRequest request, RenderResponse response) throws Exception {
		_log.info("ReportController :: Render Report List");
		
		try {
			
			List<WhiteHallTransaction> reportList = new ArrayList<WhiteHallTransaction>();
			Long noOfRecords = 0l;
			PaginationModel paginationModel = paginationUtil.preparePaginationModel(request);
			reportList=whiteHallTransactionService.getWhiteHallTransactions(paginationModel.getStartIndex(), paginationModel.getPageSize());
			noOfRecords=whiteHallTransactionService.getWhiteHallTransactionsCount();
			paginationUtil.setPaginationInfo(noOfRecords, paginationModel);
			model.put("paginationModel", paginationModel);
			model.put("reportList", reportList);
			model.put("totalEarnins", whiteHallTransactionService.getWhiteHallEarnings(null,null,null));

		}catch(Exception e){
			_log.error("ReportController.renderReportList() - error occured while rendering Report"
							+ e.getMessage());
		}
		return new ModelAndView("allreports", model);

	}
	
	@RenderMapping(params = "action=getAdminTrade")
	public String getScfAdminTrade(ModelMap model, RenderRequest request, RenderResponse response)
		throws Exception {

		return "allreports";
	}

	@ActionMapping(params = "report=getReport")
	protected void getReport(ModelMap model, ActionRequest request, ActionResponse response)
		throws Exception {

		List<WhiteHallTransaction> whiteHallTransactions = null;
		DateFormat formatter = new SimpleDateFormat(Constants.DATE_FORMAT);
		Date fromDate = null;
		Date toDate = null;
		String search = ParamUtil.getString(request, "Search");
		String value = ParamUtil.getString(request, "dateList");
		String from = ParamUtil.getString(request, "fromDate");
		String to = ParamUtil.getString(request, "toDate");
		if (!StringUtils.isNullOrEmpty(from)) {
			fromDate = formatter.parse(from);
		}
		if (!StringUtils.isNullOrEmpty(to)) {
			toDate = formatter.parse(to);
		}
		
		Long noOfRecords = 0l;
		PaginationModel paginationModel = paginationUtil.preparePaginationModel(request);
		whiteHallTransactions=whiteHallTransactionService.getReportListWithSearch(search, fromDate, toDate, paginationModel.getStartIndex(), paginationModel.getPageSize());
		noOfRecords=whiteHallTransactionService.getReportListWithSearchCount(search, fromDate, toDate);
		paginationUtil.setPaginationInfo(noOfRecords, paginationModel);
		model.put("whiteHallTransactions", whiteHallTransactions);
		model.put("totalEarnins", whiteHallTransactionService.getWhiteHallEarnings(search,fromDate,toDate));
		model.put("search", search);
		model.put("from", from);
		model.put("to", to);
		model.put("paginationModel", paginationModel);
		response.setRenderParameter("action", "getAdminTrade");

	}

    private static Log _log = LogFactoryUtil.getLog(ReportController.class);

}
