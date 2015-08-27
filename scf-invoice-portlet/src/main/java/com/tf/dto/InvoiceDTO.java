package com.tf.dto;

import org.springframework.web.multipart.MultipartFile;

public class InvoiceDTO {
	
	private MultipartFile invoiceDoc;
	
	public InvoiceDTO() {
		// TODO Auto-generated constructor stub
	}

	public MultipartFile getInvoiceDoc() {
		return invoiceDoc;
	}

	public void setInvoiceDoc(MultipartFile invoiceDoc) {
		this.invoiceDoc = invoiceDoc;
	}

	@Override
	public String toString() {
		return "InvoiceDTO [invoiceDoc=" + invoiceDoc + "]";
	}
	
	

}
