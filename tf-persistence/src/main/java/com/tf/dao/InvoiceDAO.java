package com.tf.dao;

import java.util.List;

import com.tf.model.Invoice;


public interface InvoiceDAO extends BaseDAO<Invoice, Long> {
	
	public void addInvoices(List<Invoice> invoice);
	
	public List<Invoice> getInvoices(int startIndex,int pageSize);
	
	public Long getInvoicesCount();
	
	public List<Invoice> getInvoicesAmount(List<Long> invoiceIds);
	
	public List<Invoice> getInvoices(long companyID,int startIndex,int pageSize);
	
	public Invoice getInvoicesBytradeId(long id);
	
	public List<Invoice> getInvoicesByCompanyNumber(String companyNumber,int startIndex,int pageSize);
	
	public Long getInvsCounts(long companyID);
	
	public List<Invoice> getInvoicesByCompanyNoAndStatus(String companyNumber,String status);
	
	public Long getInvoiceCounts(String regNum);
	
	public void updateInvoices(List<Invoice> invoices);
	
	public List<Invoice> findByRegNum(String regNum);
	
	public Invoice getInvoicesById(long id);
	
	public List<Invoice> getInvoicesByRegNum(String regNum);
	
	public Invoice getInvoicesByInvoiceNumber(long id);

}
