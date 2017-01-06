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
@Table(name="tf_company_account_details")
public class CompanyAccountDetail implements Serializable{
	
	private static final long serialVersionUID = -8395381046055559661L;

	@Id
    @Column(name="id")
    @GeneratedValue
	private Long id;
	
	@OneToOne(cascade=CascadeType.ALL)
	@JoinColumn(name = "idcompany")  
	private Company company;
	
	@Column(name="account_holder_name")
	private String accountName;
	
	@Column(name="sort_code")
	private String sortCode;
	
	@Column(name="account_no")
	private String accountNumber;
	
	@Column(name="IBAN")
	private String iban;
	
	@Column(name="bank_name")
	private String bankName;
	
	public CompanyAccountDetail() {
	}
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getAccountName() {
		return accountName;
	}
	public void setAccountName(String accountName) {
		this.accountName = accountName;
	}
	
	public String getSortCode() {
		return sortCode;
	}
	public void setSortCode(String sortCode) {
		this.sortCode = sortCode;
	}
	public String getAccountNumber() {
		return accountNumber;
	}
	public void setAccountNumber(String accountNumber) {
		this.accountNumber = accountNumber;
	}
	public String getIban() {
		return iban;
	}
	public void setIban(String iban) {
		this.iban = iban;
	}
	
	public String getBankName() {
		return bankName;
	}
	public void setBankName(String bankName) {
		this.bankName = bankName;
	}
	
	public Company getCompany() {
		return company;
	}


	public void setCompany(Company company) {
		this.company = company;
	}
	
}
