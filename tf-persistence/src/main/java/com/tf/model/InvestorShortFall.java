package com.tf.model;

import java.io.Serializable;

public class InvestorShortFall implements Serializable {
	
	private static final long serialVersionUID = 8907431922945302107L;
	
	private Long credit;
	private Long avail;
	private Long invested;
	private String scfName;
	private Long invoiceAmount;
	private Long shortFallAmount;
	public Long getCredit() {
		return credit;
	}
	public void setCredit(Long credit) {
		this.credit = credit;
	}
	public Long getAvail() {
		return avail;
	}
	public void setAvail(Long avail) {
		this.avail = avail;
	}
	public Long getInvested() {
		return invested;
	}
	public void setInvested(Long invested) {
		this.invested = invested;
	}
	public String getScfName() {
		return scfName;
	}
	public void setScfName(String scfName) {
		this.scfName = scfName;
	}
	public Long getInvoiceAmount() {
		return invoiceAmount;
	}
	public void setInvoiceAmount(Long invoiceAmount) {
		this.invoiceAmount = invoiceAmount;
	}
	public Long getShortFallAmount() {
		return shortFallAmount;
	}
	public void setShortFallAmount(Long shortFallAmount) {
		this.shortFallAmount = shortFallAmount;
	}
	
	
	

	
}
