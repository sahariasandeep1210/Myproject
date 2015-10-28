package com.tf.service;

public class InvestorPortfolio {

	int investorId; 
	int totalAmt;
	int allotedAmt;
	int availableAmt; 
	int rate; 
	int sameRateCount =1 ;
	
	
	public int getInvestorId() {
		return investorId;
	}
	public void setInvestorId(int investorId) {
		this.investorId = investorId;
	}
	public int getTotalAmt() {
		return totalAmt;
	}
	public void setTotalAmt(int totalAmt) {
		this.totalAmt = totalAmt;
	}
	public int getAllotedAmt() {
		return allotedAmt;
	}
	public void setAllotedAmt(int allotedAmt) {
		this.allotedAmt = allotedAmt;
	}
	public int getAvailableAmt() {
		return availableAmt;
	}
	public void setAvailableAmt(int availableAmt) {
		this.availableAmt = availableAmt;
	}
	public int getRate() {
		return rate;
	}
	public void setRate(int rate) {
		this.rate = rate;
	}
	public int getSameRateCount() {
		return sameRateCount;
	}
	public void setSameRateCount(int sameRateCount) {
		this.sameRateCount = sameRateCount;
	}
	@Override
	public String toString() {
		return "InvestorPortfolio [investorId=" + investorId + ", totalAmt=" + totalAmt + ", allotedAmt=" + allotedAmt
				+ ", availableAmt=" + availableAmt + ", rate=" + rate + ", sameRateCount=" + sameRateCount + "]";
	}
	public InvestorPortfolio(int investorId, int totalAmt, int allotedAmt, int availableAmt, int rate) {
		super();
		this.investorId = investorId;
		this.totalAmt = totalAmt;
		this.allotedAmt = allotedAmt;
		this.availableAmt = availableAmt;
		this.rate = rate;
	}
	
	
	
}
