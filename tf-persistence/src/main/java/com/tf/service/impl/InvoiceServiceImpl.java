package com.tf.service.impl;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.LinkedHashMap;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.joda.time.Days;
import org.joda.time.LocalDate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tf.dao.AllotmentDAO;
import com.tf.dao.InvestorDAO;
import com.tf.dao.InvoiceDAO;
import com.tf.dao.SCFTradeDAO;
import com.tf.dao.UserDAO;
import com.tf.model.Allotment;
import com.tf.model.Company;
import com.tf.model.Invoice;
import com.tf.model.SCFTrade;
import com.tf.persistance.util.AllotmentEngine;
import com.tf.persistance.util.InvestorProtfolioDTO;
import com.tf.persistance.util.InvoiceStatus;
import com.tf.persistance.util.TradeStatus;
import com.tf.service.InvoiceService;
import com.tf.service.SCFTradeService;

@Service
public class InvoiceServiceImpl implements InvoiceService{

	@Autowired
	private InvoiceDAO invoiceDAO;
	
	@Autowired
	private InvestorDAO investorDAO;
	
	@Autowired
	private SCFTradeDAO scfTradeDAO;
	
	@Autowired
	private UserDAO userDAO;
	
	@Autowired
	private SCFTradeService scfTradeService;	
	
	@Autowired
	private AllotmentEngine allotmentEngine;
	
	@Autowired
	private AllotmentDAO allotmentDAO;

	public void addInvoices(List<Invoice> invoice) {
		 invoiceDAO.addInvoices(invoice);
		
	}

	public List<Invoice> getInvoices() {
		List<Invoice> invoices=invoiceDAO.getInvoices();
		return invoices;
	}
	
	public Map<Company,BigDecimal> getInvoicesAmount(String invoiceIds){
		Map<Company,BigDecimal> invoiceInfoMap=new LinkedHashMap<Company,BigDecimal>();
		BigDecimal sumInvoiceAmt=new BigDecimal(0);
		Company company=null; 
		List<String> invoicesAmt=Arrays.asList(invoiceIds.split(","));
		List<Long> invoicesAmtactual=new ArrayList<Long>();
		for(String amount :invoicesAmt){ 
			invoicesAmtactual.add(Long.valueOf(amount));
		}
		List<Invoice> invoiceAmounts=invoiceDAO.getInvoicesAmount(invoicesAmtactual);
		for(Invoice invoice : invoiceAmounts){
			company =invoice.getScfCompany();
			sumInvoiceAmt = sumInvoiceAmt.add(invoice.getInvoiceAmount());
		}	
		invoiceInfoMap.put(company, sumInvoiceAmt);
		System.out.println("sumInvoiceAmt::::::"+sumInvoiceAmt);
		return invoiceInfoMap;
		
		
	}
	
	public Set<Invoice> getInvoices(String invoiceIds){
		
		List<String> idsList=Arrays.asList(invoiceIds.split(","));
		List<Long> idsListactual=new ArrayList<Long>();
		for(String id :idsList){ 
			idsListactual.add(Long.valueOf(id));
		}
		List<Invoice> invoices=invoiceDAO.getInvoicesAmount(idsListactual);
		Set<Invoice> invoiceSet = new LinkedHashSet<Invoice>(invoices);
		return invoiceSet;
		
	}
	
	public List<Invoice> getInvoices(long userId){
		long companyId=userDAO.getCompanyIDbyUserID(userId);
		return invoiceDAO.getInvoices(companyId);
	}

	
	public List<Invoice> getInvoicesByCompanyNumber(String companyNumber){
		return invoiceDAO.getInvoicesByCompanyNumber(companyNumber);
	}
	
	public List<Invoice> getInvoicesByCompanyNoAndStatus(String companyNumber,String status){
		return invoiceDAO.getInvoicesByCompanyNoAndStatus(companyNumber,status);
	}
	
	
	public void updateInvoicesStatus(List<String> invoiceIds,String status){
		Invoice invoice;
		List<Invoice> invoicesList=new ArrayList<Invoice>();
		for(String id :invoiceIds){ 
			invoice=invoiceDAO.findById(Long.valueOf(id));
			invoice.setStatus(status);
			invoicesList.add(invoice);			
		}
		
		invoiceDAO.updateInvoices(invoicesList);
		
	}
	
	public void updateInvoicesStatusWithTrade(List<String> invoiceIds,String status,Long tradeLong){
		Invoice invoice;
		List<Invoice> invoicesList=new ArrayList<Invoice>();
		for(String id :invoiceIds){ 
			invoice=invoiceDAO.findById(Long.valueOf(id));
			
			invoice.setScfTrade(scfTradeDAO.findById(tradeLong));
			invoice.setStatus(status);
			invoicesList.add(invoice);			
		}
		
		invoiceDAO.updateInvoices(invoicesList);
		
	}
	
