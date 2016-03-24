
package com.tf.service;

import com.tf.model.SCFTrade;
import com.tf.persistance.util.InSuffcientFund;

import java.util.Date;
import java.util.List;

public interface SCFTradeService {

	public Long getAdminTradeListWithSearchCount(String searchtxt, Date fromDate, Date toDate, String value);

	public Long getScfTradeByScfCompanyCount(String scfCompany, Date frmDate, Date toDate);

	public List<SCFTrade> getScfTrades(int startIndex, int pageSize);

	public Long getScfTradeSellerCompanyCount(String scfCompany, Date frmDate, Date toDate, long compID);

	public SCFTrade save(SCFTrade scfTrade);

	public List<SCFTrade> getTradeHistoryByComapnyId(long companyId, int startIndex, int pageSize);

	public SCFTrade findById(long id);

	public Long getScfTradesCount();

	public List<SCFTrade> getScfTradeByScfCompany(String scfCompany, Date frmDate, Date toDate, int startIndex, int pageSize);

	public List<SCFTrade> getScfTrades(Long companyID);

	public List<SCFTrade> getScfTradeSellerCompany(String scfCompany, Date frmDate, Date toDate, long compID, int startIndex, int pageSize);

	public void updateTrade(SCFTrade scfTrade);

	public Long getScfTradeListWithSearchCount(String searchtxt, String RegNum);

	public List<SCFTrade> getScfTradesByTradeId(Long tradeId);

	public Long getHistoryCount(long companyId);

	public List<SCFTrade> getScfTrades(Long companyID, int startIndex, int pageSize);

	public Long getScfTradesCountByCompanyId(Long companyID);

	public Long getScfTradesCount(Long companyID);

	public Long getScfTradeCount(Long tradeId);

	public Long getScfTradeCounts(String regNum);

	public String findByQueryId(String tradeId);

	public List<SCFTrade> getScfTradeList(String RegNum, int startIndex, int pageSize);

	public List<SCFTrade> getTradeHistoryList(int startIndex, int pageSize);

	public void updateTradeLifeCycle(SCFTrade scfTrade) throws InSuffcientFund;

	public Long getScfTradesHistoryCount();

	public List<SCFTrade> getScfTradeListWithSearch(String search, String regNum, int startIndex, int pageSize);

	public List<SCFTrade> getAdminTradeListWithSearch(String search, Date fromDate, Date toDate, String value, int startIndex, int pageSize);

	public List<SCFTrade> getScfAdminTradeListWithSearch(
		long companyId, String searchtxt, Date fromDate, Date toDate, String value, int startIndex, int pageSize);
	
	public Long getScfAdminTradeListWithSearchCount(long companyId, String searchtxt, Date fromDate, Date toDate, String value);

}
