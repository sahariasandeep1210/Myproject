package com.tf.service;

import java.util.List;

import com.tf.persistance.util.DashboardModel;


public interface DashBoardService {
	
	
	public DashboardModel setDashBoardInformation(DashboardModel dashModel,String userType,Long scfCompanyID);
	public void setInvestorStackedBarChartInformation(DashboardModel dashModel,Long investorId);
	
	public List<Object[]> getSettledTradeAsPerSCFCompanies(Long InvestorId);// Added to fetch the settled trade company data

}
