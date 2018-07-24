package com.tf.model;

import java.io.Serializable;

public class AllInvestorsBalanceSummary implements Serializable{
	
	private static final long serialVersionUID = -6353198600315497352L;
	
	private String investorName;
	private String scfName;
	private Long   cashPostion;
	private Long   allocatedAmount;
	private Long   remainingAmount;
	private Long receivableAmount;
	private Long totalBalanceSheet;
	
	private Long investorId;
	public Long getInvestorId() {
		return investorId;
	}
	public void setInvestorId(Long investorId) {
		this.investorId = investorId;
	}
	public Long getScfId() {
		return scfId;
	}
	public void setScfId(Long scfId) {
		this.scfId = scfId;
	}
	private Long scfId;
	
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
	public String getScfName() {
		return scfName;
	}
	public void setScfName(String scfName) {
		this.scfName = scfName;
	}
	public Long getAllocatedAmount() {
		return allocatedAmount;
	}
	public void setAllocatedAmount(Long allocatedAmount) {
		this.allocatedAmount = allocatedAmount;
	}
	public Long getRemainingAmount() {
		return remainingAmount;
	}
	public void setRemainingAmount(Long remainingAmount) {
		this.remainingAmount = remainingAmount;
	}
	
	

}
