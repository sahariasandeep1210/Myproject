package com.tf.persistance.util;

import java.math.BigDecimal;
import java.math.MathContext;
import java.math.RoundingMode;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.tf.dao.AllotmentDAO;
import com.tf.dao.InvestorDAO;
import com.tf.dao.InvestorTransactionDAO;
import com.tf.dao.TradeAuditDAO;
import com.tf.model.Allotment;
import com.tf.model.GeneralSetting;
import com.tf.model.InvestorPortfolio;
import com.tf.model.InvestorTransaction;
import com.tf.model.SCFTrade;
import com.tf.model.SellerSetting;
import com.tf.model.TradeAudit;
import com.tf.service.GeneralSettingService;
import com.tf.service.InvestorService;
import com.tf.service.SettingService;

@Component
public class AllotmentEngine {
	
	private static final BigDecimal TEN_THOUSAND=new BigDecimal(10000);
	
	private static final BigDecimal YEAR=new BigDecimal(365);
	
	private static final BigDecimal HUNDRED=new BigDecimal(100);
	
	protected static final Logger _log = Logger.getLogger(AllotmentEngine.class);
	
	@Autowired
	private InvestorDAO investorDAO;
	
	@Autowired
	private InSuffcientFund fund ;
	
	@Autowired
	private InvestorService investorService;
	
	@Autowired
	private SettingService settingService;
	
	@Autowired
	private GeneralSettingService generalSettingService ;
	
	@Autowired
	private AllotmentDAO allotmentDAO;
	
	@Autowired
	private TradeAuditDAO tradeAuditDAO;
	
	@Autowired
	private InvestorTransactionDAO investorTransactionDAO;
	
