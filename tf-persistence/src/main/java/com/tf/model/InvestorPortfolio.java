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
@Table(name="tf_investor_portfolio")
public class InvestorPortfolio implements Serializable{
	

	private static final long serialVersionUID = 3720078521846736343L;

	@Id
    @Column(name="investor_id")
    @GeneratedValue
	private Long investorId;	
	
	@Column(name="investment_discount_rate")
	private Integer discountRate;
	
	@Column(name="investor_status",nullable = false, columnDefinition = "TINYINT", length = 1)
	private boolean investorStatus;
	
	@Column(name="investor_type")
	private Boolean investorType;
	
	@Column(name="max_dicsount_rate")
	private Integer maxDiscountRate;
	
	@Column(name="min_discount_rate")
	private Integer minDiscountRate;
	
	
	@OneToOne(cascade=CascadeType.ALL)
	@JoinColumn(name = "company_id")  
	private  Company company;
	
	@Column(name="start_date")
	@Temporal(TemporalType.TIMESTAMP)
	private Date startDate;
	
	@Column(name="end_date")
	@Temporal(TemporalType.TIMESTAMP)
	private Date endDate;
	
	@Column(name="updated_by")
	private Date updatedBy;
	
	@Column(name="available_to_invest")
	private BigDecimal availToInvest;	
	
	@Column(name="amount_invested")
	private BigDecimal amountInvested;	
	
	@Column(name="investment_cap")
	private BigDecimal investmentCap;	
	
	public InvestorPortfolio() {
		// TODO Auto-generated constructor stub
	}

	public Long getInvestorId() {
		return investorId;
	}

	public void setInvestorId(Long investorId) {
		this.investorId = investorId;
	}

	public Integer getDiscountRate() {
		return discountRate;
	}

	public void setDiscountRate(Integer discountRate) {
		this.discountRate = discountRate;
	}

	public boolean getInvestorStatus() {
		return investorStatus;
	}

	public void setInvestorStatus(boolean investorStatus) {
		this.investorStatus = investorStatus;
	}

	public Boolean getInvestorType() {
		return investorType;
	}

	public void setInvestorType(Boolean investorType) {
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

	public Company getCompanyId() {
		return company;
	}

	public void setCompanyId(Company company) {
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

	public Date getUpdatedBy() {
		return updatedBy;
	}

	public void setUpdatedBy(Date updatedBy) {
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

	public BigDecimal getInvestmentCap() {
		return investmentCap;
	}

	public void setInvestmentCap(BigDecimal investmentCap) {
		this.investmentCap = investmentCap;
	}

	@Override
	public String toString() {
		return "InvestorPortfolio [investorId=" + investorId
				+ ", discountRate=" + discountRate + ", investorStatus="
				+ investorStatus + ", investorType=" + investorType
				+ ", maxDiscountRate=" + maxDiscountRate + ", minDiscountRate="
				+ minDiscountRate + ", companyId=" + company + ", startDate="
				+ startDate + ", endDate=" + endDate + ", updatedBy="
				+ updatedBy + ", availToInvest=" + availToInvest
				+ ", amountInvested=" + amountInvested + ", investmentCap="
				+ investmentCap + "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result
				+ ((investorId == null) ? 0 : investorId.hashCode());
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
		InvestorPortfolio other = (InvestorPortfolio) obj;
		if (investorId == null) {
			if (other.investorId != null)
				return false;
		} else if (!investorId.equals(other.investorId))
			return false;
		return true;
	}	
	
	

}
