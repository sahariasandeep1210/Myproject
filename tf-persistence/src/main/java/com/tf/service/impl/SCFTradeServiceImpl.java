
package com.tf.service.impl;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tf.dao.AllotmentDAO;
import com.tf.dao.InvestorDAO;
import com.tf.dao.InvestorTransactionDAO;
import com.tf.dao.SCFTradeDAO;
import com.tf.dao.WhiteHallTransactionDAO;
import com.tf.model.Allotment;
import com.tf.model.Investor;
import com.tf.model.InvestorTransaction;
import com.tf.model.SCFTrade;
import com.tf.model.WhiteHallTransaction;
import com.tf.persistance.util.InSuffcientFund;
import com.tf.persistance.util.TradeStatus;
import com.tf.persistance.util.TranscationStatus;
import com.tf.service.SCFTradeService;

@Service
@Transactional
public class SCFTradeServiceImpl implements SCFTradeService {

	@Autowired
	private SCFTradeDAO scfTradeDAO;

	@Autowired
	private InvestorTransactionDAO investorTransactionDAO;

	@Autowired
	private AllotmentDAO allotmentDAO;

	@Autowired
	private InvestorDAO investorDAO;

	@Autowired
	private WhiteHallTransactionDAO whiteHallTransactionDAO;

	public List<SCFTrade> getScfTrades(int startIndex, int pageSize) {

		return scfTradeDAO.getScfTrades(startIndex, pageSize);
	}

	public SCFTrade save(SCFTrade scfTrade) {

		return scfTradeDAO.save(scfTrade);
	}

	public SCFTrade findById(long id) {

		return scfTradeDAO.findById(id);
	}

	public List<SCFTrade> getScfTrades(Long companyID) {

		return scfTradeDAO.getScfTrades(companyID);
	}

	public void updateTrade(SCFTrade scfTrade) {

		scfTradeDAO.update(scfTrade);
	}

