package com.tf.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tf.dao.InvestorTransactionDAO;
import com.tf.dao.SCFTradeDAO;
import com.tf.model.InvestorTransaction;
import com.tf.model.SCFTrade;
import com.tf.persistance.util.TranscationStatus;
import com.tf.service.SCFTradeService;


@Service
@Transactional
public class SCFTradeServiceImpl  implements SCFTradeService{
	
	@Autowired
	private SCFTradeDAO scfTradeDAO;
	
	@Autowired
	private InvestorTransactionDAO investorTransactionDAO;

	public List<SCFTrade> getScfTrades() {
		return scfTradeDAO.getScfTrades();
	}
	
	public SCFTrade save(SCFTrade scfTrade){
		return scfTradeDAO.save(scfTrade);
	}
	
	public SCFTrade findById(long id){
		return scfTradeDAO.findById(id);
	}
	
	public List<SCFTrade> getScfTrades(Long companyID){
		return scfTradeDAO.getScfTrades(companyID);		
	}
	
	public void update(SCFTrade scfTrade){
		if("Allotment Paid".equalsIgnoreCase(scfTrade.getStatus())){
			List<InvestorTransaction> transcations=investorTransactionDAO.getInvestorTransactionByTrade(scfTrade.getId());
			for(InvestorTransaction investorTransaction : transcations){
				//adding investment entries
				investorTransaction.setId(null);
				investorTransaction.setTranscationType(TranscationStatus.INVESTED.getValue());
				investorTransactionDAO.saveEntity(investorTransaction);
			}
		}
		scfTradeDAO.update(scfTrade);
	}
	public List<SCFTrade> getScfTradesByTradeId(Long tradeId){
		return scfTradeDAO.getScfTradesByTradeId(tradeId);
	}
	public List<SCFTrade> getScfTrades(Long companyID,int startIndex,int pageSize) {
		return scfTradeDAO.getScfTrades(companyID, startIndex, pageSize);
	}
	public Long getScfTradesCount(Long companyID){
		return scfTradeDAO.getScfTradesCount(companyID);
	}
	public Long getScfTradeCount(Long tradeId){
		return scfTradeDAO.getScfTradeCount(tradeId);
	}
	public List<SCFTrade> getScfTradeList(Long tradeId,int startIndex,int pageSize){
		return scfTradeDAO.getScfTradeList(tradeId, startIndex, pageSize);
	}
}
