package com.tf.controller.investment;

import java.util.Comparator;
import java.util.Date;

public class MyInvestmentModel implements Comparable<MyInvestmentModel> {
	private int rowNo;
	private String tradeNumber;
	private String tradeId;
	private String bps;
	
	private String status;
	
	private String duration;
	private Date startDate;
	private Date endDate;
	
	private String whiteHallCharges;
	private String myAllotment;
	private String grossProfit;
	private String netProfit;
	private String receivableAmount;
	
	private String totalTradeAmount;
	private String vatInvestorFee;
	
	
	public String getVatInvestorFee() {
		return vatInvestorFee;
	}
	public void setVatInvestorFee(String vatInvestorFee) {
		this.vatInvestorFee = vatInvestorFee;
	}
	public int getRowNo() {
		return rowNo;
	}
	public void setRowNo(int rowNo) {
		this.rowNo = rowNo;
	}
	public String getBps() {
		return bps;
	}
	public void setBps(String bps) {
		this.bps = bps;
	}
	public String getTotalTradeAmount() {
		return totalTradeAmount;
	}
	public void setTotalTradeAmount(String totalTradeAmount) {
		this.totalTradeAmount = totalTradeAmount;
	}
	public String getTradeId() {
		return tradeId;
	}
	public void setTradeId(String tradeId) {
		this.tradeId = tradeId;
	}
	
	public String getReceivableAmount() {
		return receivableAmount;
	}
	public void setReceivableAmount(String receivableAmount) {
		this.receivableAmount = receivableAmount;
	}
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
	
	
	public static class OrderByNetProfit implements Comparator<MyInvestmentModel>{

		public int compare(MyInvestmentModel o1, MyInvestmentModel o2) {
			// TODO Auto-generated method stub
			return Float.parseFloat(o1.netProfit) > Float.parseFloat(o2.netProfit) ? 1 : (Float.parseFloat(o1.netProfit) < Float.parseFloat(o2.netProfit) ? -1 : 0);

			
		}
		
		
	}
	
	public int compareTo(MyInvestmentModel o) {
		// TODO Auto-generated method stub
		 return this.tradeNumber.compareTo(o.tradeNumber);
		 
	}
	@Override
	public int hashCode() {
		// TODO Auto-generated method stub
		return super.hashCode();
	}
	@Override
	public boolean equals(Object obj) {
		// TODO Auto-generated method stub
		return super.equals(obj);
	}
	@Override
	protected Object clone() throws CloneNotSupportedException {
		// TODO Auto-generated method stub
		return super.clone();
	}
	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return super.toString();
	}
	@Override
	protected void finalize() throws Throwable {
		// TODO Auto-generated method stub
		super.finalize();
	}
	
	
	
	
	
	
	
	

}
