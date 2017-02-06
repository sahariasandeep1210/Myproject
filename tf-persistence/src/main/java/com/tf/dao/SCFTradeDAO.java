
package com.tf.dao;

import com.tf.model.SCFTrade;
import com.tf.persistance.util.DashboardModel;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

public interface SCFTradeDAO extends BaseDAO<SCFTrade, Serializable> {

	public Long getAdminTradeListWithSearchCount(String searchtxt, Date fromDate, Date toDate, String value);

	public List<SCFTrade> getScfTrades(int startIndex, int pageSize,String columnName,String order);

	public Long getScfTradeSellerCompanyCount(String scfCompany, Date frmDate, Date toDate, long compID);

	public SCFTrade save(SCFTrade scfTrade);
	
	public Long getScfAdminTradeListWithSearchCount(long companyId, String searchtxt, Date fromDate, Date toDate, String value);

	public List<SCFTrade> getTradeHistoryByComapnyId(long companyId, int startIndex, int pageSize);

	public SCFTrade findById(long id);

	public Long getScfTradesCount();

	public List<SCFTrade> getScfTrades(Long companyID);

	public List<SCFTrade> getScfTradesByTradeId(Long tradeId);

	public List<SCFTrade> getScfTrades(Long companyID, int startIndex, int pageSize,String order);

	public Long getScfTradesCount(Long companyID);

	public Long getScfTradeCount(Long tradeId);

	public List<SCFTrade> getScfTradeList(String RegNum, int startIndex, int pageSize,String order);

	public Long getScfTradeCounts(String regNum);

	public String findByQueryId(String tradeId);

	public Long getScfTradesCountByCompanyId(Long companyID);

	public List<SCFTrade> getTradeHistoryList(int startIndex, int pageSize);

	public Long getScfTradesHistoryCount();

	public Long getHistoryCount(long companyId);

	public List<SCFTrade> getScfTradeByScfCompany(String scfCompany, Date frmDate, Date toDate, int startIndex, int pageSize);

	public List<SCFTrade> getScfTradeSellerCompany(String scfCompany, Date frmDate, Date toDate, long compID, int startIndex, int pageSize);

	public Long getScfTradeByScfCompanyCount(String scfCompany, Date frmDate, Date toDate);

	public List<SCFTrade> getScfTradeListWithSearch(String searchtxt, String regNum, int startIndex, int pageSize,String order);

	public Long getScfTradeListWithSearchCount(String searchtxt, String RegNum);

	public List<SCFTrade> getAdminTradeListWithSearch(String searchtxt, Date fromDate, Date toDate, String value, int startIndex, int pageSize, String columnName,String order);

	public List<SCFTrade> getScfAdminTradeListWithSearch(
		long companyId, String searchtxt, Date fromDate, Date toDate, String value, int startIndex, int pageSize, String order);
	
	public List<SCFTrade> getScfTradeListForInvestor(String searchtxt, Long investorID, int startIndex, int pageSize,boolean count, String order);
	
	public SCFTrade findTradeDeatailsForInvestor(long tradeId,long investorID);
	
	public void setSettledTradeInformation(DashboardModel dashModel);
	
	public void setLiveTradeInformation(DashboardModel dashModel);
	
	public void setInvestorStackedBarChartInformation(DashboardModel dashModel,Long investorId);

	public List getSumOfSCFTradeProperties(String searchText);

	public List getSumOfSCFTradePropertiesForAdmin(String search,Date fromDate, Date toDate, String value);
}
