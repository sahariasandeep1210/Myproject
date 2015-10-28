package com.tf;

import java.util.ArrayList;
import java.util.List;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import com.tf.service.AllotmentEngine;
import com.tf.service.InvestorPortfolio;
import com.tf.service.Trade;

public class AllotmentsTest  {

	List<InvestorPortfolio> investors;
	AllotmentEngine engine ; 
	
	@Before
	public void intiateTest () throws Exception {
		investors = getInvestors() ;
		System.out.println("**********************************************************************************************");
	}
	
	@After
	public void tearDown () throws Exception {
 		System.out.println("**********************************************************************************************");
	}
	
	@Test
	public void testTradeAllotment_50000() throws Exception 
	{ 
		
		Trade trade = new Trade(101, 100232, 50000); 
		engine = new AllotmentEngine(); 
		
		List<InvestorPortfolio> investorAllotments = engine.tradeAllotment(trade, investors);
		
		System.out.println("Investors Portfolio After Allotments of first Invoice of " + trade.getAmount());
		for (InvestorPortfolio investorPortfolio : investorAllotments) {
			
			System.out.println(investorPortfolio.toString()); 
		}
	}
	
	@Test
	public void testTradeAllotment_80000() throws Exception 
	{ 
		
		Trade trade = new Trade(101, 100232, 80000); 
		engine = new AllotmentEngine(); 
		
		List<InvestorPortfolio> investorAllotments = engine.tradeAllotment(trade, investors);
		
		System.out.println("Investors Portfolio After Allotments of first Invoice of " + trade.getAmount());
		for (InvestorPortfolio investorPortfolio : investorAllotments) {
			
			System.out.println(investorPortfolio.toString()); 
		}
	}
	
	
	@Test
	public void testTradeAllotment_40000() throws Exception 
	{ 
		
		Trade trade = new Trade(101, 100232, 40000); 
		engine = new AllotmentEngine(); 
		
		List<InvestorPortfolio> investorAllotments = engine.tradeAllotment(trade, investors);
		
		System.out.println("Investors Portfolio After Allotments of first Invoice of " + trade.getAmount());
		for (InvestorPortfolio investorPortfolio : investorAllotments) {
			
			System.out.println(investorPortfolio.toString()); 
		}
	}
	
	@Test
	public void testTradeAllotment_100000() throws Exception 
	{ 
		
		Trade trade = new Trade(101, 100232, 100000); 
		engine = new AllotmentEngine(); 
		
		List<InvestorPortfolio> investorAllotments = engine.tradeAllotment(trade, investors);
		
		System.out.println("Investors Portfolio After Allotments of first Invoice of " + trade.getAmount());
		for (InvestorPortfolio investorPortfolio : investorAllotments) {
			
			System.out.println(investorPortfolio.toString()); 
		}
	}
	
	
	@Test
	public void testTradeAllotment_40000_50000_45000_5000() throws Exception 
	{ 
		engine = new AllotmentEngine(); 
		
		Trade trade = new Trade(101, 100232, 40000); 
		
		List<InvestorPortfolio> investorAllotments = engine.tradeAllotment(trade, investors);
		
		System.out.println("----------------  -------------------  Investors Portfolio After Allotments of first Invoice of " + trade.getAmount());
		for (InvestorPortfolio investorPortfolio : investorAllotments) {
			
			System.out.println(investorPortfolio.toString()); 
		}
		
		trade = new Trade(102, 100234, 50000); 
		
		investorAllotments = engine.tradeAllotment(trade, investorAllotments);
		
		System.out.println("----------------  -------------------  Investors Portfolio After Allotments of first Invoice of " + trade.getAmount());
		for (InvestorPortfolio investorPortfolio : investorAllotments) {
			
			System.out.println(investorPortfolio.toString()); 
		}
		
		trade = new Trade(102, 100234, 45000); 
		
		investorAllotments = engine.tradeAllotment(trade, investorAllotments);
		
		System.out.println("----------------  -------------------  Investors Portfolio After Allotments of first Invoice of " + trade.getAmount());
		for (InvestorPortfolio investorPortfolio : investorAllotments) {
			
			System.out.println(investorPortfolio.toString()); 
		}
		trade = new Trade(102, 100234, 5000); 
		
		investorAllotments = engine.tradeAllotment(trade, investorAllotments);
		
		System.out.println("----------------  -------------------  Investors Portfolio After Allotments of first Invoice of " + trade.getAmount());
		for (InvestorPortfolio investorPortfolio : investorAllotments) {
			
			System.out.println(investorPortfolio.toString()); 
		}
	}
	
	

	private static List<InvestorPortfolio> getInvestors(){

		List<InvestorPortfolio> investors = new ArrayList<InvestorPortfolio>();
		
		InvestorPortfolio investor1  = new InvestorPortfolio(1001, 200000, 180000, 20000, 180);
		investors.add(investor1);
		
		InvestorPortfolio investor2  = new InvestorPortfolio(1002, 200000, 190000, 10000, 150);
		investors.add(investor2);

		InvestorPortfolio investor3  = new InvestorPortfolio(1003, 200000, 180000, 20000, 150);
		investors.add(investor3);

		InvestorPortfolio investor4  = new InvestorPortfolio(1004, 200000, 150000, 50000, 150);
		investors.add(investor4);

		InvestorPortfolio investor5  = new InvestorPortfolio(1005, 200000, 190000, 10000, 140);
		investors.add(investor5);

		InvestorPortfolio investor6  = new InvestorPortfolio(1006, 200000, 180000, 20000, 140);
		investors.add(investor6);

		InvestorPortfolio investor7  = new InvestorPortfolio(1007, 200000, 190000, 10000, 130);
		investors.add(investor7);
		
		return investors;

	}


}