	@Transactional(rollbackFor={Exception.class,InSuffcientFund.class})
	public void updateTradeLifeCycle(SCFTrade scfTrade) throws InSuffcientFund {

		scfTradeDAO.update(scfTrade);
		boolean tradeUpdate = Boolean.FALSE;
		
			if (TradeStatus.ALLOTMENT_PAID.getValue().equalsIgnoreCase(scfTrade.getStatus())) {
				List<InvestorTransaction> transcations = investorTransactionDAO.getInvestorTransactionByTrade(scfTrade.getId());
				updateAllotments(scfTrade, TranscationStatus.INVESTED.getValue());
				Date date = new Date();
				// adding transaction information
				for (InvestorTransaction investorTransaction : transcations) {
					// adding investment entries
					InvestorTransaction invTransaction = new InvestorTransaction();
					invTransaction.setInvestorID(investorTransaction.getInvestorID());

					// updating investor Cash Position

					Investor inv = investorDAO.findByInvestorId(investorTransaction.getInvestorID());
					if (inv.getCashPosition() == null || inv.getCashPosition().compareTo(investorTransaction.getAmount()) == -1) {
						throw new InSuffcientFund("Allotment Failed");
					}
					inv.setCashPosition(inv.getCashPosition().subtract(investorTransaction.getAmount()));
					inv.setUpdateDate(date);
					investorDAO.updateInvestor(inv);

					invTransaction.setAmount(investorTransaction.getAmount());
					invTransaction.setTranscationType(TranscationStatus.INVESTED.getValue());
					invTransaction.setTranscationDate(date);
					invTransaction.setTradeID(investorTransaction.getTradeID());
					invTransaction.setReference("Invested");
					investorTransactionDAO.saveEntity(invTransaction);
					
				}

				//adding whitehall transaction
				
				WhiteHallTransaction whtTransaction = new WhiteHallTransaction();
				whtTransaction.setAmount(scfTrade.getTradeAmount());
				whtTransaction.setReference("Investors has paid the money to whitehall");
				whtTransaction.setTranscationDate(new Date());
				whtTransaction.setTradeID(scfTrade.getId());
				whtTransaction.setTranscationType(TradeStatus.INVESTOR_PAID.getValue());
				whiteHallTransactionDAO.saveEntity(whtTransaction);
				tradeUpdate = Boolean.TRUE;
			}
			else if (TradeStatus.SUPPLIER_PAID.getValue().equalsIgnoreCase(scfTrade.getStatus())) {
				updateAllotments(scfTrade, TradeStatus.SUPPLIER_PAID.getValue());
				// adding whitehall Transaction
				WhiteHallTransaction whtTransaction = new WhiteHallTransaction();
				whtTransaction.setAmount(scfTrade.getSellerNetAllotment());
				whtTransaction.setReference("Supplier paid by Whitehall Admin");
				whtTransaction.setTranscationDate(new Date());
				whtTransaction.setTradeID(scfTrade.getId());
				whtTransaction.setTranscationType(TradeStatus.SUPPLIER_PAID.getValue());
				whiteHallTransactionDAO.saveEntity(whtTransaction);
				tradeUpdate = Boolean.TRUE;

			}
			else if (TradeStatus.SCF_REPAYMENT.getValue().equalsIgnoreCase(scfTrade.getStatus())) {
				updateAllotments(scfTrade, TradeStatus.SCF_REPAYMENT.getValue());

				// adding whitehall Transaction
				WhiteHallTransaction whtTransaction = new WhiteHallTransaction();
				whtTransaction.setAmount(scfTrade.getTradeAmount());
				whtTransaction.setReference("SCF Company Paid to Whitehall Admin");
				whtTransaction.setTranscationDate(new Date());
				whtTransaction.setTradeID(scfTrade.getId());
				whtTransaction.setTranscationType(TradeStatus.SCF_REPAYMENT.getValue());
				whiteHallTransactionDAO.saveEntity(whtTransaction);
				tradeUpdate = Boolean.TRUE;

			}
			else if (TradeStatus.INVESTOR_PAID.getValue().equalsIgnoreCase(scfTrade.getStatus())) {
				updateAllotmentInvPaid(scfTrade, TradeStatus.INVESTOR_PAID.getValue());

				// Adding Whitehall investor paid Transaction
				WhiteHallTransaction whtTransaction = new WhiteHallTransaction();
				whtTransaction.setAmount(scfTrade.getTradeAmount());
				whtTransaction.setReference("Investor has been repaid by whitehall");
				whtTransaction.setTranscationDate(new Date());
				whtTransaction.setTradeID(scfTrade.getId());
				whtTransaction.setTranscationType(TradeStatus.INVESTOR_REPAID.getValue());
				whiteHallTransactionDAO.saveEntity(whtTransaction);

				// Adding Whitehall investor profit paid Transaction
				WhiteHallTransaction whtTransactionInvProfit = new WhiteHallTransaction();
				whtTransactionInvProfit.setAmount(allotmentDAO.getTotalInvestorProfitForTrade(scfTrade.getId()));
				whtTransactionInvProfit.setReference("Investor profit has been paid  by whitehall");
				whtTransactionInvProfit.setTranscationDate(new Date());
				whtTransactionInvProfit.setTradeID(scfTrade.getId());
				whtTransactionInvProfit.setTranscationType(TranscationStatus.INVETOR_PROFIT.getValue());
				whiteHallTransactionDAO.saveEntity(whtTransactionInvProfit);
				tradeUpdate = Boolean.TRUE;
			}
			else if (TradeStatus.SETTLED.getValue().equalsIgnoreCase(scfTrade.getStatus())) {
				//adding Fees from seller
				WhiteHallTransaction whtTransactionSellerFee = new WhiteHallTransaction();
				if(scfTrade.getSellerTransFee()!=null && scfTrade.getSellerFees()!=null){
					whtTransactionSellerFee.setAmount(scfTrade.getSellerTransFee().add(scfTrade.getSellerFees()));
				}				
				whtTransactionSellerFee.setReference("WhiteHall Fees from Seller");
				whtTransactionSellerFee.setTranscationDate(new Date());
				whtTransactionSellerFee.setTradeID(scfTrade.getId());
				whtTransactionSellerFee.setTranscationType(TranscationStatus.WHITEHALL_FEE.getValue());
				whiteHallTransactionDAO.saveEntity(whtTransactionSellerFee);
				
				//adding profit from Investor
				WhiteHallTransaction whtTransactionInvProfit = new WhiteHallTransaction();
				whtTransactionInvProfit.setAmount(scfTrade.getWhitehallTotalShare());
				whtTransactionInvProfit.setReference("Whitehall profit from Investor");
				whtTransactionInvProfit.setTranscationDate(new Date());
				whtTransactionInvProfit.setTradeID(scfTrade.getId());
				whtTransactionInvProfit.setTranscationType(TranscationStatus.WHITEHALL_PROFIT.getValue());
				whiteHallTransactionDAO.saveEntity(whtTransactionInvProfit);
				
				updateAllotments(scfTrade, TradeStatus.SETTLED.getValue());
			}
		
		if (tradeUpdate) {
			// saving updated information
			updateTrade(scfTrade);
		}

	}

