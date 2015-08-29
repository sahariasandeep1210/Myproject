package com.tf.dao;

import java.util.List;

import com.tf.model.Invoice;


public interface InvoiceDAO {
	
	public void addInvoice(Invoice invoice);
	
	public List<Invoice> getInvoice(String name);
}
