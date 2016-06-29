package com.tf.model;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
@Entity
@Table(name = "scf_invoice")
public class Invoice implements Serializable {


    	private static final long serialVersionUID = -5860678209842565066L;

	@Id
	@Column(name = "id")
	@GeneratedValue
	private Long id;

	@Column(name = "invoice_number")
	private String invoiceNumber;

	@Column(name = "invoice_date")
	private Date invoiceDate;

	@Column(name = "seller_company_registration_number")
	private String sellerCompanyRegistrationNumber;

	@Column(name = "seller_company_vat_number")
	private String sellerCompanyVatNumber;

	@Column(name = "invoice_amout")
	private BigDecimal invoiceAmount;

	@Column(name = "vat_amount")
	private BigDecimal vatAmount;

	@Column(name = "invoice_desc")
	private String invoiceDesc;

	@Column(name = "duration")
	private int duration;

	@Column(name = "payment_date")
	private Date payment_date;

	@Column(name = "currency")
	private String currency;	
	
	@ManyToOne  
	@JoinColumn(name = "scf_company")  
	private Company scfCompany;
	
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "finance_date")
	private Date financeDate;
	
	@Column(name = "status")
	private String status;
	
	@ManyToOne(cascade=CascadeType.ALL)	
	@JoinColumn(name = "trade_id")
	private SCFTrade scfTrade;
	
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "create_date")
	private Date createDate;
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "update_date")
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

	public Date getPayment_date() {
		return payment_date;
	}

	public void setPayment_date(Date payment_date) {
		this.payment_date = payment_date;
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

	public String getCurrency() {
		return currency;
	}

	public void setCurrency(String currency) {
		this.currency = currency;
	}

	public Company getScfCompany() {
		return scfCompany;
	}

	public void setScfCompany(Company scfCompany) {
		this.scfCompany = scfCompany;
	}

	public Date getFinanceDate() {
		return financeDate;
	}

	public void setFinanceDate(Date financeDate) {
		this.financeDate = financeDate;
	}

	public SCFTrade getScfTrade() {
		return scfTrade;
	}

	public void setScfTrade(SCFTrade scfTrade) {
		this.scfTrade = scfTrade;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
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
		    + sellerCompanyRegistrationNumber
		    + ", sellerCompanyVatNumber=" + sellerCompanyVatNumber
		    + ", invoiceAmount=" + invoiceAmount + ", vatAmount="
		    + vatAmount + ", invoiceDesc=" + invoiceDesc
		    + ", duration=" + duration + ", payment_date="
		    + payment_date + ", currency=" + currency + ", scfCompany="
		    + scfCompany + ", financeDate=" + financeDate + ", status="
		    + status + ", scfTrade=" + scfTrade + ", createDate="
		    + createDate + ", updateDate=" + updateDate + "]";
	}	

}
