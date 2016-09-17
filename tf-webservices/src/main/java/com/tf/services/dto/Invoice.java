package com.tf.services.dto;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonInclude.Include;

@JsonInclude(value = Include.NON_NULL)
public class Invoice implements Serializable {
    
    private static final long serialVersionUID = 8429617768756549750L;
    
    private Long id;    
    private String invoiceNumber;
    private Date invoiceDate;
    private String sellerCompanyRegistrationNumber;
    private String sellerCompanyVatNumber;
    private BigDecimal invoiceAmount;
    private BigDecimal vatAmount;
    private String invoiceDesc;
    private int duration;
    private Date payment_date;
    private String currency;
    private Long scfCompany;
    private String scfCompanyName;
    private Date financeDate;
    private String status;
    private Long tradeID;
    private Date createDate;
    private Date updateDate;
   
    
    public Invoice() {
	
    }


    public Long getId() {
        return id;
    }


    public void setId(Long id) {
        this.id = id;
    }


    public String getInvoiceNumber() {
        return invoiceNumber;
    }


    public void setInvoiceNumber(String invoiceNumber) {
        this.invoiceNumber = invoiceNumber;
    }


    public Date getInvoiceDate() {
        return invoiceDate;
    }


    public void setInvoiceDate(Date invoiceDate) {
        this.invoiceDate = invoiceDate;
    }


    public String getSellerCompanyRegistrationNumber() {
        return sellerCompanyRegistrationNumber;
    }


    public void setSellerCompanyRegistrationNumber(
    	String sellerCompanyRegistrationNumber) {
        this.sellerCompanyRegistrationNumber = sellerCompanyRegistrationNumber;
    }


    public String getSellerCompanyVatNumber() {
        return sellerCompanyVatNumber;
    }


    public void setSellerCompanyVatNumber(String sellerCompanyVatNumber) {
        this.sellerCompanyVatNumber = sellerCompanyVatNumber;
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


    public int getDuration() {
        return duration;
    }


    public void setDuration(int duration) {
        this.duration = duration;
    }


    public Date getPayment_date() {
        return payment_date;
    }


    public void setPayment_date(Date payment_date) {
        this.payment_date = payment_date;
    }


    public String getCurrency() {
        return currency;
    }


    public void setCurrency(String currency) {
        this.currency = currency;
    }


    public Long getScfCompany() {
        return scfCompany;
    }


    public void setScfCompany(Long scfCompany) {
        this.scfCompany = scfCompany;
    }


    public String getScfCompanyName() {
        return scfCompanyName;
    }


    public void setScfCompanyName(String scfCompanyName) {
        this.scfCompanyName = scfCompanyName;
    }


    public Date getFinanceDate() {
        return financeDate;
    }


    public void setFinanceDate(Date financeDate) {
        this.financeDate = financeDate;
    }


    public String getStatus() {
        return status;
    }


    public void setStatus(String status) {
        this.status = status;
    }


    public Long getTradeID() {
        return tradeID;
    }


    public void setTradeID(Long tradeID) {
        this.tradeID = tradeID;
    }


    public Date getCreateDate() {
        return createDate;
    }


    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }


    public Date getUpdateDate() {
        return updateDate;
    }


    public void setUpdateDate(Date updateDate) {
        this.updateDate = updateDate;
    }


    @Override
    public String toString() {
	return "Invoice [id=" + id + ", invoiceNumber=" + invoiceNumber
		+ ", invoiceDate=" + invoiceDate
		+ ", sellerCompanyRegistrationNumber="
		+ sellerCompanyRegistrationNumber + ", sellerCompanyVatNumber="
		+ sellerCompanyVatNumber + ", invoiceAmount=" + invoiceAmount
		+ ", vatAmount=" + vatAmount + ", invoiceDesc=" + invoiceDesc
		+ ", duration=" + duration + ", payment_date=" + payment_date
		+ ", currency=" + currency + ", scfCompany=" + scfCompany
		+ ", scfCompanyName=" + scfCompanyName + ", financeDate="
		+ financeDate + ", status=" + status + ", tradeID=" + tradeID
		+ ", createDate=" + createDate + ", updateDate=" + updateDate
		+ "]";
    }
   

}
