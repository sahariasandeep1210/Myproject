package com.tf.model;

import java.io.Serializable;

public class AllInvestorsBalanceSummary implements Serializable{
	
	private static final long serialVersionUID = -6353198600315497352L;
	
	private String investorName;
	private Long   cashPostion;
	private Long receivableAmount;
	private Long totalBalanceSheet;
	public String getInvestorName() {
		return investorName;
	}
	public void setInvestorName(String investorName) {
		this.investorName = investorName;
	}
	public Long getCashPostion() {
		return cashPostion;
	}
	public void setCashPostion(Long cashPostion) {
		this.cashPostion = cashPostion;
	}
	public Long getReceivableAmount() {
		return receivableAmount;
	}
	public void setReceivableAmount(Long receivableAmount) {
		this.receivableAmount = receivableAmount;
	}
	public Long getTotalBalanceSheet() {
		return totalBalanceSheet;
	}
	public void setTotalBalanceSheet(Long totalBalanceSheet) {
		this.totalBalanceSheet = totalBalanceSheet;
	}
	
	

}
