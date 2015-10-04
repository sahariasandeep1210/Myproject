package com.tf.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tf.dao.InvoiceDocumentDAO;
import com.tf.dao.UserDAO;
import com.tf.model.InvoiceDocument;
import com.tf.service.InvoiceDocumentService;


@Service
public class InvoiceDocumentServiceImpl implements InvoiceDocumentService {
	
	@Autowired
	private InvoiceDocumentDAO invoiceDocumentDAO;
	
	@Autowired
	private UserDAO userDAO;
	
	public void addInvoiceDocument(InvoiceDocument invoiceDocument){
		 invoiceDocumentDAO.addInvoiceDocument(invoiceDocument);		
	}
	public List<InvoiceDocument> getInvoiceDocuments(){
		return invoiceDocumentDAO.getInvoiceDocuments();
	}
	
	public List<InvoiceDocument> getInvoiceDocuments(long userId){
		long companyId=userDAO.getCompanyIDbyUserID(userId);
		return invoiceDocumentDAO.getInvoiceDocuments(companyId);	
	}

}