	public void  tradeAllotment(List<InvestorProtfolioDTO> investorsList,SCFTrade trade,long sellerCmpId,long userId) throws InSuffcientFund{
	    
	    	_log.info("Investor List --------- "+investorsList);
		List<InvestorProtfolioDTO> investors = investorsList;
		Allotment allotment ; 
		InvestorTransaction invTranscation;

		List<Allotment> allotments				  = new ArrayList<Allotment>(); 
		List<InvestorTransaction> invTranscations = new ArrayList<InvestorTransaction>(); 

		BigDecimal currentAllotment =		BigDecimal.ZERO;		
		BigDecimal investorTotalGross = 	BigDecimal.ZERO; 
		BigDecimal whitehallTotal =		BigDecimal.ZERO; 
		BigDecimal investorTotalNet =		BigDecimal.ZERO; 
		BigDecimal sellerFees =			BigDecimal.ZERO;		
		SellerSetting sellerSetting = null;
		GeneralSetting generalSetting = null;
		int sameRateCount = 0; 

		BigDecimal tradeAmount = trade.getTradeAmount(); 
		BigDecimal pendingAllotment = tradeAmount; 

		for (InvestorProtfolioDTO investor : investors) {

			if(sameRateCount == 0 ){
				sameRateCount = investor.getSameRateCount();
			}

			allotment = new Allotment(); 
			invTranscation=new InvestorTransaction();
			

			allotment.setInvestorPortfolio(investorDAO.loadInvestorPortfolio(investor.getInvestorProtId()));
			allotment.setScfTrade(trade);
			allotment.setInvestorID(investor.getInvestorId());
			invTranscation.setTradeID(trade.getId());
			invTranscation.setScfTradeId(trade.getScfId());

			if(sameRateCount <= 1 ){

				if(investor.getAvailToInvest().compareTo(pendingAllotment) ==1){
					currentAllotment = pendingAllotment; 
				}else{
					currentAllotment = investor.getAvailToInvest();
				}
			}else if (sameRateCount > 1){

				currentAllotment = pendingAllotment.divide(new BigDecimal(sameRateCount),2, RoundingMode.HALF_UP) ;
				if(investor.getAvailToInvest().compareTo(currentAllotment)==-1  ){
					currentAllotment = investor.getAvailToInvest();
				}
			}
			
			_log.info("CurrentAllotment --------- "+currentAllotment);
			
			Date date=new Date();
			setInvestmentInfo(currentAllotment, investor);
			allotment.setNoOfdays(trade.getDuration());
			allotment.setMarketDiscount(investor.getDiscountRate());
			allotment.setAllotmentAmount(currentAllotment);
			allotment.setAllotmentDate(new Date());
			allotment.setStatus(TranscationStatus.ALLOTED.getValue());			
			//Calculate investor and Whitehall Share
			allotment.setInvestorGrossProfit(calculateInvestorGrossProfit(currentAllotment,investor.getDiscountRate(),trade.getDuration()));
			allotment.setWhitehallProfitShare(calculateWhiteHallShare(allotment.getInvestorGrossProfit(),investorService.getWhiteHallShare(investor.getInvestorId())));
			allotment.setInvestorNetProfit(calculateInvestorNetProfit(allotment.getInvestorGrossProfit(),allotment.getWhitehallProfitShare()));
			allotments.add(allotment);
			
			// adding transaction information
			invTranscation.setAmount(currentAllotment);
			invTranscation.setInvestorID(investor.getInvestorId());
			invTranscation.setReference("Trade Allotment");
			invTranscation.setTranscationDate(date);
			invTranscation.setTranscationType(TranscationStatus.ALLOTED.getValue());
			invTranscations.add(invTranscation);
			
			investorTotalGross=investorTotalGross.add(allotment.getInvestorGrossProfit());
			whitehallTotal=whitehallTotal.add(allotment.getWhitehallProfitShare());
			investorTotalNet=investorTotalNet.add(allotment.getInvestorNetProfit());

			pendingAllotment = pendingAllotment.subtract(currentAllotment) ; 
			sameRateCount = sameRateCount - 1; 
			_log.info("Pending Allotment --------- "+pendingAllotment);
			if(pendingAllotment.compareTo(BigDecimal.ZERO) == 0){
				break;
			}

		}
		
		//At this time pending allotment should be 0 if not it means insufficient allotment 
		 if (pendingAllotment.compareTo(BigDecimal.ZERO)  > 0 ){				
				throw new InSuffcientFund("Finance allotment failed for <SCF Company Name>'s  invoice.Please contact whileHall admin for more details.");			
		}
		
	
		
		//updating investment information
		for(InvestorProtfolioDTO investor : investors){
			InvestorPortfolio investorPortfolio=investorDAO.loadInvestorPortfolio(investor.getInvestorProtId());
			investorPortfolio.setAvailToInvest(investor.getAvailToInvest());
			investorPortfolio.setAmountInvested(investor.getAmountInvested());
		}
		sellerSetting=settingService.getSellerSetting(sellerCmpId);

		if( sellerSetting != null){
		    sellerFees=calculateSellerFees(trade.getDuration(), tradeAmount,sellerSetting);
		}else{
		    generalSetting=generalSettingService.getGeneralSetting();
			sellerFees=calculateSellerFeesByGeneralSetting(trade.getDuration(), tradeAmount,generalSetting);
		}
		//setting back to Trade
		trade.setInvestorTotalGross(investorTotalGross);
		trade.setWhitehallTotalShare(whitehallTotal);
		trade.setInvestorTotalProfit(investorTotalNet);
		trade.setSellerFees(sellerFees);
		if(sellerSetting != null){
		  trade.setSellerTransFee(sellerSetting.getSellerTransFee());
		}else{
			trade.setSellerTransFee(generalSetting.getSellerTransFee());
		}
		trade.setWhitehallTotalProfit(calculateWhitehallTotalProfit(whitehallTotal,sellerFees,trade.getSellerTransFee()));
		//here we need to add VAT as well
		trade.setWhitehallNetReceivable(calculateWhitehallTotalProfit(whitehallTotal,sellerFees,trade.getSellerTransFee()));
		trade.setSellerNetAllotment(calculateSellerNetAllotment(tradeAmount,trade.getInvestorTotalProfit(),trade.getWhitehallNetReceivable()));
		
		
		//saving allotment information to database
		for(Allotment altment : allotments){
			allotmentDAO.saveEntity(altment);
		}	
		
		//saving transaction information
		
		for(InvestorTransaction investorTransaction : invTranscations){
			investorTransactionDAO.saveEntity(investorTransaction);
		}
		
			saveTradeAudit(trade, userId, sellerSetting,generalSetting);
		
	}



	private void setInvestmentInfo(BigDecimal currentAllotment,InvestorProtfolioDTO investor) {
		if(investor.getAvailToInvest()==null){
			investor.setAvailToInvest(BigDecimal.ZERO);
		}if(investor.getAmountInvested()==null){
			investor.setAmountInvested(BigDecimal.ZERO);
		}if(currentAllotment==null){
			currentAllotment=BigDecimal.ZERO;
		}
		investor.setAvailToInvest(investor.getAvailToInvest().subtract(currentAllotment));
		investor.setAmountInvested(investor.getAmountInvested().add(currentAllotment));
	}
	
