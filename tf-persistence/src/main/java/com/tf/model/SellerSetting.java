package com.tf.model;

import java.io.Serializable;
import java.math.BigDecimal;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity
@Table(name="tf_seller_setting")
public class SellerSetting implements Serializable {
	
	
	private static final long serialVersionUID = -6732516576165099239L;
	

	@Id
    @Column(name="id")
    @GeneratedValue
	private Long id;
	
	@Column(name="seller_transaction_fee")
	private BigDecimal 	sellerTransFee;
	
	@Column(name="seller_finance_fee")
	private BigDecimal 	sellerFinFee;
	
	public SellerSetting() {
		
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
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

	@Override
	public String toString() {
		return "SellerSetting [id=" + id + ", sellerTransFee=" + sellerTransFee
				+ ", sellerFinFee=" + sellerFinFee + "]";
	}
	
	

}
