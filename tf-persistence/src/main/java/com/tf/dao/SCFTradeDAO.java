package com.tf.dao;

import java.util.List;

import com.tf.model.SCFTrade;

public interface SCFTradeDAO {
	
	public List<SCFTrade> getScfTrades();
	
	public void saveorUpdate(SCFTrade scfTrade);

}
