package com.tf.dao;

import java.math.BigDecimal;
import java.util.List;

import com.tf.model.Invoice;


public interface InvoiceDAO {
	
	public void addInvoice(Invoice invoice);
	
	public List<Invoice> getInvoices();
	
	public List<BigDecimal> getInvoicesAmount(List<Long> invoiceIds);
}
