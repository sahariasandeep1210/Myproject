package com.tf.po.model;

import java.math.BigDecimal;
import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

public class PurchaseOrderDTO {
	
	private Long id;	
	private Integer sellerId;
	private Integer debtorCompany;
	private String poNumber;
	private Date poDate;
	private BigDecimal poAmount;
	private Integer poDays;
	private String poNotes;
	
	private MultipartFile insuranceDoc; 
	private MultipartFile invoiceDoc; 
	private MultipartFile deliveryNoteDoc; 
	private MultipartFile shippingDoc; 
	private MultipartFile locDoc; 
	private MultipartFile contractDoc;
	
	public PurchaseOrderDTO() {
		// TODO Auto-generated constructor stub
	}
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public Integer getSellerId() {
		return sellerId;
	}
	public void setSellerId(Integer sellerId) {
		this.sellerId = sellerId;
	}
	public Integer getDebtorCompany() {
		return debtorCompany;
	}
	public void setDebtorCompany(Integer debtorCompany) {
		this.debtorCompany = debtorCompany;
	}
	public String getPoNumber() {
		return poNumber;
	}
	public void setPoNumber(String poNumber) {
		this.poNumber = poNumber;
	}
	public Date getPoDate() {
		return poDate;
	}
	public void setPoDate(Date poDate) {
		this.poDate = poDate;
	}
	public BigDecimal getPoAmount() {
		return poAmount;
	}
	public void setPoAmount(BigDecimal poAmount) {
		this.poAmount = poAmount;
	}
	public Integer getPoDays() {
		return poDays;
	}
	public void setPoDays(Integer poDays) {
		this.poDays = poDays;
	}
	public String getPoNotes() {
		return poNotes;
	}
	public void setPoNotes(String poNotes) {
		this.poNotes = poNotes;
	}
	public MultipartFile getInsuranceDoc() {
		return insuranceDoc;
	}
	public void setInsuranceDoc(MultipartFile insuranceDoc) {
		this.insuranceDoc = insuranceDoc;
	}
	public MultipartFile getInvoiceDoc() {
		return invoiceDoc;
	}
	public void setInvoiceDoc(MultipartFile invoiceDoc) {
		this.invoiceDoc = invoiceDoc;
	}
	public MultipartFile getDeliveryNoteDoc() {
		return deliveryNoteDoc;
	}
	public void setDeliveryNoteDoc(MultipartFile deliveryNoteDoc) {
		this.deliveryNoteDoc = deliveryNoteDoc;
	}
	public MultipartFile getShippingDoc() {
		return shippingDoc;
	}
	public void setShippingDoc(MultipartFile shippingDoc) {
		this.shippingDoc = shippingDoc;
	}
	public MultipartFile getLocDoc() {
		return locDoc;
	}
	public void setLocDoc(MultipartFile locDoc) {
		this.locDoc = locDoc;
	}
	public MultipartFile getContractDoc() {
		return contractDoc;
	}
	public void setContractDoc(MultipartFile contractDoc) {
		this.contractDoc = contractDoc;
	}

	@Override
	public String toString() {
		return "PurchaseOrderDTO [id=" + id + ", sellerId=" + sellerId
				+ ", debtorCompany=" + debtorCompany + ", poNumber=" + poNumber
				+ ", poDate=" + poDate + ", poAmount=" + poAmount + ", poDays="
				+ poDays + ", poNotes=" + poNotes + ", insuranceDoc="
				+ insuranceDoc + ", invoiceDoc=" + invoiceDoc
				+ ", deliveryNoteDoc=" + deliveryNoteDoc + ", shippingDoc="
				+ shippingDoc + ", locDoc=" + locDoc + ", contractDoc="
				+ contractDoc + "]";
	} 

	
}
