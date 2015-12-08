package com.tf.model;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.hibernate.annotations.Type;


@Entity
@Table(name="scf_trade")
public class SCFTrade  implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -1186610806150785622L;

	@Id
    @Column(name="id")
    @GeneratedValue
	private Long id;
	
	@Column(name="scf_trade")
	private String scfTrade;
	
	@Column(name="duration")
	private Integer duration;
	
	@Column(name="closing_date")
	private Date closingDate;
	
	@Column(name="opening_date")
	private Date openingDate;
	
	@Column(name="investor_Payment_date")
	private Date investorPaymentDate;	
	
	@Column(name="Seller_Payment_date")
	private Date SellerPaymentDate;
	
	@Column(name="trade_amount")
	private BigDecimal tradeAmount;
	
	@Column(name="status")
	private String status;
	
	@OneToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "company_id")
	private Company company;
	
	@Column(name="trade_notes")
	private String tradeNotes;	
	
	//@Type(type = "org.hibernate.type.NumericBooleanType")
	//@Column(name="trade_settled",columnDefinition = "TINYINT")
	//@Type(type = "org.hibernate.type.NumericBooleanType")
	//@org.hibernate.annotations.Type(type="true_false")
	//@Column(name="trade_settled", columnDefinition = "TINYINT(1) DEFAULT 0")
	@Column(name="trade_settled",nullable = false, columnDefinition = "TINYINT", length = 1)
	private boolean tradeSettled;
	
	//@Column(name="want_to_insure", columnDefinition = "TINYINT")
	//@Type(type = "org.hibernate.type.NumericBooleanType")
	//@org.hibernate.annotations.Type(type="true_false")
	//@Column(name="want_to_insure", columnDefinition = "TINYINT(1) DEFAULT 0")
	@Column(name="want_to_insure",nullable = false, columnDefinition = "TINYINT", length = 1)
	private boolean wantToInsure;
	
	@Column(name="insurance_doc_id")
	private Long insuranceDocId;
	
	@Column(name="insurance_doc_name")
	private String insuranceDocName;
	
	@Column(name="insurance_doc_url")
	private String insuranceDocUrl;
	
	@Column(name="insurance_doc_type")
	private String insuranceDocType;
	
	@Column(name="promisory_note")
	private String promisoryNote;
	
	@Column(name="create_date")
	private Date createDate;
	
	@Column(name="update_date")
	private Date updatDate;
	
	
	@OneToMany(mappedBy = "scfTrade",cascade=CascadeType.ALL) 
	private Set<Invoice> invoices;
	
	
	
	public SCFTrade() {
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

	public boolean getTradeSettled() {
		return tradeSettled;
	}

	public void setTradeSettled(boolean tradeSettled) {
		this.tradeSettled = tradeSettled;
	}

	public boolean getWantToInsure() {
		return wantToInsure;
	}

	public void setWantToInsure(boolean wantToInsure) {
		this.wantToInsure = wantToInsure;
	}

	public Long getInsuranceDocId() {
		return insuranceDocId;
	}

	public void setInsuranceDocId(Long insuranceDocId) {
		this.insuranceDocId = insuranceDocId;
	}

	public String getInsuranceDocName() {
		return insuranceDocName;
	}

	public void setInsuranceDocName(String insuranceDocName) {
		this.insuranceDocName = insuranceDocName;
	}

	public String getInsuranceDocUrl() {
		return insuranceDocUrl;
	}

	public void setInsuranceDocUrl(String insuranceDocUrl) {
		this.insuranceDocUrl = insuranceDocUrl;
	}

	public String getInsuranceDocType() {
		return insuranceDocType;
	}

	public void setInsuranceDocType(String insuranceDocType) {
		this.insuranceDocType = insuranceDocType;
	}

	public String getPromisoryNote() {
		return promisoryNote;
	}

	public void setPromisoryNote(String promisoryNote) {
		this.promisoryNote = promisoryNote;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public Date getUpdatDate() {
		return updatDate;
	}

	public void setUpdatDate(Date updatDate) {
		this.updatDate = updatDate;
	}

	

	public Set<Invoice> getInvoices() {
		return invoices;
	}

	public void setInvoices(Set<Invoice> invoices) {
		this.invoices = invoices;
	}

	@Override
	public String toString() {
		return "SCFTrade [id=" + id + ", scfTrade=" + scfTrade + ", duration="
				+ duration + ", closingDate=" + closingDate + ", openingDate="
				+ openingDate + ", investorPaymentDate=" + investorPaymentDate
				+ ", SellerPaymentDate=" + SellerPaymentDate + ", tradeAmount="
				+ tradeAmount + ", status=" + status + ", company="
				+ company + ", tradeNotes=" + tradeNotes + ", tradeSettled="
				+ tradeSettled + ", wantToInsure=" + wantToInsure
				+ ", insuranceDocId=" + insuranceDocId + ", insuranceDocName="
				+ insuranceDocName + ", insuranceDocUrl=" + insuranceDocUrl
				+ ", insuranceDocType=" + insuranceDocType + ", promisoryNote="
				+ promisoryNote + ", createDate=" + createDate + ", updatDate="
				+ updatDate + ", invoices="+invoices+"]";
	}	

}
