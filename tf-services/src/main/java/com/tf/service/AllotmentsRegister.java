package com.tf.service;

public class AllotmentsRegister {

	int allotmentId; 
	long investorId; 
	int tradeId; 
	int rate;
	int allotmentAmount ; 
	
	
	public int getAllotmentId() {
		return allotmentId;
	}
	public void setAllotmentId(int allotmentId) {
		this.allotmentId = allotmentId;
	}
	public long getInvestorId() {
		return investorId;
	}
	public void setInvestorId(long investorId) {
		this.investorId = investorId;
	}
	public int getTradeId() {
		return tradeId;
	}
	public void setTradeId(int invoiceId) {
		this.tradeId = invoiceId;
	}
	public int getRate() {
		return rate;
	}
	public void setRate(int rate) {
		this.rate = rate;
	}
	public int getAllotmentAmount() {
		return allotmentAmount;
	}
	public void setAllotmentAmount(int allotmentAmount) {
		this.allotmentAmount = allotmentAmount;
	}
	@Override
	public String toString() {
		return "AllotmentsRegister [allotmentId=" + allotmentId + ", investorId=" + investorId + ", tradeId=" + tradeId
				+ ", rate=" + rate + ", allotmentAmount=" + allotmentAmount + "]";
	}
	 
}
