package com.tf.dao;

import java.math.BigDecimal;
import java.util.List;

import com.tf.model.Invoice;


public interface InvoiceDAO {
	
	public void addInvoices(List<Invoice> invoice);
	
	public List<Invoice> getInvoices();
	
	public List<Invoice> getInvoicesAmount(List<Long> invoiceIds);
}
