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
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;

@Entity
@Table(name="scf_trade")
public class SCFTrade  implements Serializable{
	
	private static final long serialVersionUID = -3106577799099944699L;
	

	@Id
    @Column(name="id")
    @GeneratedValue
	private Long id;
	
	@Column(name="scf_trade")
	private String scfTrade;
	
	@Column(name="scf_id")
	private String scfId;
	
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
	
	/* Newly colunmn added */
	@Column(name="seller_transaction_fee")
	private BigDecimal 	sellerTransFee;
	
	@Column(name="investor_total_gross_profit")
	private BigDecimal investorTotalGross;
	
	@Column(name="whitehall_total_share")
	private BigDecimal whitehallTotalShare;
	
	@Column(name="investor_total_net_profit")
	private BigDecimal investorTotalProfit;
	
	@Column(name="seller_fees")
	private BigDecimal sellerFees;
	
	@Column(name="whitehall_total_profit")
	private BigDecimal whitehallTotalProfit;
	
	@Column(name="whitehall_net_receivable")
	private BigDecimal whitehallNetReceivable;
	
	@Column(name="seller_net_allotment")
	private BigDecimal sellerNetAllotment;
	
	
	
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
	
	@Column(name="promisory_doc_id")
	private Long promisoryDocId;
	
	@Column(name="promisory_doc_name")
	private String promisoryDocName;
	
	@Column(name="promisory_doc_url")
	private String promisoryDocUrl;
	
	@Column(name="promisory_doc_type")
	private String promisoryDocType;
	
	@Column(name="promisory_note")
	private String promisoryNote;
	
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="create_date")
	private Date createDate;
	
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="update_date")
	private Date updatDate;
	

	
	@OneToMany(mappedBy = "scfTrade",cascade=CascadeType.ALL) 
	private Set<Invoice> invoices;
	
	
	@OneToMany(mappedBy = "scfTrade",cascade=CascadeType.ALL) 
	private Set<Allotment> allotments;
	
	@Transient
	private int invoiceNumber;
	
	@Column(name="investor_total_vat_amount")
	private BigDecimal investorTotalVatAmount;
	
	@Column(name="vat_whitehall_gross_profit")
	private BigDecimal vatWhitehallGrossProfit;
	
	@Column(name="vat_finance_amount")
	private BigDecimal vatFinanceAmount;
	
	
	
	
	public BigDecimal getVatWhitehallGrossProfit() {
		return vatWhitehallGrossProfit;
	}

	public void setVatWhitehallGrossProfit(BigDecimal vatWhitehallGrossProfit) {
		this.vatWhitehallGrossProfit = vatWhitehallGrossProfit;
	}

	public BigDecimal getVatFinanceAmount() {
		return vatFinanceAmount;
	}

	public void setVatFinanceAmount(BigDecimal vatFinanceAmount) {
		this.vatFinanceAmount = vatFinanceAmount;
	}

	public BigDecimal getInvestorTotalVatAmount() {
		return investorTotalVatAmount;
	}

	public void setInvestorTotalVatAmount(BigDecimal investorTotalVatAmount) {
		this.investorTotalVatAmount = investorTotalVatAmount;
	}

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

	public String getScfId() {
		return scfId;
	}

	public void setScfId(String scfId) {
		this.scfId = scfId;
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

	public BigDecimal getInvestorTotalGross() {
		return investorTotalGross;
	}

	public void setInvestorTotalGross(BigDecimal investorTotalGross) {
		this.investorTotalGross = investorTotalGross;
	}

	public BigDecimal getWhitehallTotalShare() {
		return whitehallTotalShare;
	}

	public void setWhitehallTotalShare(BigDecimal whitehallTotalShare) {
		this.whitehallTotalShare = whitehallTotalShare;
	}

	public BigDecimal getInvestorTotalProfit() {
		return investorTotalProfit;
	}

	public void setInvestorTotalProfit(BigDecimal investorTotalProfit) {
		this.investorTotalProfit = investorTotalProfit;
	}

	public BigDecimal getSellerFees() {
		return sellerFees;
	}

	public void setSellerFees(BigDecimal sellerFees) {
		this.sellerFees = sellerFees;
	}

	public BigDecimal getWhitehallTotalProfit() {
		return whitehallTotalProfit;
	}

	public void setWhitehallTotalProfit(BigDecimal whitehallTotalProfit) {
		this.whitehallTotalProfit = whitehallTotalProfit;
	}

	public BigDecimal getWhitehallNetReceivable() {
		return whitehallNetReceivable;
	}

	public void setWhitehallNetReceivable(BigDecimal whitehallNetReceivable) {
		this.whitehallNetReceivable = whitehallNetReceivable;
	}

	public BigDecimal getSellerNetAllotment() {
		return sellerNetAllotment;
	}

	public void setSellerNetAllotment(BigDecimal sellerNetAllotment) {
		this.sellerNetAllotment = sellerNetAllotment;
	}

	public Set<Allotment> getAllotments() {
		return allotments;
	}

	public void setAllotments(Set<Allotment> allotments) {
		this.allotments = allotments;
	}
	public BigDecimal getSellerTransFee() {
		return sellerTransFee;
	}
	
	public void setSellerTransFee(BigDecimal sellerTransFee) {
		this.sellerTransFee = sellerTransFee;
	}
	
	
	public Long getPromisoryDocId() {
		return promisoryDocId;
	}

	public void setPromisoryDocId(Long promisoryDocId) {
		this.promisoryDocId = promisoryDocId;
	}

	public String getPromisoryDocName() {
		return promisoryDocName;
	}

	public void setPromisoryDocName(String promisoryDocName) {
		this.promisoryDocName = promisoryDocName;
	}

	public String getPromisoryDocUrl() {
		return promisoryDocUrl;
	}

	public void setPromisoryDocUrl(String promisoryDocUrl) {
		this.promisoryDocUrl = promisoryDocUrl;
	}

	public String getPromisoryDocType() {
		return promisoryDocType;
	}

	public void setPromisoryDocType(String promisoryDocType) {
		this.promisoryDocType = promisoryDocType;
	}

	public int getInvoiceNumber() {
		return invoiceNumber;
	}

	public void setInvoiceNumber(int invoiceNumber) {
		this.invoiceNumber = invoiceNumber;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((id == null) ? 0 : id.hashCode());
		return result;
	}

	
	

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		SCFTrade other = (SCFTrade) obj;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		return true;
	}

	
	
	

}
