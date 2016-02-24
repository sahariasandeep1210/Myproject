package com.tf.persistance.util;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

public class InvestorModelDTO implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 8441612028475883912L;
	
	
	private String name;
	private Date allotmentDate;	
	private Date closingDate;
	private Integer noOfdays;

	private BigDecimal allotmentAmount;
	private BigDecimal majurityGross;
	private BigDecimal financeFee;
	private BigDecimal majurityNet;
	private BigDecimal returnAmount;
	private BigDecimal returns;
	private String status;

	public InvestorModelDTO() {
		
	}
	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	

	public Date getAllotmentDate() {
		return allotmentDate;
	}

	public void setAllotmentDate(Date allotmentDate) {
		this.allotmentDate = allotmentDate;
	}
	
	public Date getClosingDate() {
		return closingDate;
	}

	public void setClosingDate(Date closingDate) {
		this.closingDate = closingDate;
	}
	
	public Integer getNoOfdays() {
		return noOfdays;
	}

	public void setNoOfdays(Integer noOfdays) {
		this.noOfdays = noOfdays;
	}
	
	public BigDecimal getAllotmentAmount() {
		return allotmentAmount;
	}

	public void setAllotmentAmount(BigDecimal allotmentAmount) {
		this.allotmentAmount = allotmentAmount;
	}
	
	public BigDecimal getMajurityGross() {
		return majurityGross;
	}

	public void setMajurityGross(BigDecimal majurityGross) {
		this.majurityGross = majurityGross;
	}
	
	public BigDecimal getFinanceFee() {
		return financeFee;
	}

	public void setFinanceFee(BigDecimal financeFee) {
		this.financeFee = financeFee;
	}
	public BigDecimal getMajurityNet() {
		return majurityNet;
	}

	public void setMajurityNet(BigDecimal majurityNet) {
		this.majurityNet = majurityNet;
	}
	public BigDecimal getReturnAmount() {
		return returnAmount;
	}

	public void setReturnAmount(BigDecimal returnAmount) {
		this.returnAmount = returnAmount;
	}
	public BigDecimal getReturns() {
		return returns;
	}

	public void setReturns(BigDecimal returns) {
		this.returns = returns;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	

}
