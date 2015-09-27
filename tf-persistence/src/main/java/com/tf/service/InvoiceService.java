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
	
	public Map<Company,BigDecimal> getInvoicesAmount(String invoiceIds);
	
	public Set<Invoice> getInvoices(String invoiceIds);
	
	public List<Invoice> getInvoices(long companyID);
}
