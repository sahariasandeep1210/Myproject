package com.tf.dao;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import com.tf.model.Invoice;
import com.tf.model.SCFTrade;

public interface SCFTradeDAO  extends BaseDAO<SCFTrade, Serializable>{
	
	public List<SCFTrade> getScfTrades(int startIndex,int pageSize);
	
	public SCFTrade save(SCFTrade scfTrade);
	public List<SCFTrade> getTradeHistoryByComapnyId(long companyId,int startIndex,int pageSize);
	public SCFTrade findById(long id);
	public Long getScfTradesCount();
	public List<SCFTrade> getScfTrades(Long companyID);
	public List<SCFTrade> getScfTradesByTradeId(Long tradeId);
	public List<SCFTrade> getScfTrades(Long companyID,int startIndex,int pageSize) ;
	public Long getScfTradesCount(Long companyID);
	public Long getScfTradeCount(Long tradeId);
	public List<SCFTrade> getScfTradeList(String RegNum,int startIndex,int pageSize);
	public Long getScfTradeCounts(String regNum);
	public String findByQueryId(String tradeId);
	public Long getScfTradesCountByCompanyId(Long companyID);
	public  List<SCFTrade> getTradeHistoryList(int startIndex,int pageSize);
	public Long getScfTradesHistoryCount(); 
	 public Long getHistoryCount(long companyId);
	 public SCFTrade getScfTradeByScfCompany(long scfCompany,Date frmDate,Date toDate);
	 public List<SCFTrade> getScfTradeSellerCompany(String scfCompany,Date frmDate,Date toDate,String status);
}
