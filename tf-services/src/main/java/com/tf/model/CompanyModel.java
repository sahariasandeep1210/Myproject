package com.tf.model;

import java.io.Serializable;
import java.util.Date;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

/**
 * This model will hold company information fetched from https://api.companieshouse.gov.uk/
 * 
 * You can observer there are some fields which holds same kind of information for instance company_type and type.
 * This is because  first and second url have different name in response
 * 
 * URLs
 *  1. https://api.companieshouse.gov.uk/company/{company_number}
 *  2. https://api.companieshouse.gov.uk/search/companies?q=<Required.The term being searched for>&items_per_page=<Number of search results to return per page.>
 *      &start_index=<The index of the first result item to return.>
 * 
 * @author Gautam Sharma
 *
 */
@JsonIgnoreProperties(ignoreUnknown = true)
public class CompanyModel implements Serializable {



	private static final long serialVersionUID = 1L;
	
	private String description;
	private String company_status;
	private AddressModel address;
	private AddressModel registered_office_address;
	private Date date_of_creation;
	private Date next_made_up_to;
	private Date next_due;
	private boolean overdue;
	private boolean has_insolvency_history;
	private String snippet;
	private String title;
	private String company_name;
	private String company_type;
	private String type;
	private String kind;
	private String company_number;
	private String jurisdiction;
	
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

	public AddressModel getAddress() {
		return address;
	}

	public void setAddress(AddressModel address) {
		this.address = address;
	}

	public AddressModel getRegistered_office_address() {
		return registered_office_address;
	}

	public void setRegistered_office_address(AddressModel registered_office_address) {
		this.registered_office_address = registered_office_address;
	}

	public Date getDate_of_creation() {
		return date_of_creation;
	}

	public void setDate_of_creation(Date date_of_creation) {
		this.date_of_creation = date_of_creation;
	}

	public Date getNext_made_up_to() {
		return next_made_up_to;
	}

	public void setNext_made_up_to(Date next_made_up_to) {
		this.next_made_up_to = next_made_up_to;
	}

	public Date getNext_due() {
		return next_due;
	}

	public void setNext_due(Date next_due) {
		this.next_due = next_due;
	}

	public boolean isOverdue() {
		return overdue;
	}

	public void setOverdue(boolean overdue) {
		this.overdue = overdue;
	}

	public boolean isHas_insolvency_history() {
		return has_insolvency_history;
	}

	public void setHas_insolvency_history(boolean has_insolvency_history) {
		this.has_insolvency_history = has_insolvency_history;
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

	public String getCompany_name() {
		return company_name;
	}

	public void setCompany_name(String company_name) {
		this.company_name = company_name;
	}

	public String getCompany_type() {
		return company_type;
	}

	public void setCompany_type(String company_type) {
		this.company_type = company_type;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
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

	public String getJurisdiction() {
		return jurisdiction;
	}

	public void setJurisdiction(String jurisdiction) {
		this.jurisdiction = jurisdiction;
	}

	@Override
	public String toString() {
		return "CompanyModel [description=" + description + ", company_status="
				+ company_status + ", address=" + address
				+ ", registered_office_address=" + registered_office_address
				+ ", date_of_creation=" + date_of_creation
				+ ", next_made_up_to=" + next_made_up_to + ", next_due="
				+ next_due + ", overdue=" + overdue
				+ ", has_insolvency_history=" + has_insolvency_history
				+ ", snippet=" + snippet + ", title=" + title
				+ ", company_name=" + company_name + ", company_type="
				+ company_type + ", type=" + type + ", kind=" + kind
				+ ", company_number=" + company_number + ", jurisdiction="
				+ jurisdiction + "]";
	}	
	
	
}
