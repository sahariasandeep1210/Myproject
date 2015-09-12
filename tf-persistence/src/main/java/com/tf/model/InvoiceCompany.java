package com.tf.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity
@Table(name = "tf_invoice_company")
public class InvoiceCompany {
	
	@Id
	@Column(name = "id")
	@GeneratedValue
	private long id;
	
	@Column(name = "company_name")
	private String companyName;
	
	@Column(name = "description")
	private String description;
	

	
	public InvoiceCompany() {
		// TODO Auto-generated constructor stub
	}

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getCompanyName() {
		return companyName;
	}

	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	@Override
	public String toString() {
		return "InvoiceCompany [id=" + id + ", companyName=" + companyName
				+ ", description=" + description + "]";
	}


}
