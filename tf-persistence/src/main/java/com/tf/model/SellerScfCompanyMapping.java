package com.tf.model;

import java.io.Serializable;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name="tf_seller_scfcompany_mapping")
public class SellerScfCompanyMapping implements Serializable {
	

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
    @Column(name="id")
    @GeneratedValue
	private Long id;	
	
	@Column(name = "scf_company")  
	private Long scfCompany;
	
	@OneToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "seller_company")  
	private Company sellerCompany;
	
	public SellerScfCompanyMapping() {
		
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}
	public Long getScfCompany() {
		return scfCompany;
	}

	public void setScfCompany(Long scfCompany) {
		this.scfCompany = scfCompany;
	}
	
	public Company getSellerCompany() {
		return sellerCompany;
	}

	public void setSellerCompany(Company sellerCompany) {
		this.sellerCompany = sellerCompany;
	}
	
}