	private BigDecimal calculateInvestorGrossProfit(BigDecimal currentAllotment,Integer discountRate,Integer duration){		
		BigDecimal invGrossProfit=((currentAllotment.multiply(new BigDecimal(discountRate),new MathContext(6, RoundingMode.HALF_EVEN))).divide(TEN_THOUSAND)).multiply(((new BigDecimal(duration)).divide(YEAR,6, RoundingMode.HALF_EVEN)));
		invGrossProfit.setScale(4, RoundingMode.HALF_EVEN);
		_log.info("Investor Gross Profit --------- "+invGrossProfit);
		return invGrossProfit;
	}
	
	private BigDecimal calculateWhiteHallShare(BigDecimal invGrossProfit,BigDecimal profitPercentage){		
		BigDecimal whitehallProfit=(invGrossProfit.multiply(profitPercentage, new MathContext(6, RoundingMode.HALF_EVEN))).divide(HUNDRED, 6, RoundingMode.HALF_EVEN);
		whitehallProfit.setScale(2, RoundingMode.HALF_EVEN);
		_log.info("WhiteHallShare --------- "+whitehallProfit);
		return whitehallProfit;
	}
	
	private BigDecimal calculateInvestorNetProfit(BigDecimal invGrossProfit,BigDecimal whitehallProfitShare){		
		BigDecimal investorNetProfit=invGrossProfit.subtract(whitehallProfitShare);
		investorNetProfit.setScale(2, RoundingMode.HALF_EVEN);
		_log.info("Investor Net Profit --------- "+investorNetProfit);
		return investorNetProfit;
	}
	
	private BigDecimal calculateSellerFees(Integer duration,BigDecimal tradeAmount,SellerSetting sellerSetting){		
		BigDecimal sellerFees=((new BigDecimal(duration).multiply(sellerSetting.getSellerFinFee(), new MathContext(6, RoundingMode.HALF_EVEN))).divide(TEN_THOUSAND,6, RoundingMode.HALF_EVEN)).multiply(tradeAmount, new MathContext(6, RoundingMode.HALF_EVEN));
		sellerFees.setScale(6, RoundingMode.HALF_EVEN);
		_log.info("Seller fees without general settings :"+sellerFees);
		return sellerFees;
	}
	private BigDecimal calculateSellerFeesByGeneralSetting(Integer duration,BigDecimal tradeAmount,GeneralSetting generalSetting){		
		BigDecimal sellerFees=((new BigDecimal(duration).multiply(generalSetting.getSellerFinFee(),  new MathContext(6, RoundingMode.HALF_EVEN)))).divide(TEN_THOUSAND,6, RoundingMode.HALF_EVEN).multiply(tradeAmount, new MathContext(6, RoundingMode.HALF_EVEN));
		sellerFees.setScale(2, RoundingMode.HALF_EVEN);
		_log.info("Seller fees with general settings :"+sellerFees);
		return sellerFees;
	}
	
	private BigDecimal calculateWhitehallTotalProfit(BigDecimal whitehallTotal,BigDecimal sellerFees,BigDecimal sellerTransFee){		
		BigDecimal whitehallTotalProfit=whitehallTotal.add(sellerFees).add(sellerTransFee);
		whitehallTotalProfit.setScale(2, RoundingMode.HALF_EVEN);
		_log.info("Whitehall total profit :"+whitehallTotalProfit);
		return whitehallTotalProfit;
	}
	
	private BigDecimal calculateSellerNetAllotment(BigDecimal tradeAmount,BigDecimal investorTotalProfit,BigDecimal WhitehallNetReceivable){		
		BigDecimal sellerNetAllotment=tradeAmount.subtract((investorTotalProfit.add(WhitehallNetReceivable)));
		sellerNetAllotment.setScale(2, RoundingMode.HALF_EVEN);
		_log.info("Seller net allotment :"+sellerNetAllotment);
		return sellerNetAllotment;
	}
	
