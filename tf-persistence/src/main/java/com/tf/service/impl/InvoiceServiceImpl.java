package com.tf.service.impl;
import com.tf.dao.AllotmentDAO;
import com.tf.dao.InvestorDAO;
import com.tf.dao.InvoiceDAO;
import com.tf.dao.SCFTradeDAO;
import com.tf.dao.UserDAO;
import com.tf.model.Company;
import com.tf.model.GeneralSetting;
import com.tf.model.GenericListModel;
import com.tf.model.Invoice;
import com.tf.model.SCFTrade;
import com.tf.persistance.util.AllotmentEngine;
import com.tf.persistance.util.FinanceConfirmationDTO;
import com.tf.persistance.util.InSuffcientFund;
import com.tf.persistance.util.InvalidDuration;
import com.tf.persistance.util.InvestorProtfolioDTO;
import com.tf.persistance.util.InvoiceStatus;
import com.tf.persistance.util.TradeStatus;
import com.tf.service.GeneralSettingService;
import com.tf.service.InvoiceService;
import com.tf.service.SCFTradeService;

import java.math.BigDecimal;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
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

import org.apache.commons.lang.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class InvoiceServiceImpl implements InvoiceService {
    
    	protected static final Log _log = LogFactory.getLog(InvoiceServiceImpl.class);

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
	
	@Autowired
	protected GeneralSettingService generalSettingService;

	public void addInvoices(List<Invoice> invoice) {		 
		 invoiceDAO.addInvoices(invoice);		 
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
	
	@Transactional(rollbackFor={Exception.class,InSuffcientFund.class,InvalidDuration.class})
	public Date triggerAllotment(List<String> invoiceIds,long sellerCmpId,long userId) throws InSuffcientFund, InvalidDuration   {	
	    
	    	_log.info("InvoiceServiceImpl >>> Entering triggerAllotment-----------------");
		Date date=new Date();
		Company company=null;
		Invoice invoice;
		Date paymentdate=null;
		Date financedate=null;
		
		BigDecimal tradeAmount=BigDecimal.ZERO;
		List<Date> holidayList =new ArrayList<Date>();
		List<Invoice> invoicesList=new ArrayList<Invoice>();
		for(String id :invoiceIds){ 
			invoice=invoiceDAO.findById(Long.valueOf(id));
			invoice.setFinanceDate(nextWorkingDate(date,holidayList));
			company=invoice.getScfCompany();
			paymentdate=invoice.getPayment_date();
			financedate=invoice.getFinanceDate();
			invoice.setDuration(duration(paymentdate,financedate));
			tradeAmount=tradeAmount.add(invoice.getInvoiceAmount());
			invoicesList.add(invoice);			
		}		
		SCFTrade scfTrade = new SCFTrade();
		String name=company.getName();
		scfTrade.setScfId(generateId(date, name));
		//dates logic
	//dates logic
		scfTrade.setOpeningDate(date);
		scfTrade.setSellerPaymentDate(nextWorkingDate(date, holidayList));
		scfTrade.setInvestorPaymentDate(nextWorkingDate(paymentdate, holidayList));
		//Days duration= Days.daysBetween(new LocalDate(scfTrade.getOpeningDate()), new LocalDate(scfTrade.getInvestorPaymentDate()));
		scfTrade.setDuration(duration(paymentdate,financedate));
		scfTrade.setClosingDate(nextWorkingDate(scfTrade.getInvestorPaymentDate(), holidayList));
		
		scfTrade.setCompany(company);
		scfTrade.setCreateDate(date);
		scfTrade.setUpdatDate(date);
		scfTrade.setStatus(TradeStatus.NEW.getValue());
		scfTrade.setTradeAmount(tradeAmount);
		scfTrade.setTradeNotes("Finance requested by Supplier");
		scfTrade.setInvoices(new HashSet<Invoice>(invoicesList));
		scfTrade = scfTradeService.save(scfTrade);
		_log.info("Trade Information --------------"+scfTrade);
		updateTradeinfoToInvovices(invoicesList, scfTrade);
		List<InvestorProtfolioDTO> list=investorDAO.findInvestorByRate(company.getId());
		list=getSameRateCountStamp(list);
		allotmentEngine.tradeAllotment(list, scfTrade,sellerCmpId,userId);
	
		//now allotment is done so changing trade status to Live
		scfTrade.setStatus(TradeStatus.LIVE.getValue());
		scfTradeService.updateTrade(scfTrade);
	
		_log.info("************************************ ALLOTMENTS END ************************************** \n ");
		_log.info("InvoiceServiceImpl >>> Exit triggerAllotment-----------------");
		return financedate;

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
        
        	System.out.println("Old List::"+list);
        	for (InvestorProtfolioDTO investorPortfolio : list) {
        
        		if (investorRateMap.containsKey(investorPortfolio.getDiscountRate())) {
        			investorRateMap.put(investorPortfolio.getDiscountRate(),(investorRateMap.get(investorPortfolio.getDiscountRate())+1));
        		} else if(investorPortfolio.getAvailToInvest().compareTo(BigDecimal.ZERO) == 1) {
        			investorRateMap.put(investorPortfolio.getDiscountRate(), 1);
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
	private  String generateId(Date date,String name){
	    DateFormat df = new SimpleDateFormat("yyMM");
	    DateFormat dfm = new SimpleDateFormat("MM");
		DateFormat dfy = new SimpleDateFormat("yy");
	    String companyName=name.substring(0, 3);
	    String yMon=df.format(date);
	    String id=companyName+yMon;
		String scfTrade =scfTradeDAO.findByQueryId(id);
		if(scfTrade==null || scfTrade.isEmpty()){
			return id+"00001";
		}
		String cmp = scfTrade.substring(0, 3);
		String yr = scfTrade.substring(3, 5);
		String month = scfTrade.substring(5, 7);
		String flastcount = scfTrade.substring(7);
		String cm=dfm.format(date);
		String cy=dfy.format(date);
		String statusmonth = "";
		String statusyr = "";
		StringBuilder sb = new StringBuilder();
		  if(Integer.valueOf(yr) == Integer.valueOf(cy)){
			  statusyr = "C";
		  }else if(Integer.valueOf(yr) > Integer.valueOf(cy)){
			  statusyr = "N";
		  }
		  if(Integer.valueOf(month) == Integer.valueOf(cm) ){			  
			  statusmonth = "C";
		  }else if(Integer.valueOf(month) > Integer.valueOf(cm) ){			  
			  statusmonth = "N";
		  }
		  String newFormatCode = "";
		  if(statusmonth.equals("C") && statusyr.equals("C")){
			  String tmp = "";
			  int iit = Integer.valueOf(flastcount) + 1;
			  String tempp = String.valueOf(iit);	  
		      newFormatCode =sb.append(cmp).append(yr).append(month).append(StringUtils.leftPad(tempp, 5, '0')).toString();
		  }else if(statusmonth.equals("N") && statusyr.equals("C")){
			  newFormatCode = sb.append(cmp).append(yr).append(month).append("00001").toString();
		  }
		return newFormatCode;
	}
	private  int duration(Date paymentdate,Date financedate) throws InvalidDuration{
		Calendar c1 = Calendar.getInstance();
		Calendar c2 = Calendar.getInstance();
		c1.setTime(paymentdate);
		c2.setTime(financedate);
		System.out.println(" paymentDate "+paymentdate +" and financedate " + financedate);
		Date d1=c1.getTime();
		Date d2=c2.getTime();
        long diff=d1.getTime()-d2.getTime();
        int noofdays=(int)(diff/(1000*24*60*60));
        GeneralSetting generalSetting=generalSettingService.getGeneralSetting();
        if((generalSetting!=null && generalSetting.getMinPaymentDateDuartion() !=null) && (noofdays < generalSetting.getMinPaymentDateDuartion())){        	
        	throw new InvalidDuration(generalSetting.getMinPaymentDateDuartion());	
        }
        return noofdays;		
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
	
	public Invoice getInvoicesById(long id){
		return invoiceDAO.getInvoicesById(id);
	}
	
	
	public List<Invoice> getInvoicesBytradeId(long id){
		return invoiceDAO.getInvoicesBytradeId(id);
	}
	
	public Invoice getInvoicesByInvoiceNumAndCompanyId(String invoiceNo,long companyId){
		return invoiceDAO.getInvoicesByInvoiceNumAndCompanyId(invoiceNo,companyId);
	}
	
	public Invoice findById(Long id){
		return invoiceDAO.findById(id); 
	}
	
	public GenericListModel getInvoicesByFilter(String search,String frmDate,String toDate,String value,int startIndex,int pageSize,Long companyID,String registrationNo,String order,String columnName){
		return invoiceDAO.getInvoicesByFilter(search, frmDate, toDate, value, startIndex, pageSize,companyID,registrationNo,order,columnName);
	}
	

	public String getSellerRegNumberByTradeID(long id) {
		//there should be exception handling here
		String sellerRegNumber=getInvoicesBytradeId(id).get(0).getSellerCompanyRegistrationNumber();
		return sellerRegNumber;
	}
	
	public void deleteInvoice(Invoice invoice){
		invoiceDAO.deleteInvoice(invoice);
	}
		
	public int validInvoiceImport(String invoiceNumber, Long Id) {
		if(StringUtils.isBlank(invoiceNumber)){
			return 1;
		}else{
			return invoiceDAO.validInvoiceImport(invoiceNumber, Id);
		}		
	}

	public GenericListModel getInvoices(Long companyID, int startIndex,
		int pageSize, String registrationNo,String app,String order,String columnName) {
	    return invoiceDAO.getInvoices(companyID, startIndex, pageSize, registrationNo,app,order,columnName);
	}
	
	public FinanceConfirmationDTO triggerAllotmentCheck(List<String> invoiceIds,long sellerCmpId,long userId) throws InSuffcientFund, InvalidDuration   {		
	    FinanceConfirmationDTO financeConfirmationDTO=new FinanceConfirmationDTO();
	    if (invoiceIds!=null && invoiceIds.size()>0) {
		    Date date = new Date();
		    Company company = null;
		    Invoice invoice;
		    Date paymentdate = null;
		    Date financedate = null;
		    BigDecimal tradeAmount = BigDecimal.ZERO;
		    List<Date> holidayList = new ArrayList<Date>();
		    for (String id : invoiceIds) {
			invoice = invoiceDAO.findById(Long.valueOf(id));
			invoice.setFinanceDate(nextWorkingDate(date,
				holidayList));
			company = invoice.getScfCompany();
			paymentdate = invoice.getPayment_date();
			financedate = invoice.getFinanceDate();
			invoice.setDuration(duration(paymentdate, financedate));
			tradeAmount = tradeAmount.add(invoice
				.getInvoiceAmount());
		    }
		    SCFTrade scfTrade = new SCFTrade();
		    scfTrade.setDuration(duration(paymentdate,financedate));
		    scfTrade.setCompany(company);		   
		    scfTrade.setStatus(TradeStatus.NEW.getValue());
		    scfTrade.setTradeAmount(tradeAmount);
		    List<InvestorProtfolioDTO> list = investorDAO
			    .findInvestorByRate(company.getId());
		    list = getSameRateCountStamp(list);
		    allotmentEngine.checkActualAllotment(list, scfTrade,
			    sellerCmpId, userId);
		    financeConfirmationDTO.setNoOfInvoices(invoiceIds.size());
		    financeConfirmationDTO.setTotalAmount(tradeAmount);
		    financeConfirmationDTO.setAllotmentAmount(scfTrade.getSellerNetAllotment());
		    financeConfirmationDTO.setDuration(scfTrade.getDuration());
		}
		
		
		return financeConfirmationDTO;

	}


}