	/**
	 * This method will updated allotment status based on Trade current state
	 * 
	 * @param scfTrade
	 */
	private void updateAllotments(SCFTrade scfTrade, String status) {

		List<Allotment> allotments = allotmentDAO.getALlotmentsbyTrade(scfTrade.getId());
		// updating allotment status to Invested
		for (Allotment allotment : allotments) {
			// updating allotment Status
			allotment.setStatus(status);
			allotmentDAO.update(allotment);

		}
	}

	/**
	 * This method will updated allotment status based on Trade current state
	 * 
	 * @param scfTrade
	 */
	private void updateAllotmentInvPaid(SCFTrade scfTrade, String status) {

		List<Allotment> allotments = allotmentDAO.getALlotmentsbyTrade(scfTrade.getId());
		// updating allotment status to Invested
		Date date = new Date();
		long investortID = 0l;
		for (Allotment allotment : allotments) {
			// updating allotment Status
			allotment.setStatus(status);
			allotmentDAO.update(allotment);
			investortID = allotment.getInvestorID();

			// updating investor Cash Position
			Investor inv = investorDAO.findByInvestorId(investortID);
			// this would be some of actual allotment amount and Investor net
			// profit
			BigDecimal netAmmount = allotment.getAllotmentAmount().add(allotment.getInvestorNetProfit());
			inv.setCashPosition(inv.getCashPosition().add(netAmmount));
			inv.setUpdateDate(date);
			investorDAO.updateInvestor(inv);

			// Adding repaid Transaction
			InvestorTransaction invTransactionRepaid = new InvestorTransaction();
			invTransactionRepaid.setInvestorID(investortID);
			invTransactionRepaid.setAmount(allotment.getAllotmentAmount());
			invTransactionRepaid.setTranscationType(TranscationStatus.REPAID.getValue());
			invTransactionRepaid.setTranscationDate(date);
			invTransactionRepaid.setTradeID(scfTrade.getId());
			invTransactionRepaid.setReference(TranscationStatus.REPAID.getValue());
			investorTransactionDAO.saveEntity(invTransactionRepaid);

			// Adding profit Transaction
			InvestorTransaction invTransactionProfit = new InvestorTransaction();
			invTransactionProfit.setInvestorID(investortID);
			invTransactionProfit.setAmount(allotment.getInvestorGrossProfit());
			invTransactionProfit.setTranscationType(TranscationStatus.PROFIT.getValue());
			invTransactionProfit.setTranscationDate(date);
			invTransactionProfit.setTradeID(scfTrade.getId());
			invTransactionProfit.setReference(TranscationStatus.PROFIT.getValue());
			investorTransactionDAO.saveEntity(invTransactionProfit);

			// Adding Whitehall feeTransaction
			InvestorTransaction invTransactionFee = new InvestorTransaction();
			invTransactionFee.setInvestorID(investortID);
			invTransactionFee.setAmount(allotment.getWhitehallProfitShare());
			invTransactionFee.setTranscationType(TranscationStatus.WHITEHALL_FEE.getValue());
			invTransactionFee.setTranscationDate(date);
			invTransactionFee.setTradeID(scfTrade.getId());
			invTransactionFee.setReference(TranscationStatus.WHITEHALL_FEE.getValue());
			investorTransactionDAO.saveEntity(invTransactionFee);
		}
	}

	public List<SCFTrade> getScfTradesByTradeId(Long tradeId) {

		return scfTradeDAO.getScfTradesByTradeId(tradeId);
	}

	public List<SCFTrade> getScfTrades(Long companyID, int startIndex, int pageSize) {

		return scfTradeDAO.getScfTrades(companyID, startIndex, pageSize);
	}

