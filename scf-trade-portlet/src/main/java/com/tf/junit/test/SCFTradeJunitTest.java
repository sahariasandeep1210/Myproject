package com.tf.junit.test;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;


import com.tf.model.Company;
import com.tf.model.SCFTrade;
import com.tf.service.CompanyService;
import com.tf.service.InvoiceService;
import com.tf.service.SCFTradeService;


  @Configuration
  @ComponentScan(basePackages={"com.tf.service.impl","com.tf.service"})
   class SpringTestContext{
	  
  }

 @RunWith(SpringJUnit4ClassRunner.class)
 @ContextConfiguration(classes = SpringTestContext.class)
public class SCFTradeJunitTest {

	 @Autowired InvoiceService invoiceService;
	 @Autowired CompanyService companyService;
	 @Autowired SCFTradeService scfTradeService;
	 
	 @Test
	 public void retrieveTradeDetail(){
		 System.out.println("Invoice List in testing " );
	    Long tradeID = 29098L;
		String sellerRegNo = invoiceService.getSellerRegNumberByTradeID(tradeID);
		Company company = companyService.getCompaniesByRegNum(sellerRegNo);
		
		SCFTrade scfTrade = scfTradeService.findById(tradeID);
		
		System.out.println("Invoice List in testing " +scfTrade.getInvoices());
	 }
	
}
