package com.tf.dao;

import java.io.Serializable;
import java.util.List;

import com.tf.model.SCFTrade;

public interface SCFTradeDAO  extends BaseDAO<SCFTrade, Serializable>{
	
	public List<SCFTrade> getScfTrades();
	
	public SCFTrade save(SCFTrade scfTrade);
	
	public SCFTrade findById(long id);

}
