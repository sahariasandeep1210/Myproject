package com.tf.dao;

import java.util.Date;
import java.util.List;

import com.tf.model.GenericListModel;
import com.tf.model.Invoice;


public interface InvoiceDAO extends BaseDAO<Invoice, Long> {
	
	public void deleteInvoice(Invoice invoice);	
	
	public void addInvoices(List<Invoice> invoice);	
	
	public Long getInvoicesCount();
	
	public GenericListModel getInvoicesByFilter(String search,Date frmDate,Date toDate,String value,int startIndex,int pageSize,Long companyID,String registrationNo);
	
	public List<Invoice> getInvoicesAmount(List<Long> invoiceIds);
	
	public List<Invoice> getInvoicesBytradeId(long id);
	
	public List<Invoice> getInvoicesByCompanyNoAndStatus(String companyNumber,String status);
	
	public void updateInvoices(List<Invoice> invoices);
	
	public List<Invoice> findByRegNum(String regNum);
	
	public Invoice getInvoicesById(long id);
	
	public List<Invoice> getInvoicesByRegNum(String regNum);
	
	public Invoice getInvoicesByInvoiceNumAndCompanyId(String invoiceNo,long companyId);
	
	public int validInvoiceImport(String invoiceNumber,Long Id);
	
	public GenericListModel getInvoices(Long companyID, int startIndex,int pageSize, String registrationNo);
}
