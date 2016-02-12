package com.tf.model;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="tf_investor_transaction")
public class InvestorTransaction implements Serializable {

	

	/**
	 * 
	 */
	private static final long serialVersionUID = 1234933124020707177L;

	@Id
    @Column(name="id")
    @GeneratedValue
	private Long id;
	
	@Column(name="investor_id")
	private Long investorID;	
	
	@Column(name="amount")
	private BigDecimal 	amount;
	
	@Column(name="transcation_type") 
	private String transcationType;
	
	@Column(name="transcation_date") 
	private Date transcationDate;
	
	@Column(name="trade_id")
	private Long tradeID;	
	
	@Column(name="reference") 
	private String reference;
	
	public InvestorTransaction(){
		
	}
	
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}
	public Long getInvestorID() {
		return investorID;
	}

	public void setInvestorID(Long investorID) {
		this.investorID = investorID;
	}
	
	public BigDecimal getAmount() {
		return amount;

	}
	public void setAmount(BigDecimal amount) {
		this.amount = amount;

	}
	public String getTranscationType() {
		return transcationType;

	}
	public void setTranscationType(String transcationType) {
		this.transcationType = transcationType;

	}
	
	public Date getTranscationDate() {
		return transcationDate;

	}
	public void setTranscationDate(Date transcationDate) {
		this.transcationDate = transcationDate;

	}
	

	public Long getTradeID() {
		return tradeID;
	}

	public void setTradeID(Long tradeID) {
		this.tradeID = tradeID;
	}

	public String getReference() {
		return reference;

	}
	public void setReference(String reference) {
		this.reference = reference;

	}
	
	
}
