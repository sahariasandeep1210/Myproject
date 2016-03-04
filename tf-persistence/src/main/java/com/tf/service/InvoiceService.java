package com.tf.service;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;
import java.util.Set;

import com.tf.model.Company;
import com.tf.model.Invoice;

public interface InvoiceService {

	public void addInvoices(List<Invoice> invoices);

	public List<Invoice> getInvoices(int startIndex,int pageSize);

	public Map<Company, BigDecimal> getInvoicesAmount(String invoiceIds);

	public Set<Invoice> getInvoices(String invoiceIds);

	public List<Invoice> getInvoices(long companyID,int startIndex,int pageSize);

	public List<Invoice> getInvoicesByCompanyNumber(String companyNumber,int startIndex,int pageSize);
	
	public List<Invoice> getInvoicesByCompanyNoAndStatus(String companyNumber,String status);
	
	public void updateInvoicesStatus(List<String> invoiceIds,String Status);
	
	public void updateInvoicesStatusWithTrade(List<String> invoiceIds,String status,Long tradeLong);
	
	public void triggerAllotment(List<String> invoiceIds,long sellerCompanyID,long userId);
	
	public List<Invoice> findByRegNum(String regNum);
	public Long getInvoicesCount();
	public Invoice getInvoicesById(long id);
	public Long getInvoiceCounts(String regNum);
	public Long getInvsCounts(long companyID);

}
