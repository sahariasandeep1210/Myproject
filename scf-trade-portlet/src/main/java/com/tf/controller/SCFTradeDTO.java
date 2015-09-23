package com.tf.controller;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

import com.tf.model.Company;

public class SCFTradeDTO implements Serializable {
	
	
	
	
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -3399347740700344933L;
	private Long id;	
	private String scfTrade;
	private Integer duration;
	private Date closingDate;
	private Date openingDate;
	private Date investorPaymentDate;	
	private Date SellerPaymentDate;
	private BigDecimal tradeAmount;
	private String status;
	private Company company;
	private String tradeNotes;	
	private Integer tradeSettled;
	private Integer wantToInsure;
	private MultipartFile insuranceDocument;	
	private String promisoryNote;
	
	private String invoiceIds;
	
	public SCFTradeDTO() {
		this.scfTrade="No";
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getScfTrade() {
		return scfTrade;
	}

	public void setScfTrade(String scfTrade) {
		this.scfTrade = scfTrade;
	}

	public Integer getDuration() {
		return duration;
	}

	public void setDuration(Integer duration) {
		this.duration = duration;
	}

	public Date getClosingDate() {
		return closingDate;
	}

	public void setClosingDate(Date closingDate) {
		this.closingDate = closingDate;
	}

	public Date getOpeningDate() {
		return openingDate;
	}

	public void setOpeningDate(Date openingDate) {
		this.openingDate = openingDate;
	}

	public Date getInvestorPaymentDate() {
		return investorPaymentDate;
	}

	public void setInvestorPaymentDate(Date investorPaymentDate) {
		this.investorPaymentDate = investorPaymentDate;
	}

	public Date getSellerPaymentDate() {
		return SellerPaymentDate;
	}

	public void setSellerPaymentDate(Date sellerPaymentDate) {
		SellerPaymentDate = sellerPaymentDate;
	}

	public BigDecimal getTradeAmount() {
		return tradeAmount;
	}

	public void setTradeAmount(BigDecimal tradeAmount) {
		this.tradeAmount = tradeAmount;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Company getCompany() {
		return company;
	}

	public void setCompany(Company company) {
		this.company = company;
	}

	public String getTradeNotes() {
		return tradeNotes;
	}

	public void setTradeNotes(String tradeNotes) {
		this.tradeNotes = tradeNotes;
	}

	public Integer getTradeSettled() {
		return tradeSettled;
	}

	public void setTradeSettled(Integer tradeSettled) {
		this.tradeSettled = tradeSettled;
	}

	public Integer getWantToInsure() {
		return wantToInsure;
	}

	public void setWantToInsure(Integer wantToInsure) {
		this.wantToInsure = wantToInsure;
	}

	public MultipartFile getInsuranceDocument() {
		return insuranceDocument;
	}

	public void setInsuranceDocument(MultipartFile insuranceDocument) {
		this.insuranceDocument = insuranceDocument;
	}

	public String getPromisoryNote() {
		return promisoryNote;
	}

	public void setPromisoryNote(String promisoryNote) {
		this.promisoryNote = promisoryNote;
	}

	public String getInvoiceIds() {
		return invoiceIds;
	}

	public void setInvoiceIds(String invoiceIds) {
		this.invoiceIds = invoiceIds;
	}

	@Override
	public String toString() {
		return "SCFTradeDTO [id=" + id + ", scfTrade=" + scfTrade
				+ ", duration=" + duration + ", closingDate=" + closingDate
				+ ", openingDate=" + openingDate + ", investorPaymentDate="
				+ investorPaymentDate + ", SellerPaymentDate="
				+ SellerPaymentDate + ", tradeAmount=" + tradeAmount
				+ ", status=" + status + ", company=" + company
				+ ", tradeNotes=" + tradeNotes + ", tradeSettled="
				+ tradeSettled + ", wantToInsure=" + wantToInsure
				+ ", insuranceDocument=" + insuranceDocument
				+ ", promisoryNote=" + promisoryNote + ", invoiceIds="
				+ invoiceIds + "]";
	}
	

}
