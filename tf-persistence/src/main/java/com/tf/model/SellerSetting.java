package com.tf.model;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;


@Entity
@Table(name="tf_seller_setting")
public class SellerSetting implements Serializable {
	
	
	private static final long serialVersionUID = -6732516576165099239L;
	

	@Id
    @Column(name="id")
    @GeneratedValue
	private Long id;
	
	@OneToOne
    @JoinColumn(name="company_id")
	private Company company;
	
	@Column(name="seller_transaction_fee")
	private BigDecimal 	sellerTransFee;
	
	@Column(name="seller_finance_fee")
	private BigDecimal 	sellerFinFee;
	
	@Column(name="create_date")
	private Date createDate;
	
	@Column(name="update_date")
	private Date updateDate;
	
	public SellerSetting() {
		
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Company getCompany() {
		return company;
	}

	public void setCompany(Company company) {
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


	@Override
	public String toString() {
		return "SellerSetting [id=" + id + ", sellerTransFee=" + sellerTransFee
				+ ", sellerFinFee=" + sellerFinFee + ", createDate=" +createDate+", updateDate="+updateDate+" ]";
	}
	
	

}
