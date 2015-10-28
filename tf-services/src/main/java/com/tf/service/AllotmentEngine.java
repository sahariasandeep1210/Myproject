package com.tf.service;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class AllotmentEngine {

	public List<InvestorPortfolio> tradeAllotment(Trade trade, List<InvestorPortfolio> investorsList){

		List<InvestorPortfolio> investors = getSortedList(investorsList);
		AllotmentsRegister allotmentsRegister ; 

		List<AllotmentsRegister> allotments = new ArrayList<AllotmentsRegister>(); 

		int currentAllotment = 0; int sameRateCount = 0; int id = 100; 

		int tradeAmount = trade.getAmount(); int tradeId = trade.getTradeId();
		int pendingAllotment = tradeAmount; 

		for (InvestorPortfolio investor : investors) {

			if(sameRateCount == 0 ){
				sameRateCount = investor.getSameRateCount();
			}

			allotmentsRegister = new AllotmentsRegister(); 

			allotmentsRegister.setInvestorId(investor.getInvestorId());
			allotmentsRegister.setAllotmentId(id++);
			allotmentsRegister.setTradeId(tradeId);

			if(sameRateCount <= 1 ){

				if(investor.getAvailableAmt() > pendingAllotment){
					currentAllotment = pendingAllotment; 
				}else{
					currentAllotment = investor.getAvailableAmt();
				}
			}else if (sameRateCount > 1){

				currentAllotment = pendingAllotment /sameRateCount ;
				if(investor.getAvailableAmt() < currentAllotment){
					currentAllotment = investor.getAvailableAmt();
				}
			}

			investor.setAvailableAmt(investor.getAvailableAmt() - currentAllotment);
			investor.setAllotedAmt(investor.getAllotedAmt() + currentAllotment);
			
			allotmentsRegister.setRate(investor.getRate());
			allotmentsRegister.setAllotmentAmount(currentAllotment);
			allotments.add(allotmentsRegister);

			pendingAllotment = pendingAllotment - currentAllotment ; 
			sameRateCount = sameRateCount - 1; 

			if(pendingAllotment == 0){
				break;
			}

		}
		System.out.println("************************************ ALLOTMENTS BEGIN ************************************** \n");
		for (AllotmentsRegister allotment : allotments) {
			System.out.println(allotment.toString());
		}
		System.out.println("************************************ ALLOTMENTS END ************************************** \n ");

		return investors; 
	}

	private List<InvestorPortfolio> getSortedList(List<InvestorPortfolio> allInvestors) {

		List<InvestorPortfolio> investors = new ArrayList<InvestorPortfolio>(); 

		for (InvestorPortfolio investorPortfolio : allInvestors) {

			if(investorPortfolio.getAvailableAmt() > 0){
				investors.add(investorPortfolio);
			}
		}

		Collections.sort(investors, new RateComparator());
		Collections.sort(investors, new AvailableAmountComparator()); 
		investors = getSameRateCountStamp(investors);

		System.out.println("Availbale Investors And Rate \n");
		for (InvestorPortfolio investorPortfolio : investors) {
			System.out.println(investorPortfolio.toString());
		}

		return investors;
	}

	private List<InvestorPortfolio> getSameRateCountStamp(List<InvestorPortfolio> investors) {

		List<InvestorPortfolio> newInvestorList = new ArrayList<InvestorPortfolio>(); 
		Map<Integer, Integer> investorRateMap = new HashMap<Integer, Integer> ();
		
		int count = 1 ; 
		
		for (InvestorPortfolio investorPortfolio : investors) {
			
			if(investorRateMap.containsKey(investorPortfolio.getRate())){
				investorRateMap.put(investorPortfolio.getRate(), ++count);
			}else{
				count = 1 ;
				investorRateMap.put(investorPortfolio.getRate(), count);
			}
		}
		
		for (InvestorPortfolio investorPortfolio : investors) {
			
			investorPortfolio.setSameRateCount(investorRateMap.get(investorPortfolio.getRate()));
			newInvestorList.add(investorPortfolio);
		}
		
		 
		return newInvestorList; 

	}
}
