package com.tf.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tf.dao.InvoiceDocumentDAO;
import com.tf.model.InvoiceDocument;
import com.tf.service.InvoiceDocumentService;


@Service
public class InvoiceDocumentServiceImpl implements InvoiceDocumentService {
	
	@Autowired
	private InvoiceDocumentDAO invoiceDocumentDAO;
	
	public void addInvoiceDocument(InvoiceDocument invoiceDocument){
		 invoiceDocumentDAO.addInvoiceDocument(invoiceDocument);		
	}

}