	public Long getScfTradesCount(Long companyID) {

		return scfTradeDAO.getScfTradesCount(companyID);
	}

	public Long getScfTradeCount(Long tradeId) {

		return scfTradeDAO.getScfTradeCount(tradeId);
	}

	public List<SCFTrade> getScfTradeList(String RegNum, int startIndex, int pageSize) {

		List<SCFTrade> scfTrades = scfTradeDAO.getScfTradeList(RegNum, startIndex, pageSize);
		return scfTrades;
	}

	public List<SCFTrade> getScfTradeListWithSearch(String searchtxt, String RegNum, int startIndex, int pageSize) {

		List<SCFTrade> scfTrades = scfTradeDAO.getScfTradeListWithSearch(searchtxt, RegNum, startIndex, pageSize);
		return scfTrades;
	}

	public Long getScfTradeCounts(String regNum) {

		return scfTradeDAO.getScfTradeCounts(regNum);
	}

	public String findByQueryId(String tradeId) {

		return scfTradeDAO.findByQueryId(tradeId);
	}

	public Long getScfTradesCount() {

		return scfTradeDAO.getScfTradesCount();
	}

	public Long getScfTradesCountByCompanyId(Long companyID) {

		return scfTradeDAO.getScfTradesCount(companyID);
	}

	public List<SCFTrade> getTradeHistoryByComapnyId(long companyId, int startIndex, int pageSize) {

		return scfTradeDAO.getTradeHistoryByComapnyId(companyId, startIndex, pageSize);
	}

	public List<SCFTrade> getTradeHistoryList(int startIndex, int pageSize) {

		return scfTradeDAO.getTradeHistoryList(startIndex, pageSize);
	}

	public Long getScfTradesHistoryCount() {

		return scfTradeDAO.getScfTradesHistoryCount();
	}

	public Long getHistoryCount(long companyId) {

		return scfTradeDAO.getHistoryCount(companyId);
	}

	public List<SCFTrade> getScfTradeByScfCompany(String scfCompany, Date frmDate, Date toDate, int startIndex, int pageSize) {

		return scfTradeDAO.getScfTradeByScfCompany(scfCompany, frmDate, toDate, startIndex, pageSize);
	}

	public List<SCFTrade> getScfTradeSellerCompany(String scfCompany, Date frmDate, Date toDate, long compID, int startIndex, int pageSize) {

		return scfTradeDAO.getScfTradeSellerCompany(scfCompany, frmDate, toDate, compID, startIndex, pageSize);
	}

	public Long getScfTradeSellerCompanyCount(String scfCompany, Date frmDate, Date toDate, long compID) {

		return scfTradeDAO.getScfTradeSellerCompanyCount(scfCompany, frmDate, toDate, compID);
	}

	public Long getScfTradeByScfCompanyCount(String scfCompany, Date frmDate, Date toDate) {

		return scfTradeDAO.getScfTradeByScfCompanyCount(scfCompany, frmDate, toDate);
	}

	public Long getScfTradeListWithSearchCount(String searchtxt, String RegNum) {

		return scfTradeDAO.getScfTradeListWithSearchCount(searchtxt, RegNum);
	}

	public List<SCFTrade> getAdminTradeListWithSearch(String searchtxt, Date fromDate, Date toDate, String value, int startIndex, int pageSize) {

		return scfTradeDAO.getAdminTradeListWithSearch(searchtxt, fromDate, toDate, value, startIndex, pageSize);
	}

	public Long getAdminTradeListWithSearchCount(String searchtxt, Date fromDate, Date toDate, String value) {

		return scfTradeDAO.getAdminTradeListWithSearchCount(searchtxt, fromDate, toDate, value);
	}

	public List<SCFTrade> getScfAdminTradeListWithSearch(
		long companyId, String searchtxt, Date fromDate, Date toDate, String value, int startIndex, int pageSize) {

		return scfTradeDAO.getScfAdminTradeListWithSearch(companyId, searchtxt, fromDate, toDate, value, startIndex, pageSize);
	}
	public Long getScfAdminTradeListWithSearchCount(long companyId, String searchtxt, Date fromDate, Date toDate, String value) {
		return scfTradeDAO.getScfAdminTradeListWithSearchCount(companyId, searchtxt, fromDate, toDate, value);
	}

}
