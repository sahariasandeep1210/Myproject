package com.tf.persistance.util;

import java.io.Serializable;
import java.math.BigDecimal;

public class InvestorProtfolioDTO  implements Serializable{
	
	
	private static final long serialVersionUID = -58998356924107048L;
	
	private Long investorId; 
	private BigDecimal mycreditLine;
	private BigDecimal amountInvested;
	private BigDecimal availToInvest; 
	private Integer discountRate;
	private Integer sameRateCount;
	
	public InvestorProtfolioDTO(){
		
	}

	public Long getInvestorId() {
		return investorId;
	}

	public void setInvestorId(Long investorId) {
		this.investorId = investorId;
	}

	public BigDecimal getMycreditLine() {
		return mycreditLine;
	}

	public void setMycreditLine(BigDecimal mycreditLine) {
		this.mycreditLine = mycreditLine;
	}

	public BigDecimal getAmountInvested() {
		return amountInvested;
	}

	public void setAmountInvested(BigDecimal amountInvested) {
		this.amountInvested = amountInvested;
	}

	public BigDecimal getAvailToInvest() {
		return availToInvest;
	}

	public void setAvailToInvest(BigDecimal availToInvest) {
		this.availToInvest = availToInvest;
	}

	public Integer getDiscountRate() {
		return discountRate;
	}

	public void setDiscountRate(Integer discountRate) {
		this.discountRate = discountRate;
	}

	public Integer getSameRateCount() {
		return sameRateCount;
	}

	public void setSameRateCount(Integer sameRateCount) {
		this.sameRateCount = sameRateCount;
	}

	@Override
	public String toString() {
		return "InvestorProtfolioDTO [investorId=" + investorId
				+ ", mycreditLine=" + mycreditLine + ", amountInvested="
				+ amountInvested + ", availToInvest=" + availToInvest
				+ ", discountRate=" + discountRate + ", sameRateCount="
				+ sameRateCount + "]";
	}
	

}
