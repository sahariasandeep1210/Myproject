package com.tf.dto;

import java.io.Serializable;

import org.springframework.web.multipart.MultipartFile;

public class InvoiceDTO  implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 7974625802983387979L;
	
	private Long scfCompany;
	private String fileType;
	private MultipartFile invoiceDoc;

	public InvoiceDTO() {
		// TODO Auto-generated constructor stub
	}

	public Long getScfCompany() {
		return scfCompany;
	}

	public void setScfCompany(Long scfCompany) {
		this.scfCompany = scfCompany;
	}

	public String getFileType() {
		return fileType;
	}

	public void setFileType(String fileType) {
		this.fileType = fileType;
	}

	public MultipartFile getInvoiceDoc() {
		return invoiceDoc;
	}

	public void setInvoiceDoc(MultipartFile invoiceDoc) {
		this.invoiceDoc = invoiceDoc;
	}

	@Override
	public String toString() {
		return "InvoiceDTO [scfCompany=" + scfCompany + ", comanyType="
				+ fileType + ", invoiceDoc=" + invoiceDoc + "]";
	}

}
