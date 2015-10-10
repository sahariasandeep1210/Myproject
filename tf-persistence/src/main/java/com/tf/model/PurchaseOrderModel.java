package com.tf.model;

import java.math.BigDecimal;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;


@Entity
@Table(name="tf_purchase_order")
public class PurchaseOrderModel {
	
	
	@Id
    @Column(name="purchase_order_id")
    @GeneratedValue
	private Long id;	
	
	@Column(name="seller_id")
	private Long sellerId;
	
	@Column(name="debtor_company")
	private Long debtorCompany;
	
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
	
	@Column(name="finance_amount")
	private BigDecimal financeAmount;
	
	@Column(name="shipping_date")
	private Date shippingDate;
	
	@Column(name="delivery_date")
	private Date deliveryDate;	
	
	//@Column(name="is_traded")
	@Column(name="is_traded",nullable = false, columnDefinition = "TINYINT", length = 1)
	private boolean isTraded; 
	
	@ManyToOne
	@JoinColumn(name="trade_id")
	private Trade trade;
	
	public PurchaseOrderModel() {
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Long getSellerId() {
		return sellerId;
	}

	public void setSellerId(Long sellerId) {
		this.sellerId = sellerId;
	}

	public Long getDebtorCompany() {
		return debtorCompany;
	}

	public void setDebtorCompany(Long debtorCompany) {
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

	public BigDecimal getFinanceAmount() {
		return financeAmount;
	}

	public void setFinanceAmount(BigDecimal financeAmount) {
		this.financeAmount = financeAmount;
	}

	public Date getShippingDate() {
		return shippingDate;
	}

	public void setShippingDate(Date shippingDate) {
		this.shippingDate = shippingDate;
	}

	public Date getDeliveryDate() {
		return deliveryDate;
	}

	public void setDeliveryDate(Date deliveryDate) {
		this.deliveryDate = deliveryDate;
	}

	public boolean getIsTraded() {
		return isTraded;
	}

	public void setIsTraded(boolean isTraded) {
		this.isTraded = isTraded;
	}

	public Trade getTrade() {
		return trade;
	}

	public void setTrade(Trade trade) {
		this.trade = trade;
	}

	@Override
	public String toString() {
		return "PurchaseOrderModel [id=" + id + ", sellerId=" + sellerId
				+ ", debtorCompany=" + debtorCompany + ", poNumber=" + poNumber
				+ ", poDate=" + poDate + ", poAmount=" + poAmount + ", poDays="
				+ poDays + ", poNotes=" + poNotes + ", financeAmount="
				+ financeAmount + ", shippingDate=" + shippingDate
				+ ", deliveryDate=" + deliveryDate + ", isTraded=" + isTraded
				+ "]";
	}
}
