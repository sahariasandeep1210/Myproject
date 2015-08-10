package com.tf.model;

import java.math.BigDecimal;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity
@Table(name="tf_purchase_order")
public class PurchaseOrderModel {
	
	
	@Id
    @Column(name="purchase_order_id")
    @GeneratedValue
	private Long id;	
	
	@Column(name="seller_id")
	private Integer sellerId;
	
	@Column(name="debtor_company")
	private Integer debtorCompany;
	
	@Column(name="po_number")
	private String poNumber;
	
	@Column(name="po_date")
	private Date poDate;
	
	@Column(name="po_amount")
	private BigDecimal poAmount;
	
	@Column(name="po_days")
	private Integer poDays;
	
	@Column(name="po_notes")
	private String poNotes;
	
	public PurchaseOrderModel() {
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Integer getSellerId() {
		return sellerId;
	}

	public void setSellerId(Integer sellerId) {
		this.sellerId = sellerId;
	}

	public Integer getDebtorCompany() {
		return debtorCompany;
	}

	public void setDebtorCompany(Integer debtorCompany) {
		this.debtorCompany = debtorCompany;
	}

	public String getPoNumber() {
		return poNumber;
	}

	public void setPoNumber(String poNumber) {
		this.poNumber = poNumber;
	}

	public Date getPoDate() {
		return poDate;
	}

	public void setPoDate(Date poDate) {
		this.poDate = poDate;
	}

	public BigDecimal getPoAmount() {
		return poAmount;
	}

	public void setPoAmount(BigDecimal poAmount) {
		this.poAmount = poAmount;
	}

	public Integer getPoDays() {
		return poDays;
	}

	public void setPoDays(Integer poDays) {
		this.poDays = poDays;
	}

	public String getPoNotes() {
		return poNotes;
	}

	public void setPoNotes(String poNotes) {
		this.poNotes = poNotes;
	}

	@Override
	public String toString() {
		return "PurchaseOrderModel [id=" + id + ", sellerId=" + sellerId
				+ ", debtorCompany=" + debtorCompany + ", poNumber=" + poNumber
				+ ", poDate=" + poDate + ", poAmount=" + poAmount + ", poDays="
				+ poDays + ", poNotes=" + poNotes + "]";
	}
	

}
