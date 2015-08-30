package com.tf.dao;

import java.util.List;

import com.tf.model.InvoiceDocument;

public interface InvoiceDocumentDAO {
	
	public void addInvoiceDocument(InvoiceDocument invoiceDocument);
	
	public List<InvoiceDocument> getInvoiceDocuments();

}