	private void saveTradeAudit(SCFTrade trade, long userId,
			SellerSetting sellerSetting,GeneralSetting setting) {
	    	_log.info("Start adding Tarde audit for trade id :"+ trade.getScfId());
		//creating trade audit
		TradeAudit tradeAudit=new TradeAudit();
		tradeAudit.setCreateDate(new Date());
		tradeAudit.setTradeID(trade.getId());
		if(sellerSetting != null){
		tradeAudit.setSellerFinFee(sellerSetting.getSellerFinFee());
		tradeAudit.setSellerTransFee(sellerSetting.getSellerTransFee());
		}else{
			tradeAudit.setSellerFinFee(setting.getSellerFinFee());
			tradeAudit.setSellerTransFee(setting.getSellerTransFee());
		}
		tradeAudit.setUserID(userId);
		tradeAuditDAO.saveEntity(tradeAudit);
		_log.info("completed Tarde audit for tarde id : " + trade.getScfId());
	}
	
	
	public void  checkActualAllotment(List<InvestorProtfolioDTO> investorsList,SCFTrade trade,long sellerCmpId,long userId) throws InSuffcientFund{

		List<InvestorProtfolioDTO> investors = investorsList;
		
		BigDecimal currentAllotment =		BigDecimal.ZERO; 		
		BigDecimal investorTotalGross = 	BigDecimal.ZERO; 
		BigDecimal whitehallTotal =		BigDecimal.ZERO; 
		BigDecimal investorTotalNet =		BigDecimal.ZERO; 
		BigDecimal sellerFees =			BigDecimal.ZERO;
		BigDecimal investorGrossProfit=		BigDecimal.ZERO;
		BigDecimal whiteHallShare=		BigDecimal.ZERO;
		SellerSetting sellerSetting = null;
		GeneralSetting generalSetting = null;
		int sameRateCount = 0; 

		BigDecimal tradeAmount = trade.getTradeAmount(); 
		BigDecimal pendingAllotment = tradeAmount; 

		for (InvestorProtfolioDTO investor : investors) {

			if(sameRateCount == 0 ){
				sameRateCount = investor.getSameRateCount();
			}
			

			if(sameRateCount <= 1 ){

				if(investor.getAvailToInvest().compareTo(pendingAllotment) ==1){
					currentAllotment = pendingAllotment; 
				}else{
					currentAllotment = investor.getAvailToInvest();
				}
			}else if (sameRateCount > 1){

				currentAllotment = pendingAllotment.divide(new BigDecimal(sameRateCount),2, RoundingMode.HALF_UP) ;
				if(investor.getAvailToInvest().compareTo(currentAllotment)==-1  ){
					currentAllotment = investor.getAvailToInvest();
				}
			}
			
			setInvestmentInfo(currentAllotment, investor);					
			investorGrossProfit=calculateInvestorGrossProfit(currentAllotment,investor.getDiscountRate(),trade.getDuration());
			whiteHallShare=calculateWhiteHallShare(investorGrossProfit,investorService.getWhiteHallShare(investor.getInvestorId()));		
			
			investorTotalGross=investorTotalGross.add(investorGrossProfit);
			whitehallTotal=whitehallTotal.add(whiteHallShare);
			investorTotalNet=investorTotalNet.add(calculateInvestorNetProfit(investorGrossProfit,whiteHallShare));

			pendingAllotment = pendingAllotment.subtract(currentAllotment) ; 
			sameRateCount = sameRateCount - 1; 

			if(pendingAllotment.compareTo(BigDecimal.ZERO) == 0){
				break;
			}

		}
		
		//At this time pending allotment should be 0 if not it means insufficient allotment 
		 if (pendingAllotment.compareTo(BigDecimal.ZERO)  > 0 ){				
				throw new InSuffcientFund("Finance allotment failed for <SCF Company Name>'s  invoice.Please contact whileHall admin for more details.");			
		}		
		
		sellerSetting=settingService.getSellerSetting(sellerCmpId);

		if( sellerSetting != null){
		    sellerFees=calculateSellerFees(trade.getDuration(), tradeAmount,sellerSetting);
		}else{
		    generalSetting=generalSettingService.getGeneralSetting();
		    sellerFees=calculateSellerFeesByGeneralSetting(trade.getDuration(), tradeAmount,generalSetting);
		}
		//setting back to Trade
		trade.setInvestorTotalGross(investorTotalGross);
		trade.setWhitehallTotalShare(whitehallTotal);
		trade.setInvestorTotalProfit(investorTotalNet);
		trade.setSellerFees(sellerFees);
		if(sellerSetting != null){
		    trade.setSellerTransFee(sellerSetting.getSellerTransFee());
		}else{
		    trade.setSellerTransFee(generalSetting.getSellerTransFee());
		}
		trade.setWhitehallTotalProfit(calculateWhitehallTotalProfit(whitehallTotal,sellerFees,trade.getSellerTransFee()));
		//here we need to add VAT as well
		trade.setWhitehallNetReceivable(calculateWhitehallTotalProfit(whitehallTotal,sellerFees,trade.getSellerTransFee()));
		trade.setSellerNetAllotment(calculateSellerNetAllotment(tradeAmount,trade.getInvestorTotalProfit(),trade.getWhitehallNetReceivable()));		
		
	}

	 

}
