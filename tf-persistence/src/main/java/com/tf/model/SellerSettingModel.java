package com.tf.model;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;



public class SellerSettingModel implements Serializable {
	
	
	
	private static final long serialVersionUID = -6732516576165099239L;
	private Long id;
	
	private String company;
	
	private BigDecimal 	sellerTransFee;
	
	private BigDecimal 	sellerFinFee;
	
	private Date createDate;
	
	private Date updateDate;
	
	private String investorCompany;
	

	public Long getId() {
		return id;
	}


	public void setId(Long id) {
		this.id = id;
	}


	public String getCompany() {
		return company;
	}


	public void setCompany(String company) {
		this.company = company;
	}


	public BigDecimal getSellerTransFee() {
		return sellerTransFee;
	}


	public void setSellerTransFee(BigDecimal sellerTransFee) {
		this.sellerTransFee = sellerTransFee;
	}


	public BigDecimal getSellerFinFee() {
		return sellerFinFee;
	}


	public void setSellerFinFee(BigDecimal sellerFinFee) {
		this.sellerFinFee = sellerFinFee;
	}


	public Date getCreateDate() {
		return createDate;
	}


	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}


	public Date getUpdateDate() {
		return updateDate;
	}


	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}


	public String getInvestorCompany() {
		return investorCompany;
	}


	public void setInvestorCompany(String investorCompany) {
		this.investorCompany = investorCompany;
	}


	@Override
	public String toString() {
		return "SellerSetting [id=" + id + ", sellerTransFee=" + sellerTransFee
				+ ", sellerFinFee=" + sellerFinFee + ", createDate=" +createDate+", updateDate="+updateDate+" ]";
	}
	
	

}
