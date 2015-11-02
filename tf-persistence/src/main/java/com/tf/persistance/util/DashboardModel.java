package com.tf.persistance.util;

public class DashboardModel {
	
	private long investmentCap;
	private long availToInvest;
	private long amountInvested;
	
	public DashboardModel() {
		
	}

	public long getInvestmentCap() {
		return investmentCap;
	}

	public void setInvestmentCap(long investmentCap) {
		this.investmentCap = investmentCap;
	}

	public long getAvailToInvest() {
		return availToInvest;
	}

	public void setAvailToInvest(long availToInvest) {
		this.availToInvest = availToInvest;
	}

	public long getAmountInvested() {
		return amountInvested;
	}

	public void setAmountInvested(long amountInvested) {
		this.amountInvested = amountInvested;
	}

	@Override
	public String toString() {
		return "DashboardModel [investmentCap=" + investmentCap
				+ ", availToInvest=" + availToInvest + ", amountInvested="
				+ amountInvested + "]";
	}	
	

}
