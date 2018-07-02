package com.tf.service;

import java.math.BigDecimal;
import java.text.ParseException;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Set;

import com.tf.model.Company;
import com.tf.model.GenericListModel;
import com.tf.model.Invoice;
import com.tf.model.InvoiceNotTraded;
import com.tf.persistance.util.FinanceConfirmationDTO;
import com.tf.persistance.util.InSuffcientFund;
import com.tf.persistance.util.InvalidDuration;

public interface InvoiceService {
	 
	public void deleteInvoice(Invoice invoice);	
	
	public void addInvoices(List<Invoice> invoices);	

	public Map<Company, BigDecimal> getInvoicesAmount(String invoiceIds);
	
	public GenericListModel getInvoicesByFilter(String search,String frmDate,String toDate,String value,int startIndex,int pageSize,Long companyID,String registrationNo,String order,String columnName);
	
	public Set<Invoice> getInvoices(String invoiceIds);
	
	public List<Invoice> getInvoicesBytradeId(long id);	
	
	public void updateInvoicesStatus(List<String> invoiceIds,String Status);
	
	public void updateInvoicesStatusWithTrade(List<String> invoiceIds,String status,Long tradeLong);
	
	public Date triggerAllotment(List<String> invoiceIds,long sellerCompanyID,long userId) throws InSuffcientFund, InvalidDuration;
	
	public Invoice getInvoicesByInvoiceNumAndCompanyId(String invoiceNumber,long companyId);	
	
	public Invoice getInvoicesById(long id);
	
	public Invoice findById(Long id); 
	
	public String getSellerRegNumberByTradeID(long id);
	
	public int validInvoiceImport(String invoiceNumber, Long Id);

	public GenericListModel getInvoices(Long companyID, int startIndex,int pageSize, String registrationNo,String order,String columnName) throws ParseException;
	
	public List<InvoiceNotTraded> getInvoicesNotTraded(Long companyID, int startIndex,int pageSize, String registrationNo,String order,String columnName) throws ParseException;
	
	public FinanceConfirmationDTO triggerAllotmentCheck(List<String> invoiceIds,long sellerCmpId,long userId) throws InSuffcientFund, InvalidDuration;

}
