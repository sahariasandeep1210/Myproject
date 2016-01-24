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
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;


@Entity
@Table(name="tf_investor_portfolio")
public class InvestorPortfolio implements Serializable{
	


	

	private static final long serialVersionUID = 2443204712670444306L;

	@Id
    @Column(name="investor_portfolio_id")
    @GeneratedValue
	private Long investorProtId;	
	
	@ManyToOne(cascade=CascadeType.ALL)	
	@JoinColumn(name = "investor_id")  
	private Investor investor;
	
	@Column(name="investment_discount_rate")
	private Integer discountRate;
	
	@Column(name="investor_status",nullable = false, columnDefinition = "TINYINT", length = 1)
	private boolean investorStatus;
	
	@Column(name="investor_type")
	private String investorType;
	
	@Column(name="max_dicsount_rate")
	private Integer maxDiscountRate;
	
	@Column(name="min_discount_rate")
	private Integer minDiscountRate;
	
	
	@OneToOne
	@JoinColumn(name = "company_id")  
	private  Company company;
	
	@Column(name="start_date")
	@Temporal(TemporalType.TIMESTAMP)
	private Date startDate;
	
	@Column(name="end_date")
	@Temporal(TemporalType.TIMESTAMP)
	private Date endDate;
	
	@Column(name="updated_by")
	private String updatedBy;
	
	@Column(name="available_to_invest")
	private BigDecimal availToInvest;	
	
	@Column(name="amount_invested")
	private BigDecimal amountInvested;	
	
	@Column(name="my_credit_line")
	private BigDecimal myCreditLine;
	
	@Column(name="current_credit_line")
	private BigDecimal currentCreditLine;	
	

	
	public InvestorPortfolio() {
		// TODO Auto-generated constructor stub
	}

	public Long getInvestorProtId() {
		return investorProtId;
	}

	public void setInvestorProtId(Long investorProtId) {
		this.investorProtId = investorProtId;
	}

	public Investor getInvestor() {
		return investor;
	}

	public void setInvestor(Investor investor) {
		this.investor = investor;
	}

	public Integer getDiscountRate() {
		return discountRate;
	}

	public void setDiscountRate(Integer discountRate) {
		this.discountRate = discountRate;
	}

	public boolean isInvestorStatus() {
		return investorStatus;
	}

	public void setInvestorStatus(boolean investorStatus) {
		this.investorStatus = investorStatus;
	}

	public String getInvestorType() {
		return investorType;
	}

	public void setInvestorType(String investorType) {
		this.investorType = investorType;
	}

	public Integer getMaxDiscountRate() {
		return maxDiscountRate;
	}

	public void setMaxDiscountRate(Integer maxDiscountRate) {
		this.maxDiscountRate = maxDiscountRate;
	}

	public Integer getMinDiscountRate() {
		return minDiscountRate;
	}

	public void setMinDiscountRate(Integer minDiscountRate) {
		this.minDiscountRate = minDiscountRate;
	}

	public Company getCompany() {
		return company;
	}

	public void setCompany(Company company) {
		this.company = company;
	}

	public Date getStartDate() {
		return startDate;
	}

	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}

	public Date getEndDate() {
		return endDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}

	public String getUpdatedBy() {
		return updatedBy;
	}

	public void setUpdatedBy(String updatedBy) {
		this.updatedBy = updatedBy;
	}

	public BigDecimal getAvailToInvest() {
		return availToInvest;
	}

	public void setAvailToInvest(BigDecimal availToInvest) {
		this.availToInvest = availToInvest;
	}

	public BigDecimal getAmountInvested() {
		return amountInvested;
	}

	public void setAmountInvested(BigDecimal amountInvested) {
		this.amountInvested = amountInvested;
	}	

	public BigDecimal getMyCreditLine() {
		return myCreditLine;
	}

	public void setMyCreditLine(BigDecimal myCreditLine) {
		this.myCreditLine = myCreditLine;
	}

	public BigDecimal getCurrentCreditLine() {
		return currentCreditLine;
	}

	public void setCurrentCreditLine(BigDecimal currentCreditLine) {
		this.currentCreditLine = currentCreditLine;
	}

	
	

}
