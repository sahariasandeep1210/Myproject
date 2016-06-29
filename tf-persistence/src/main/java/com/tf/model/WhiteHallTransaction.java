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
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;


@Entity
@Table(name="tf_whitehall_transaction")
public class WhiteHallTransaction implements  Serializable {	


	private static final long serialVersionUID = 3945625843117396309L;
	
	

	@Id
	@Column(name="id")
	@GeneratedValue
	private Long id;	
	
	@Column(name="amount")
	private BigDecimal 	amount;
	
	@Column(name="transcation_type") 
	private String transcationType;
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="transcation_date") 
	private Date transcationDate;
	
	@Column(name="trade_id")
	private Long tradeID;	
	
	@Column(name="reference") 
	private String reference;
	
	@OneToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "company_id")
	private Company company;
	
	@Column(name="company_type") 
	private String companyType;
	
	@Column(name="scf_trade_id") 
	private String scfTradeId;
	
	
	
	public WhiteHallTransaction() {
		
	}	
	

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
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

	public Company getCompany() {
		return company;
	}

	public void setCompany(Company company) {
		this.company = company;
	}


	public String getCompanyType() {
		return companyType;
	}


	public void setCompanyType(String companyType) {
		this.companyType = companyType;
	}


	
	public String getScfTradeId() {	
		return scfTradeId;
	}

	
	public void setScfTradeId(String scfTradeId) {	
		this.scfTradeId = scfTradeId;
	}


	@Override
	public String toString() {

		return "WhiteHallTransaction [id=" + id + ", amount=" + amount + ", transcationType=" + transcationType + ", transcationDate=" +
			transcationDate + ", tradeID=" + tradeID + ", reference=" + reference + ", company=" + company + ", companyType=" + companyType +
			", scfTradeId=" + scfTradeId + "]";
	}
	
	
	

}
