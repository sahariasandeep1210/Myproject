package com.tf.persistance.util;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.tf.dao.InvestorDAO;
import com.tf.model.Allotment;
import com.tf.model.InvestorPortfolio;
import com.tf.model.SCFTrade;
import com.tf.model.SellerSetting;
import com.tf.service.InvestorService;
import com.tf.service.SettingService;

@Component
public class AllotmentEngine {
	
	private static final BigDecimal TEN_THOUSAND=new BigDecimal(10000);
	
	private static final BigDecimal YEAR=new BigDecimal(365);
	
	private static final BigDecimal HUNDRED=new BigDecimal(100);
	
	@Autowired
	private InvestorDAO investorDAO;
	
	@Autowired
	private InvestorService investorService;
	
	@Autowired
	private SettingService settingService;
	
	public List<Allotment> tradeAllotment(List<InvestorProtfolioDTO> investorsList,SCFTrade trade){

		List<InvestorProtfolioDTO> investors = investorsList;
		Allotment allotment ; 

		List<Allotment> allotments = new ArrayList<Allotment>(); 

		BigDecimal currentAllotment =		BigDecimal.ZERO; 
		
		BigDecimal investorTotalGross = 	BigDecimal.ZERO; 
		BigDecimal whitehallTotal =			BigDecimal.ZERO; 
		BigDecimal investorTotalNet =		BigDecimal.ZERO; 
		BigDecimal sellerFees =				BigDecimal.ZERO;		
		
		int sameRateCount = 0; 

		BigDecimal tradeAmount = trade.getTradeAmount(); 
		BigDecimal pendingAllotment = tradeAmount; 

		for (InvestorProtfolioDTO investor : investors) {

			if(sameRateCount == 0 ){
				sameRateCount = investor.getSameRateCount();
			}

			allotment = new Allotment(); 

			allotment.setInvestorPortfolio(investorDAO.loadInvestorPortfolio(investor.getInvestorProtId()));
			allotment.setScfTrade(trade);

			if(sameRateCount <= 1 ){

				if(investor.getAvailToInvest().compareTo(pendingAllotment) ==1){
					currentAllotment = pendingAllotment; 
				}else{
					currentAllotment = investor.getAvailToInvest();
				}
			}else if (sameRateCount > 1){

				currentAllotment = pendingAllotment.divide(new BigDecimal(sameRateCount)) ;
				if(investor.getAvailToInvest().compareTo(currentAllotment)==-1  ){
					currentAllotment = investor.getAvailToInvest();
				}
			}
			setInvestmentInfo(currentAllotment, investor);
			allotment.setNoOfdays(trade.getDuration());
			allotment.setMarketDiscount(investor.getDiscountRate());
			allotment.setAllotmentAmount(currentAllotment);
			allotment.setAllotmentDate(new Date());
			
			//Calculate investor and Whitehall Share
			allotment.setInvestorGrossProfit(calculateInvestorGrossProfit(currentAllotment,investor.getDiscountRate(),trade.getDuration()));
			allotment.setWhitehallProfitShare(calculateWhiteHallShare(allotment.getInvestorGrossProfit(),investorService.getWhiteHallShare(investor.getInvestorId())));
			allotment.setInvestorNetProfit(calculateInvestorNetProfit(allotment.getInvestorGrossProfit(),allotment.getWhitehallProfitShare()));
			allotments.add(allotment);
			
			investorTotalGross=investorTotalGross.add(allotment.getInvestorGrossProfit());
			whitehallTotal=whitehallTotal.add(allotment.getWhitehallProfitShare());
			investorTotalNet=investorTotalNet.add(allotment.getInvestorNetProfit());

			pendingAllotment = pendingAllotment.subtract(currentAllotment) ; 
			sameRateCount = sameRateCount - 1; 

			if(pendingAllotment.compareTo(BigDecimal.ZERO) == 0){
				break;
			}

		}
		
		System.out.println("************************************ ALLOTMENTS BEGIN ************************************** \n");
		
		//updating investment information
		for(InvestorProtfolioDTO investor : investors){
			InvestorPortfolio investorPortfolio=investorDAO.loadInvestorPortfolio(investor.getInvestorProtId());
			investorPortfolio.setAvailToInvest(investor.getAvailToInvest());
			investorPortfolio.setAmountInvested(investor.getAmountInvested());
		}
		sellerFees=calculateSellerFees(trade.getDuration(), tradeAmount);
		
		//setting back to Trade
		trade.setInvestorTotalGross(investorTotalGross);
		trade.setWhitehallTotalShare(whitehallTotal);
		trade.setInvestorTotalProfit(investorTotalNet);
		trade.setSellerFees(sellerFees);
		trade.setWhitehallTotalProfit(calculateWhitehallTotalProfit(whitehallTotal,sellerFees));
		trade.setWhitehallNetReceivable(calculateWhitehallTotalProfit(whitehallTotal,sellerFees));
		trade.setSellerNetAllotment(calculateSellerNetAllotment(tradeAmount,trade.getInvestorTotalProfit(),trade.getWhitehallNetReceivable()));
		System.out.println("Trade to update ::::::::::::::::::::::::::::::"+trade);
		
		return allotments; 
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
		BigDecimal invGrossProfit=((currentAllotment.multiply(new BigDecimal(discountRate))).divide(TEN_THOUSAND)).multiply(((new BigDecimal(duration)).divide(YEAR,6, RoundingMode.HALF_UP)));
		invGrossProfit.setScale(2, RoundingMode.CEILING);
		return invGrossProfit;
	}
	
	private BigDecimal calculateWhiteHallShare(BigDecimal invGrossProfit,BigDecimal profitPercentage){		
		BigDecimal whitehallProfit=(invGrossProfit.multiply(profitPercentage)).divide(HUNDRED);
		whitehallProfit.setScale(2, RoundingMode.CEILING);
		return whitehallProfit;
	}
	
	private BigDecimal calculateInvestorNetProfit(BigDecimal invGrossProfit,BigDecimal whitehallProfitShare){		
		BigDecimal investorNetProfit=invGrossProfit.subtract(whitehallProfitShare);
		investorNetProfit.setScale(2, RoundingMode.CEILING);
		return investorNetProfit;
	}
	
	private BigDecimal calculateSellerFees(Integer duration,BigDecimal tradeAmount){
		SellerSetting sellerSetting=settingService.getSellerSettings();
		BigDecimal sellerFees=((new BigDecimal(duration).multiply(sellerSetting.getSellerFinFee())).divide(TEN_THOUSAND,6, RoundingMode.HALF_UP)).multiply(tradeAmount);
		sellerFees.setScale(2, RoundingMode.CEILING);
		return sellerFees;
	}
	
	private BigDecimal calculateWhitehallTotalProfit(BigDecimal whitehallTotal,BigDecimal sellerFees){		
		BigDecimal WhitehallTotalProfit=whitehallTotal.add(sellerFees);
		WhitehallTotalProfit.setScale(2, RoundingMode.CEILING);
		return WhitehallTotalProfit;
	}
	
	private BigDecimal calculateSellerNetAllotment(BigDecimal tradeAmount,BigDecimal investorTotalProfit,BigDecimal WhitehallNetReceivable){		
		BigDecimal SellerNetAllotment=tradeAmount.subtract((investorTotalProfit.add(WhitehallNetReceivable)));
		SellerNetAllotment.setScale(2, RoundingMode.CEILING);
		return SellerNetAllotment;
	}


}
