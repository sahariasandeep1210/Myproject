package com.tf.services.dto;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

public class Allotment  implements Serializable {

    private static final long serialVersionUID = 5204244412551100827L;
    
    private 	Long allotmentId;    
    private  	Long scfTradeID;	
    private 	Long investorID;
    private 	BigDecimal allotmentAmount;
    private 	Integer noOfdays;
    private 	boolean isPrimary;
    private  	Long userId;
    private 	Integer marketDiscount;
    private 	BigDecimal investorGrossProfit;
    private 	BigDecimal whitehallProfitShare;
    private 	BigDecimal investorNetProfit;
    private	Date allotmentDate;	
    private 	String status;
    
    public Allotment() {
	
    }

    public Long getAllotmentId() {
        return allotmentId;
    }

    public void setAllotmentId(Long allotmentId) {
        this.allotmentId = allotmentId;
    }

    public Long getScfTradeID() {
        return scfTradeID;
    }

    public void setScfTradeID(Long scfTradeID) {
        this.scfTradeID = scfTradeID;
    }

    public Long getInvestorID() {
        return investorID;
    }

    public void setInvestorID(Long investorID) {
        this.investorID = investorID;
    }

    public BigDecimal getAllotmentAmount() {
        return allotmentAmount;
    }

    public void setAllotmentAmount(BigDecimal allotmentAmount) {
        this.allotmentAmount = allotmentAmount;
    }

    public Integer getNoOfdays() {
        return noOfdays;
    }

    public void setNoOfdays(Integer noOfdays) {
        this.noOfdays = noOfdays;
    }

    public boolean isPrimary() {
        return isPrimary;
    }

    public void setPrimary(boolean isPrimary) {
        this.isPrimary = isPrimary;
    }

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public Integer getMarketDiscount() {
        return marketDiscount;
    }

    public void setMarketDiscount(Integer marketDiscount) {
        this.marketDiscount = marketDiscount;
    }

    public BigDecimal getInvestorGrossProfit() {
        return investorGrossProfit;
    }

    public void setInvestorGrossProfit(BigDecimal investorGrossProfit) {
        this.investorGrossProfit = investorGrossProfit;
    }

    public BigDecimal getWhitehallProfitShare() {
        return whitehallProfitShare;
    }

    public void setWhitehallProfitShare(BigDecimal whitehallProfitShare) {
        this.whitehallProfitShare = whitehallProfitShare;
    }

    public BigDecimal getInvestorNetProfit() {
        return investorNetProfit;
    }

    public void setInvestorNetProfit(BigDecimal investorNetProfit) {
        this.investorNetProfit = investorNetProfit;
    }

    public Date getAllotmentDate() {
        return allotmentDate;
    }

    public void setAllotmentDate(Date allotmentDate) {
        this.allotmentDate = allotmentDate;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @Override
    public String toString() {
	return "Allotment [allotmentId=" + allotmentId + ", scfTradeID="
		+ scfTradeID + ", investorID=" + investorID
		+ ", allotmentAmount=" + allotmentAmount + ", noOfdays="
		+ noOfdays + ", isPrimary=" + isPrimary + ", userId=" + userId
		+ ", marketDiscount=" + marketDiscount
		+ ", investorGrossProfit=" + investorGrossProfit
		+ ", whitehallProfitShare=" + whitehallProfitShare
		+ ", investorNetProfit=" + investorNetProfit
		+ ", allotmentDate=" + allotmentDate + ", status=" + status
		+ "]";
    }
    
    
    
    
}
