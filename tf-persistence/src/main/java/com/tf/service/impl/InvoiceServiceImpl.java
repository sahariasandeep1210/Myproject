package com.tf.service.impl;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tf.dao.InvoiceDAO;
import com.tf.model.Invoice;
import com.tf.service.InvoiceService;

@Service
public class InvoiceServiceImpl implements InvoiceService{

	@Autowired
	private InvoiceDAO invoiceDAO;

	public void addInvoice(Invoice invoice) {
		 invoiceDAO.addInvoice(invoice);
		
	}

	public List<Invoice> getInvoices() {
		List<Invoice> invoices=invoiceDAO.getInvoices();
		return invoices;
	}
	
	public BigDecimal getInvoicesAmount(String invoiceIds){
		BigDecimal sumInvoiceAmt=new BigDecimal(0);
		List<String> invoicesAmt=Arrays.asList(invoiceIds.split(","));
		List<Long> invoicesAmtactual=new ArrayList<Long>();
		for(String amount :invoicesAmt){ 
			invoicesAmtactual.add(Long.valueOf(amount));
		}
		List<BigDecimal> invoiceAmounts=invoiceDAO.getInvoicesAmount(invoicesAmtactual);
		for(BigDecimal amount : invoiceAmounts){
			sumInvoiceAmt = sumInvoiceAmt.add(amount);
		}	
		System.out.println("sumInvoiceAmt::::::"+sumInvoiceAmt);
		return sumInvoiceAmt;
		
		
	}


	
	
}
