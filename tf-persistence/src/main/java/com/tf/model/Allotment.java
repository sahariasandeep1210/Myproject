package com.tf.model;

import java.io.Serializable;
import java.math.BigDecimal;
import java.sql.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;


@Entity
@Table(name="tf_allotments")
public class Allotment implements Serializable {
	
	
	private static final long serialVersionUID = 8986830734020138171L;

	@Id
    @Column(name="allotment_id")
    @GeneratedValue
	private Long allotmentId;
	
	@OneToOne(cascade=CascadeType.ALL)
	@JoinColumn(name = "trade_id")  
	private  SCFTrade scfTrade;
	
	@OneToOne(cascade=CascadeType.ALL)
	@JoinColumn(name = "investor_id")  
	private  InvestorPortfolio investorPortfolio;
	
	@Column(name="allotment_amount")
	private BigDecimal allotmentAmount;
	
	@Column(name="noofdays")
	private Integer noOfdays;
	
	@Column(name="is_primary")
	private Boolean isPrimary;
	
	@OneToOne(cascade=CascadeType.ALL)
	@JoinColumn(name = "user_id")  
	private  User userId;
	
	@Column(name="market_discount")
	private Integer marketDiscount;
	
	@Column(name="market_discount")
	private Date allotmentDate;
	
	public Allotment() {
	}

	public Long getAllotmentId() {
		return allotmentId;
	}

	public void setAllotmentId(Long allotmentId) {
		this.allotmentId = allotmentId;
	}

	public SCFTrade getScfTrade() {
		return scfTrade;
	}

	public void setScfTrade(SCFTrade scfTrade) {
		this.scfTrade = scfTrade;
	}

	public InvestorPortfolio getInvestorPortfolio() {
		return investorPortfolio;
	}

	public void setInvestorPortfolio(InvestorPortfolio investorPortfolio) {
		this.investorPortfolio = investorPortfolio;
	}

	public BigDecimal getAllotmentAmount() {
		return allotmentAmount;
	}

	public void setAllotmentAmount(BigDecimal allotmentAmount) {
		this.allotmentAmount = allotmentAmount;
	}

	public Integer getNoOfdays() {
		return noOfdays;
	}

	public void setNoOfdays(Integer noOfdays) {
		this.noOfdays = noOfdays;
	}

	public Boolean getIsPrimary() {
		return isPrimary;
	}

	public void setIsPrimary(Boolean isPrimary) {
		this.isPrimary = isPrimary;
	}

	public User getUserId() {
		return userId;
	}

	public void setUserId(User userId) {
		this.userId = userId;
	}

	public Integer getMarketDiscount() {
		return marketDiscount;
	}

	public void setMarketDiscount(Integer marketDiscount) {
		this.marketDiscount = marketDiscount;
	}

	public Date getAllotmentDate() {
		return allotmentDate;
	}

	public void setAllotmentDate(Date allotmentDate) {
		this.allotmentDate = allotmentDate;
	}

	@Override
	public String toString() {
		return "Allotment [allotmentId=" + allotmentId + ", scfTrade="
				+ scfTrade + ", investorPortfolio=" + investorPortfolio
				+ ", allotmentAmount=" + allotmentAmount + ", noOfdays="
				+ noOfdays + ", isPrimary=" + isPrimary + ", userId=" + userId
				+ ", marketDiscount=" + marketDiscount + ", allotmentDate="
				+ allotmentDate + "]";
	}
	

}
