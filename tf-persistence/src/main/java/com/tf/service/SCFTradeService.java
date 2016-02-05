package com.tf.service;

import java.util.List;

import com.tf.model.SCFTrade;

public interface SCFTradeService  {
	
	public List<SCFTrade> getScfTrades();
	
	public SCFTrade save(SCFTrade scfTrade);
	
	public SCFTrade findById(long id);
	
	public List<SCFTrade> getScfTrades(Long companyID);
	
	public void update(SCFTrade scfTrade);
	public List<SCFTrade> getScfTradesByTradeId(Long tradeId);


}