	@Transactional
	public void triggerAllotment(List<String> invoiceIds){		
		Date date=new Date();
		Company company=null;
		Invoice invoice;
		Date paymentdate=null;
		int duration=0;
		BigDecimal tradeAmount=BigDecimal.ZERO;
		List<Date> holidayList =new ArrayList<Date>();
		List<Invoice> invoicesList=new ArrayList<Invoice>();
		for(String id :invoiceIds){ 
			invoice=invoiceDAO.findById(Long.valueOf(id));
			company=invoice.getScfCompany();
			paymentdate=invoice.getPayment_date();
			duration=invoice.getDuration();
			tradeAmount=tradeAmount.add(invoice.getInvoiceAmount());
			invoicesList.add(invoice);			
		}		
		SCFTrade scfTrade = new SCFTrade();
		//dates logic
		scfTrade.setOpeningDate(date);
		scfTrade.setSellerPaymentDate(nextWorkingDate(date, holidayList));
		scfTrade.setInvestorPaymentDate(nextWorkingDate(paymentdate, holidayList));
		//Days duration= Days.daysBetween(new LocalDate(scfTrade.getOpeningDate()), new LocalDate(scfTrade.getInvestorPaymentDate()));
		scfTrade.setDuration(duration);
		scfTrade.setClosingDate(nextWorkingDate(scfTrade.getInvestorPaymentDate(), holidayList));
		
		scfTrade.setCompany(company);
		scfTrade.setCreateDate(new Date());
		scfTrade.setStatus(TradeStatus.NEW.getValue());
		scfTrade.setTradeAmount(tradeAmount);
		scfTrade.setTradeNotes("Finance requested by Supplier");
		scfTrade.setInvoices(new HashSet<Invoice>(invoicesList));
		scfTrade = scfTradeService.save(scfTrade);
		updateTradeinfoToInvovices(invoicesList, scfTrade);
		List<InvestorProtfolioDTO> list=investorDAO.findInvestorByRate(company.getId());
		list=getSameRateCountStamp(list);
		List<Allotment> allotments = allotmentEngine.tradeAllotment(list, scfTrade);
		System.out.println("------------------------------------------------------------------------------------)");
		for(Allotment allotment : allotments){
			System.out.println("allotment::::::::"+allotment);
			allotmentDAO.saveEntity(allotment);
		}	
		//now allotment is done so changing trade status to Live
		scfTrade.setStatus(TradeStatus.LIVE.getValue());
		scfTradeService.update(scfTrade);
		System.out.println("************************************ ALLOTMENTS END ************************************** \n ");	
	}

	private void updateTradeinfoToInvovices(List<Invoice> invoicesList,
			SCFTrade scfTrade) {
		for(Invoice inv: invoicesList){
			inv.setStatus(InvoiceStatus.TRADE_GENERATED.toString());
			inv.setScfTrade(scfTrade);
		}
	}
	 
	private List<InvestorProtfolioDTO> getSameRateCountStamp(
			List<InvestorProtfolioDTO> list) {

		List<InvestorProtfolioDTO> newInvestorList = new ArrayList<InvestorProtfolioDTO>();
		Map<Integer, Integer> investorRateMap = new HashMap<Integer, Integer>();

		int count = 1;

		for (InvestorProtfolioDTO investorPortfolio : list) {

			if (investorRateMap
					.containsKey(investorPortfolio.getDiscountRate())) {
				investorRateMap.put(investorPortfolio.getDiscountRate(),
						++count);
			} else {
				count = 1;
				investorRateMap.put(investorPortfolio.getDiscountRate(), count);
			}
		}

		for (InvestorProtfolioDTO investorPortfolio : list) {
			  if(investorPortfolio.getAvailToInvest().compareTo(BigDecimal.ZERO)==1){

					investorPortfolio.setSameRateCount(investorRateMap
							.get(investorPortfolio.getDiscountRate()));
					newInvestorList.add(investorPortfolio);
			  }
		}

		return newInvestorList;

	}
	
	private  Date nextWorkingDate(Date date,List<Date> holidayList) {
		Calendar c = Calendar.getInstance();
		c.setTime(date);
		c.add(Calendar.DATE, 1);
		int dayOfWeek = 0;
		int i=0;
		while(i<1){
			dayOfWeek = c.get(Calendar.DAY_OF_WEEK);
			if(dayOfWeek==1 || dayOfWeek==7 || holidayList.contains(c.getTime())){
				c.add(Calendar.DATE, 1);
			}else{
				i=1;
			}			
		}
		return c.getTime();		
	}
	public List<Invoice> findByRegNum(String regNum) {
		return invoiceDAO.findByRegNum(regNum);
	}

	
	
}
