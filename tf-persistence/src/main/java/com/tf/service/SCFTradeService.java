package com.tf.service;

import java.util.List;

import com.tf.model.SCFTrade;

public interface SCFTradeService {
	
	public List<SCFTrade> getScfTrades();
	
	public void saveorUpdate(SCFTrade scfTrade);

}
