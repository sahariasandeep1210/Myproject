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
@Table(name="tf_trade_audit")
public class TradeAudit implements Serializable {
	
	
	private static final long serialVersionUID = -267910917078739863L;

	@Id
    @Column(name="id")
    @GeneratedValue
	private Long id;	

	@Column(name="trade_id")
	private Long tradeID;	
	
	@Column(name="user_id") 
	private Long userID;	
	
	
	@Column(name="seller_finance_fee") 
	private BigDecimal sellerFinFee;
	
	@Column(name="seller_transaction_fee") 
	private BigDecimal sellerTransFee;
	
	@Column(name="comment") 
	private String comment;
	
	@Column(name="create_date") 
	private Date createDate;
	
	@Column(name="update_date") 
	private Date updateDate;
	
	public TradeAudit() {
		
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Long getTradeID() {
		return tradeID;
	}

	public void setTradeID(Long tradeID) {
		this.tradeID = tradeID;
	}

	public Long getUserID() {
		return userID;
	}

	public void setUserID(Long userID) {
		this.userID = userID;
	}

	
	public BigDecimal getSellerFinFee() {
		return sellerFinFee;
	}

	public void setSellerFinFee(BigDecimal sellerFinFee) {
		this.sellerFinFee = sellerFinFee;
	}

	public BigDecimal getSellerTransFee() {
		return sellerTransFee;
	}

	public void setSellerTransFee(BigDecimal sellerTransFee) {
		this.sellerTransFee = sellerTransFee;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
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
	 
	 
}
