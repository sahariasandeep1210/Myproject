package com.tf.model;

import java.io.Serializable;
import java.util.Date;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@JsonIgnoreProperties(ignoreUnknown = true)
public class CompanyModel implements Serializable {



	private static final long serialVersionUID = 1L;
	
	private String description;
	private String company_status;
	private AddressModel address;
	private Date date_of_creation;
	private String snippet;
	private String title;
	private String company_type;
	private String kind;
	private String company_number;
	
	public CompanyModel() {
		// TODO Auto-generated constructor stub
	}
	
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getCompany_status() {
		return company_status;
	}
	public void setCompany_status(String company_status) {
		this.company_status = company_status;
	}
	public Date getDate_of_creation() {
		return date_of_creation;
	}
	public void setDate_of_creation(Date date_of_creation) {
		this.date_of_creation = date_of_creation;
	}
	public String getSnippet() {
		return snippet;
	}
	public void setSnippet(String snippet) {
		this.snippet = snippet;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public AddressModel getAddress() {
		return address;
	}

	public void setAddress(AddressModel address) {
		this.address = address;
	}

	public String getCompany_type() {
		return company_type;
	}

	public void setCompany_type(String company_type) {
		this.company_type = company_type;
	}

	public String getKind() {
		return kind;
	}

	public void setKind(String kind) {
		this.kind = kind;
	}

	public String getCompany_number() {
		return company_number;
	}

	public void setCompany_number(String company_number) {
		this.company_number = company_number;
	}

	@Override
	public String toString() {
		return "CompanyModel [description=" + description + ", company_status="
				+ company_status + ", address=" + address
				+ ", date_of_creation=" + date_of_creation + ", snippet="
				+ snippet + ", title=" + title + ", company_type="
				+ company_type + ", kind=" + kind + ", company_number="
				+ company_number + "]";
	}
	
	
	
}
