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
@Table(name="tf_investor_portfolio_history")
public class InvestorPortfolioHistory  implements Serializable{
	


	private static final long serialVersionUID = -2372301175575335666L;

	@Id
    @Column(name="id")
    @GeneratedValue
	private Long id;
	
	@ManyToOne(cascade=CascadeType.ALL)	
	@JoinColumn(name = "investor_id")  
	private InvestorPortfolio investorPortfolio;	
	
	@Column(name="investment_discount_rate")
	private Integer discountRate;
	
	@Column(name="investment_cap")
	private BigDecimal investmentCap;
	
	@Column(name="start_date")
	@Temporal(TemporalType.TIMESTAMP)
	private Date startDate;
	
	@Column(name="end_date")
	@Temporal(TemporalType.TIMESTAMP)
	private Date endDate;
	
	@Column(name="updated_by")
	private String updatedBy;
	
	public InvestorPortfolioHistory() {
		// TODO Auto-generated constructor stub
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public InvestorPortfolio getInvestorPortfolio() {
		return investorPortfolio;
	}

	public void setInvestorPortfolio(InvestorPortfolio investorPortfolio) {
		this.investorPortfolio = investorPortfolio;
	}

	public Integer getDiscountRate() {
		return discountRate;
	}

	public void setDiscountRate(Integer discountRate) {
		this.discountRate = discountRate;
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

	public BigDecimal getInvestmentCap() {
		return investmentCap;
	}

	public void setInvestmentCap(BigDecimal investmentCap) {
		this.investmentCap = investmentCap;
	}

	@Override
	public String toString() {
		return "InvestorPortfolioHistory [id=" + id + ", investorPortfolio="
				+ investorPortfolio + ", discountRate=" + discountRate
				+ ", investmentCap=" + investmentCap + ", startDate="
				+ startDate + ", endDate=" + endDate + ", updatedBy="
				+ updatedBy + "]";
	}	
	
	
	

}
