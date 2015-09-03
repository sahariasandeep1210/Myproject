package com.tf.service;

import java.util.List;

import com.tf.model.Invoice;


public interface InvoiceService {

	public void addInvoice(Invoice invoice);
	
	public List<Invoice> getInvoices();
}
