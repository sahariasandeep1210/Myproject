package com.tf.service;

import java.util.List;

import com.tf.model.InvoiceDocument;

public interface InvoiceDocumentService {
	
	public void addInvoiceDocument(InvoiceDocument invoiceDocument);
	
	public List<InvoiceDocument> getInvoiceDocuments();
	
	public List<InvoiceDocument> getInvoiceDocuments(long userId);

}
