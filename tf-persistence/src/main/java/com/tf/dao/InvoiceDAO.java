package com.tf.dao;

import java.util.List;

import com.tf.model.Invoice;


public interface InvoiceDAO extends BaseDAO<Invoice, Long> {
	
	public void addInvoices(List<Invoice> invoice);
	
	public List<Invoice> getInvoices();
	
	public List<Invoice> getInvoicesAmount(List<Long> invoiceIds);
	
	public List<Invoice> getInvoices(long companyID);
	
	public List<Invoice> getInvoicesByCompanyNumber(String companyNumber);
	
	public List<Invoice> getInvoicesByCompanyNoAndStatus(String companyNumber,String status);
	
	public void updateInvoices(List<Invoice> invoices);
	public List<Invoice> findByRegNum(String regNum);

}
