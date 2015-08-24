package com.tf.model;

import java.math.BigDecimal;
import java.util.Date;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.Table;


@Entity
@Table(name="tf_trade")
public class Trade {
	
	
	@Id
    @Column(name="trade_id")
    @GeneratedValue
	private Long id;
	
	@Column(name="duration")
	private BigDecimal duration;
	
	@Column(name="closing_date")
	private Date closingDate;	
	
	@Column(name="closing_date")
	private Date openingDate;
	
	@Column(name="trade_amount")
	private BigDecimal tradAmount;
	
	@Column(name="status")
	private Integer status;
	
	@Column(name="invoive_company_id")
	private Long invoiveCompanyId;
	
	@Column(name="seller_company_id")
	private Long sellerCompanyId;
	
	@Column(name="trade_days")
	private Long tradeDays;
	
	@Column(name="trade_description")
	private String tradeDescription;
	
	@Column(name="repayment_date")
	private Date repaymentDate;
	
	@Column(name="trade_settled")
	private Integer tradeSettled;	
	
	@Column(name="is_secondary_allotment")
	private Integer isSecAllotment;
	
	@Column(name="total_value")
	private BigDecimal totalValue;
	
	@OneToMany(cascade=CascadeType.ALL)
    @JoinColumn(name="trade_id")
	private Set<PurchaseOrderModel> poModels;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public BigDecimal getDuration() {
		return duration;
	}

	public void setDuration(BigDecimal duration) {
		this.duration = duration;
	}

	public Date getClosingDate() {
		return closingDate;
	}

	public void setClosingDate(Date closingDate) {
		this.closingDate = closingDate;
	}

	public Date getOpeningDate() {
		return openingDate;
	}

	public void setOpeningDate(Date openingDate) {
		this.openingDate = openingDate;
	}

	public BigDecimal getTradAmount() {
		return tradAmount;
	}

	public void setTradAmount(BigDecimal tradAmount) {
		this.tradAmount = tradAmount;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public Long getInvoiveCompanyId() {
		return invoiveCompanyId;
	}

	public void setInvoiveCompanyId(Long invoiveCompanyId) {
		this.invoiveCompanyId = invoiveCompanyId;
	}

	public Long getSellerCompanyId() {
		return sellerCompanyId;
	}

	public void setSellerCompanyId(Long sellerCompanyId) {
		this.sellerCompanyId = sellerCompanyId;
	}

	public Long getTradeDays() {
		return tradeDays;
	}

	public void setTradeDays(Long tradeDays) {
		this.tradeDays = tradeDays;
	}

	public String getTradeDescription() {
		return tradeDescription;
	}

	public void setTradeDescription(String tradeDescription) {
		this.tradeDescription = tradeDescription;
	}

	public Date getRepaymentDate() {
		return repaymentDate;
	}

	public void setRepaymentDate(Date repaymentDate) {
		this.repaymentDate = repaymentDate;
	}

	public Integer getTradeSettled() {
		return tradeSettled;
	}

	public void setTradeSettled(Integer tradeSettled) {
		this.tradeSettled = tradeSettled;
	}

	public Integer getIsSecAllotment() {
		return isSecAllotment;
	}

	public void setIsSecAllotment(Integer isSecAllotment) {
		this.isSecAllotment = isSecAllotment;
	}

	public BigDecimal getTotalValue() {
		return totalValue;
	}

	public void setTotalValue(BigDecimal totalValue) {
		this.totalValue = totalValue;
	}

	public Set<PurchaseOrderModel> getPoModels() {
		return poModels;
	}

	public void setPoModels(Set<PurchaseOrderModel> poModels) {
		this.poModels = poModels;
	}

	@Override
	public String toString() {
		return "Trade [id=" + id + ", duration=" + duration + ", closingDate="
				+ closingDate + ", openingDate=" + openingDate
				+ ", tradAmount=" + tradAmount + ", status=" + status
				+ ", invoiveCompanyId=" + invoiveCompanyId
				+ ", sellerCompanyId=" + sellerCompanyId + ", tradeDays="
				+ tradeDays + ", tradeDescription=" + tradeDescription
				+ ", repaymentDate=" + repaymentDate + ", tradeSettled="
				+ tradeSettled + ", isSecAllotment=" + isSecAllotment
				+ ", totalValue=" + totalValue + ", poModels=" + poModels + "]";
	}
	

	
	
	

}
