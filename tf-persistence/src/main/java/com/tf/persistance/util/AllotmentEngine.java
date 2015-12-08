package com.tf.persistance.util;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.tf.dao.InvestorDAO;
import com.tf.model.Allotment;
import com.tf.model.InvestorPortfolio;
import com.tf.model.SCFTrade;

@Component
public class AllotmentEngine {
	
	@Autowired
	private InvestorDAO investorDAO;
	
	public List<Allotment> tradeAllotment(List<InvestorProtfolioDTO> investorsList,SCFTrade trade){

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
			
			allotment.setMarketDiscount(investor.getDiscountRate());
			allotment.setAllotmentAmount(currentAllotment);
			allotment.setAllotmentDate(new Date());
			allotments.add(allotment);

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

}
