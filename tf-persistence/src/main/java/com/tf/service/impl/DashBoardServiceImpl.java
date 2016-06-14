package com.tf.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tf.dao.CompanyDAO;
import com.tf.dao.InvestorDAO;
import com.tf.dao.InvoiceDAO;
import com.tf.dao.SCFTradeDAO;
import com.tf.model.Company;
import com.tf.persistance.util.CompanyStatus;
import com.tf.persistance.util.DashboardModel;
import com.tf.service.DashBoardService;

@Service
public class DashBoardServiceImpl implements DashBoardService {
	
	
	@Autowired
	private InvestorDAO investorDAO;
	
	@Autowired
	private CompanyDAO companyDAO;
	
	@Autowired
	private InvoiceDAO invoiceDAO;
	
	@Autowired
	private SCFTradeDAO scfTradeDAO;

	public DashboardModel setDashBoardInformation(DashboardModel dashModel,String userType, Long scfCompanyID) {
		
		//setting credit line details
		investorDAO.getDashBoardInformation(dashModel,scfCompanyID);
		
		//setting Count information
		dashModel.setCompanyCount(companyDAO.getCompaniesCount(CompanyStatus.DELETED.getValue()));
		dashModel.setInvoiceCount(invoiceDAO.getInvoicesCount());
		dashModel.setInvestorCount(investorDAO.getInvestorCount());		
		
		//setting Trade information
		scfTradeDAO.setSettledTradeInformation(dashModel);
		scfTradeDAO.setLiveTradeInformation(dashModel);	
		if(dashModel.getLiveTradeAmount()!=null){
			dashModel.setTotalTradeAmount(dashModel.getLiveTradeAmount().add(dashModel.getSettledTradeAmount()));
		}
		
		dashModel.setInvestors(investorDAO.getInvestorsByCashPosition());

		return dashModel;
	}
	

}
