package com.tf.service;

import java.math.BigDecimal;
import java.util.List;

import com.tf.model.Invoice;


public interface InvoiceService {

	public void addInvoices(List<Invoice> invoices);
	
	public List<Invoice> getInvoices();
	
	public BigDecimal getInvoicesAmount(String invoiceIds);
}
