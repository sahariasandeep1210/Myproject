package com.tf.dto;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

public class InvoiceDTO  implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 3355005747582882864L;
	//invoice Document fields
	private Long scfCompany;
	private String fileType;
	private MultipartFile invoiceDoc;
	
	//invoice fields
	private Long id;
	private Long  invoiceNumber;
	private Date invoiceDate;
	private String sellerRegNo;
	private String sellerVatNumber;
	private BigDecimal invoiceAmount;
	private BigDecimal vatAmount;
	private String invoiceDesc;
	private Integer duration;
	private Date paymentDate;
	private String currency;
	private Date dueDate;
	private String status;

	private Long companyId;
	

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

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Long getInvoiceNumber() {
		return invoiceNumber;
	}

	public void setInvoiceNumber(Long invoiceNumber) {
		this.invoiceNumber = invoiceNumber;
	}

	public Date getInvoiceDate() {
		return invoiceDate;
	}

	public void setInvoiceDate(Date invoiceDate) {
		this.invoiceDate = invoiceDate;
	}

	public String getSellerRegNo() {
		return sellerRegNo;
	}

	public void setSellerRegNo(String sellerRegNo) {
		this.sellerRegNo = sellerRegNo;
	}

	public String getSellerVatNumber() {
		return sellerVatNumber;
	}

	public void setSellerVatNumber(String sellerVatNumber) {
		this.sellerVatNumber = sellerVatNumber;
	}

	public BigDecimal getInvoiceAmount() {
		return invoiceAmount;
	}

	public void setInvoiceAmount(BigDecimal invoiceAmount) {
		this.invoiceAmount = invoiceAmount;
	}

	public BigDecimal getVatAmount() {
		return vatAmount;
	}

	public void setVatAmount(BigDecimal vatAmount) {
		this.vatAmount = vatAmount;
	}

	public String getInvoiceDesc() {
		return invoiceDesc;
	}

	public void setInvoiceDesc(String invoiceDesc) {
		this.invoiceDesc = invoiceDesc;
	}
	
	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Integer getDuration() {
		return duration;
	}

	public void setDuration(Integer duration) {
		this.duration = duration;
	}

	public Date getPaymentDate() {
		return paymentDate;
	}

	public void setPaymentDate(Date paymentDate) {
		this.paymentDate = paymentDate;
	}

	public String getCurrency() {
		return currency;
	}

	public void setCurrency(String currency) {
		this.currency = currency;
	}

	public Long getCompanyId() {
		return companyId;
	}

	public void setCompanyId(Long companyId) {
		this.companyId = companyId;
	}

	public Date getDueDate() {
		return dueDate;
	}

	public void setDueDate(Date dueDate) {
		this.dueDate = dueDate;
	}

	@Override
	public String toString() {
		return "InvoiceDTO [scfCompany=" + scfCompany + ", fileType="
				+ fileType + ", invoiceDoc=" + invoiceDoc + ", id=" + id
				+ ", invoiceNumber=" + invoiceNumber + ", invoiceDate="
				+ invoiceDate + ", sellerRegNo=" + sellerRegNo
				+ ", sellerVatNumber=" + sellerVatNumber + ", invoiceAmount="
				+ invoiceAmount + ", vatAmount=" + vatAmount + ", invoiceDesc="
				+ invoiceDesc + ", duration=" + duration + ", paymentDate="
				+ paymentDate + ", currency=" + currency + "]";
	}
	

}
