package com.tf.service.impl;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tf.dao.InvoiceDAO;
import com.tf.model.Invoice;
import com.tf.service.InvoiceService;

@Service
public class InvoiceServiceImpl implements InvoiceService{

	@Autowired
	private InvoiceDAO invoiceDAO;

	public void addInvoice(Invoice invoice) {
		 invoiceDAO.addInvoice(invoice);
		
	}

	public List<Invoice> getInvoices() {
		List<Invoice> invoices=invoiceDAO.getInvoices();
		return invoices;
	}


	
	
}
