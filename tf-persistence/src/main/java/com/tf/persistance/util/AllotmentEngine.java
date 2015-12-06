package com.tf.persistance.util;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.tf.dao.InvestorDAO;
import com.tf.model.Allotment;
import com.tf.model.SCFTrade;

public class AllotmentEngine {
	
	@Autowired
	private InvestorDAO investorDAO;
	
	public List<InvestorProtfolioDTO> tradeAllotment(List<InvestorProtfolioDTO> investorsList,SCFTrade trade){

		List<InvestorProtfolioDTO> investors = investorsList;
		Allotment allotment ; 

		List<Allotment> allotments = new ArrayList<Allotment>(); 

		BigDecimal currentAllotment = BigDecimal.ZERO; 
		int sameRateCount = 0; 

		BigDecimal tradeAmount = trade.getTradeAmount(); 
		BigDecimal pendingAllotment = tradeAmount; 

		for (InvestorProtfolioDTO investor : investors) {

			if(sameRateCount == 0 ){
				sameRateCount = investor.getSameRateCount();
			}

			allotment = new Allotment(); 

			allotment.setInvestorPortfolio(investorDAO.findById(1l));
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

			investor.setAvailToInvest(investor.getAvailToInvest().subtract(currentAllotment));
			investor.setAmountInvested(investor.getAmountInvested().add(currentAllotment));
			
			allotment.setMarketDiscount(investor.getDiscountRate());
			allotment.setAllotmentAmount(currentAllotment);
			allotments.add(allotment);

			pendingAllotment = pendingAllotment.subtract(currentAllotment) ; 
			sameRateCount = sameRateCount - 1; 

			if(pendingAllotment.compareTo(BigDecimal.ZERO) == 0){
				break;
			}

		}
		System.out.println("************************************ ALLOTMENTS BEGIN ************************************** \n");
		for (Allotment altment : allotments) {
			System.out.println(altment.toString());
		}
		System.out.println("************************************ ALLOTMENTS END ************************************** \n ");

		return investors; 
	}

}
