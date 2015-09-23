package com.tf.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tf.dao.SCFTradeDAO;
import com.tf.model.SCFTrade;
import com.tf.service.SCFTradeService;


@Service
@Transactional
public class SCFTradeServiceImpl  implements SCFTradeService{
	
	@Autowired
	private SCFTradeDAO scfTradeDAO;

	public List<SCFTrade> getScfTrades() {
		// TODO Auto-generated method stub
		return scfTradeDAO.getScfTrades();
	}
	
	public SCFTrade save(SCFTrade scfTrade){
		return scfTradeDAO.save(scfTrade);
	}
	
	public SCFTrade findById(long id){
		return scfTradeDAO.findById(id);
	}

}
