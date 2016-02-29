package com.tf.service;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;
import java.util.Set;

import com.tf.model.Company;
import com.tf.model.Invoice;

public interface InvoiceService {

	public void addInvoices(List<Invoice> invoices);

	public List<Invoice> getInvoices();

	public Map<Company, BigDecimal> getInvoicesAmount(String invoiceIds);

	public Set<Invoice> getInvoices(String invoiceIds);

	public List<Invoice> getInvoices(long companyID);

	public List<Invoice> getInvoicesByCompanyNumber(String companyNumber);
	
	public List<Invoice> getInvoicesByCompanyNoAndStatus(String companyNumber,String status);
	
	public void updateInvoicesStatus(List<String> invoiceIds,String Status);
	
	public void updateInvoicesStatusWithTrade(List<String> invoiceIds,String status,Long tradeLong);
	
	public void triggerAllotment(List<String> invoiceIds,long sellerCompanyID,long userId);
	
	public List<Invoice> findByRegNum(String regNum);
	
	public List<Invoice> getInvoicesById(long id);

}
