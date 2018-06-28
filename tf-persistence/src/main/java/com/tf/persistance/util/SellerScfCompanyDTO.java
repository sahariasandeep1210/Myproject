package com.tf.persistance.util;

import java.io.Serializable;
import java.util.Date;

public class SellerScfCompanyDTO  implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 8393902309048940810L;

	private Long sellerScfCompanyId;	
	
	private String sellerName;
	
	private String scfCompanyName;
	
	private String regNumber;
	
	private Date dateestablished;
	
	private String telnumber;	
	
	private String status;

	public Long getSellerScfCompanyId() {
		return sellerScfCompanyId;
	}

	public void setSellerScfCompanyId(Long sellerScfCompanyId) {
		this.sellerScfCompanyId = sellerScfCompanyId;
	}

	public String getSellerName() {
		return sellerName;
	}

	public void setSellerName(String sellerName) {
		this.sellerName = sellerName;
	}

	public String getScfCompanyName() {
		return scfCompanyName;
	}

	public void setScfCompanyName(String scfCompanyName) {
		this.scfCompanyName = scfCompanyName;
	}

	public String getRegNumber() {
		return regNumber;
	}

	public void setRegNumber(String regNumber) {
		this.regNumber = regNumber;
	}

	public Date getDateestablished() {
		return dateestablished;
	}

	public void setDateestablished(Date dateestablished) {
		this.dateestablished = dateestablished;
	}

	public String getTelnumber() {
		return telnumber;
	}

	public void setTelnumber(String telnumber) {
		this.telnumber = telnumber;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "SellerScfCompanyDTO [sellerScfCompanyId=" + sellerScfCompanyId + ", sellerName=" + sellerName + ", scfCompanyName="
				+ scfCompanyName + ", regNumber=" + regNumber + ", dateestablished=" + dateestablished + ", telnumber=" + telnumber
				+ ", status=" + status + "]";
	}	
	
	
	
	
}
