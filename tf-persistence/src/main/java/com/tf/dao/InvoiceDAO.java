package com.tf.dao;

import java.text.ParseException;
import java.util.List;
import java.util.Map;

import com.tf.model.GenericListModel;
import com.tf.model.Invoice;
import com.tf.model.InvoiceNotTraded;
import com.tf.persistance.util.PaymentScheduleDTO;


public interface InvoiceDAO extends BaseDAO<Invoice, Long> {
	
	public void deleteInvoice(Invoice invoice);	
	
	public void addInvoices(List<Invoice> invoice);	
	
	public Long getInvoicesCount();
	
	public GenericListModel getInvoicesByFilter(String search,String frmDate,String toDate,String value,int startIndex,int pageSize,Long companyID,String registrationNo,String order,String columnName);
	
	public List<Invoice> getInvoicesAmount(List<Long> invoiceIds);
	
	public List<Invoice> getInvoicesBytradeId(long id);
	
	public List<Invoice> getInvoicesByCompanyNoAndStatus(String companyNumber,String status);
	
	public void updateInvoices(List<Invoice> invoices);
	
	public List<Invoice> findByRegNum(String regNum);
	
	public Invoice getInvoicesById(long id);
	
	public List<Invoice> getInvoicesByRegNum(String regNum);
	
	public Invoice getInvoicesByInvoiceNumAndCompanyId(String invoiceNo,long companyId);
	
	public int validInvoiceImport(String invoiceNumber,Long Id);
	
	public GenericListModel getInvoices(Long companyID, int startIndex,int pageSize, String registrationNo, String order,String columnName) throws ParseException;

	public GenericListModel getInvoiceNotTradedOnSearch(String search, String frmDate, String toDate, String value, int startIndex, int pageSize,Long companyID,String registrationNo,String order,String columnName) throws ParseException;
  
	public GenericListModel  getInvoicesNotTraded(Long companyID, int startIndex,int pageSize, String registrationNo, String order,String columnName) throws ParseException;


	public GenericListModel  getSCFInvestorShortFall( String Search,int startIndex,int pageSize,String order,String columnName) throws ParseException;
	
	public Map<String,Long>getSCFInvestorShortFallTotalAmount( ) throws ParseException;
	

	public List<PaymentScheduleDTO> getPaymentScheduleList(int startIndex, int pageSize, Long scfCompanyId, String orderBy,String search,String status,boolean forCount);
}

