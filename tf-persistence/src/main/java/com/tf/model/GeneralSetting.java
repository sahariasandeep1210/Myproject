package com.tf.model;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity
@Table(name="tf_general_setting")
public class GeneralSetting implements Serializable{

	
	
	private static final long serialVersionUID = -4882194498276311975L;

	@Id
    @Column(name="id")
    @GeneratedValue
	private Long id;
	
	@Column(name="whitehall_share")
	private BigDecimal 	whitehalShare;
	
	@Column(name="vat")
	private BigDecimal 	vat;
	
	@Column(name="seller_transaction_fee")
	private BigDecimal 	sellerTransFee;
	
	@Column(name="seller_finance_fee")
	private BigDecimal 	sellerFinFee;
	
	@Column(name="create_date")
	private Date createDate;
	
	@Column(name="update_date")
	private Date updateDate;
	
	@Column(name="min_payment_date_duartion")
	private Integer MinPaymentDateDuartion;
	
	@Column(name="min_level_of_investment")
	private Integer MinLevelOfInvestment;
	
	
	public Integer getMinLevelOfInvestment() {
		return MinLevelOfInvestment;
	}



	public void setMinLevelOfInvestment(Integer minLevelOfInvestment) {
		MinLevelOfInvestment = minLevelOfInvestment;
	}



	public GeneralSetting() {
		
	}



	public Long getId() {
		return id;
	}



	public void setId(Long id) {
		this.id = id;
	}



	public BigDecimal getWhitehalShare() {
		return whitehalShare;
	}



	public void setWhitehalShare(BigDecimal whitehalShare) {
		this.whitehalShare = whitehalShare;
	}



	public BigDecimal getVat() {
		return vat;
	}



	public void setVat(BigDecimal vat) {
		this.vat = vat;
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



	public Integer getMinPaymentDateDuartion() {
		return MinPaymentDateDuartion;
	}



	public void setMinPaymentDateDuartion(Integer minPaymentDateDuartion) {
		MinPaymentDateDuartion = minPaymentDateDuartion;
	}
	
	
}
