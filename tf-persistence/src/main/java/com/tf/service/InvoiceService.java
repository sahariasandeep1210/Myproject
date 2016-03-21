package com.tf.service;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Set;

import com.tf.model.Company;
import com.tf.model.Invoice;
import com.tf.persistance.util.InSuffcientFund;

public interface InvoiceService {
	 
	public void deleteInvoice(Invoice invoice);	
	public void addInvoices(List<Invoice> invoices);
	
	public Long getInvoicesByFilterCount(String search,Date frmDate,Date toDate,String value);
	
	public List<Invoice> getInvoices(int startIndex,int pageSize);

	public Map<Company, BigDecimal> getInvoicesAmount(String invoiceIds);
	
	public List<Invoice> getInvoicesByFilter(String search,Date frmDate,Date toDate,String value,int startIndex,int pageSize);
	
	public Set<Invoice> getInvoices(String invoiceIds);

	public List<Invoice> getInvoices(long companyID,int startIndex,int pageSize);
	
	public List<Invoice> getInvoicesBytradeId(long id);
	
	public List<Invoice> getInvoicesByCompanyNumber(String companyNumber,int startIndex,int pageSize);
	
	public List<Invoice> getInvoicesByCompanyNoAndStatus(String companyNumber,String status);
	
	public void updateInvoicesStatus(List<String> invoiceIds,String Status);
	
	public void updateInvoicesStatusWithTrade(List<String> invoiceIds,String status,Long tradeLong);
	
	public Date triggerAllotment(List<String> invoiceIds,long sellerCompanyID,long userId) throws InSuffcientFund;
	
	public Invoice getInvoicesByInvoiceNumAndCompanyId(long id,long companyId);		

	public List<Invoice> getInvoicesByRegNum(String regNum);
	
	public List<Invoice> findByRegNum(String regNum);
	
	public Long getInvoicesCount();
	
	public Invoice getInvoicesById(long id);
	
	public Long getInvoiceCounts(String regNum);
	
	public Long getInvsCounts(long companyID);
	
	public Invoice findById(Long id); 
	
	public String getSellerRegNumberByTradeID(long id);

}
