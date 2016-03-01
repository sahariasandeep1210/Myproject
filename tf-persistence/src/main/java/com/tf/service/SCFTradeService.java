package com.tf.service;

import java.util.List;

import com.tf.model.SCFTrade;

public interface SCFTradeService  {
	
	public List<SCFTrade> getScfTrades();
	
	public SCFTrade save(SCFTrade scfTrade);
	
	public SCFTrade findById(long id);
	
	public List<SCFTrade> getScfTrades(Long companyID);
	
	public void updateTrade(SCFTrade scfTrade);
	
	public List<SCFTrade> getScfTradesByTradeId(Long tradeId);
	
	public List<SCFTrade> getScfTrades(Long companyID,int startIndex,int pageSize) ;
	
	public Long getScfTradesCount(Long companyID);
	public List<SCFTrade> getScfTradesByRegNumAndTradeId(String regNum,int startIndex,int pageSize);
	public Long getScfTradeCount(Long tradeId);
	public Long getScfTradeCounts(String regNum);
	
	public List<SCFTrade> getScfTradeList(Long tradeId,int startIndex,int pageSize);
	
	public void updateTradeLifeCycle(SCFTrade scfTrade);

}
