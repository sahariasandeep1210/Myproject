package com.tf.controller.investment;

import java.util.Date;

public class MyInvestmentModel {
	
	private String tradeNumber;
	private String status;
	
	private String duration;
	private Date startDate;
	private Date endDate;
	
	private String whiteHallCharges;
	private String myAllotment;
	private String grossProfit;
	private String netProfit;
	public String getTradeNumber() {
		return tradeNumber;
	}
	public void setTradeNumber(String tradeNumber) {
		this.tradeNumber = tradeNumber;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getDuration() {
		return duration;
	}
	public void setDuration(String duration) {
		this.duration = duration;
	}
	
	public String getMyAllotment() {
		return myAllotment;
	}
	public void setMyAllotment(String myAllotment) {
		this.myAllotment = myAllotment;
	}
	public String getGrossProfit() {
		return grossProfit;
	}
	public void setGrossProfit(String grossProfit) {
		this.grossProfit = grossProfit;
	}
	public String getNetProfit() {
		return netProfit;
	}
	public void setNetProfit(String netProfit) {
		this.netProfit = netProfit;
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
	public String getWhiteHallCharges() {
		return whiteHallCharges;
	}
	public void setWhiteHallCharges(String whiteHallCharges) {
		this.whiteHallCharges = whiteHallCharges;
	}
	
	
	
	

}
