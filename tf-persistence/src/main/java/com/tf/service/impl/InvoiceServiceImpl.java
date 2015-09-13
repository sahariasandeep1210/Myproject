package com.tf.service.impl;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashSet;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tf.dao.InvoiceDAO;
import com.tf.model.Company;
import com.tf.model.Invoice;
import com.tf.service.InvoiceService;

@Service
public class InvoiceServiceImpl implements InvoiceService{

	@Autowired
	private InvoiceDAO invoiceDAO;

	public void addInvoices(List<Invoice> invoice) {
		 invoiceDAO.addInvoices(invoice);
		
	}

	public List<Invoice> getInvoices() {
		List<Invoice> invoices=invoiceDAO.getInvoices();
		return invoices;
	}
	
	public Map<Company,BigDecimal> getInvoicesAmount(String invoiceIds){
		Map<Company,BigDecimal> invoiceInfoMap=new LinkedHashMap<Company,BigDecimal>();
		BigDecimal sumInvoiceAmt=new BigDecimal(0);
		Company company=null; 
		List<String> invoicesAmt=Arrays.asList(invoiceIds.split(","));
		List<Long> invoicesAmtactual=new ArrayList<Long>();
		for(String amount :invoicesAmt){ 
			invoicesAmtactual.add(Long.valueOf(amount));
		}
		List<Invoice> invoiceAmounts=invoiceDAO.getInvoicesAmount(invoicesAmtactual);
		for(Invoice invoice : invoiceAmounts){
			company =invoice.getScfCompany();
			sumInvoiceAmt = sumInvoiceAmt.add(invoice.getInvoiceAmount());
		}	
		invoiceInfoMap.put(company, sumInvoiceAmt);
		System.out.println("sumInvoiceAmt::::::"+sumInvoiceAmt);
		return invoiceInfoMap;
		
		
	}
	
	public Set<Invoice> getInvoices(String invoiceIds){
		
		List<String> idsList=Arrays.asList(invoiceIds.split(","));
		List<Long> idsListactual=new ArrayList<Long>();
		for(String id :idsList){ 
			idsListactual.add(Long.valueOf(id));
		}
		List<Invoice> invoices=invoiceDAO.getInvoicesAmount(idsListactual);
		Set<Invoice> invoiceSet = new HashSet<Invoice>(invoices);
		return invoiceSet;
		
	}


	
	
}
