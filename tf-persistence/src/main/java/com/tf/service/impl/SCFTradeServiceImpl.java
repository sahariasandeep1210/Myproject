package com.tf.service.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tf.dao.AllotmentDAO;
import com.tf.dao.InvestorDAO;
import com.tf.dao.InvestorTransactionDAO;
import com.tf.dao.SCFTradeDAO;
import com.tf.model.Allotment;
import com.tf.model.Investor;
import com.tf.model.InvestorTransaction;
import com.tf.model.Invoice;
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
	
	@Autowired
	private AllotmentDAO allotmentDAO;
	
	@Autowired
	private InvestorDAO investorDAO;

	public List<SCFTrade> getScfTrades(int startIndex,int pageSize) {
		return scfTradeDAO.getScfTrades(startIndex,pageSize);
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
	
	public void updateTrade(SCFTrade scfTrade){
		scfTradeDAO.update(scfTrade);		
	}
	
	
	public void updateTradeLifeCycle(SCFTrade scfTrade){
		scfTradeDAO.update(scfTrade);
		if("Allotment Paid".equalsIgnoreCase(scfTrade.getStatus())){			
			List<InvestorTransaction> transcations=investorTransactionDAO.getInvestorTransactionByTrade(scfTrade.getId());
			List<Allotment> allotments=allotmentDAO.getALlotmentsbyTrade(scfTrade.getId());
			
			//updating allotment status to Invested
			for(Allotment allotment : allotments){
				allotment.setStatus(TranscationStatus.INVESTED.getValue());
				allotmentDAO.update(allotment);
			}
			Date date=new Date();
			//adding transaction information
			for(InvestorTransaction investorTransaction : transcations){
				//adding investment entries
				InvestorTransaction invTransaction=new InvestorTransaction();
				invTransaction.setInvestorID(investorTransaction.getInvestorID());
				
				//updating investor Cash Position
				Investor inv=investorDAO.findByInvestorId(investorTransaction.getInvestorID());
				inv.setCashPosition(inv.getCashPosition().subtract(investorTransaction.getAmount()));
				investorDAO.updateInvestor(inv);
				
				invTransaction.setAmount(investorTransaction.getAmount());
				invTransaction.setTranscationType(TranscationStatus.INVESTED.getValue());
				invTransaction.setTranscationDate(date);
				invTransaction.setTradeID(investorTransaction.getTradeID());
				invTransaction.setReference("Invested");
				investorTransactionDAO.saveEntity(invTransaction);
			}
		}
		
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
	public List<SCFTrade> getScfTradeList(String RegNum,int startIndex,int pageSize){
		List<SCFTrade> scfTrades=scfTradeDAO.getScfTradeList( RegNum, startIndex, pageSize);
		return scfTrades;
	}
	
	public Long getScfTradeCounts(String regNum){
		return scfTradeDAO.getScfTradeCounts(regNum);
	}
	public String findByQueryId(String tradeId){
		return scfTradeDAO.findByQueryId(tradeId);
	}
	
	public Long getScfTradesCount(){
		return scfTradeDAO.getScfTradesCount();
	}
	public Long getScfTradesCountByCompanyId(Long companyID){
		return scfTradeDAO.getScfTradesCount(companyID);
	}
}
