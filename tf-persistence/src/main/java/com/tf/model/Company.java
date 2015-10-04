package com.tf.model;

import java.util.Date;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;



@Entity
@Table(name="tf_company")
public class Company {
	
	@Id
    @Column(name="idcompany")
    @GeneratedValue
	private Long id;	
	
	@Column(name="name")
	private String name;
	
	@Column(name="altname")
	private String altname;
	
	@Column(name="regnumber")
	private String regNumber;
	
	@Column(name="addtrading")
	private String addTrading;
	
	@Column(name="addregistered")
	private String addRegistered;
	
	@Column(name="dateestablished")
	private Date dateestablished;
	
	@Column(name="website")
	private String website;
	
	@Column(name="telnumber")
	private String telnumber;	
	
	@Column(name="directors")
	private String directors;
	
	@Column(name="shareholders")
	private String shareholders;
	
	@Column(name="customers")
	private String customers;
	
	@Column(name="accounts")
	private String accounts;
	
	@Column(name="jurisdiction")
	private String jurisdiction;	
	
	@Column(name="bustype")
	private String bustype;
	
	@Column(name="active_status")
	private String activestatus;
	
	@Column(name="company_reference")
	private String companyreference;
	
	@Column(name="OrganisationType")
	private String orgType;
	
	@Column(name="industryclassification")
	private String indClassification;
	
	@Column(name="sic_code")
	private Long sicCode; 
	
	@Column(name="company_type")
	private String companyType;	
	
	
	@OneToMany(mappedBy = "company",cascade=CascadeType.ALL)      
	private Set<User> users;
	
	@OneToOne(mappedBy = "company",cascade=CascadeType.ALL)    
	private Address address;
	
	public Company() {
		// TODO Auto-generated constructor stub
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAltname() {
		return altname;
	}

	public void setAltname(String altname) {
		this.altname = altname;
	}

	public String getRegNumber() {
		return regNumber;
	}

	public void setRegNumber(String regNumber) {
		this.regNumber = regNumber;
	}

	public String getAddTrading() {
		return addTrading;
	}

	public void setAddTrading(String addTrading) {
		this.addTrading = addTrading;
	}

	public String getAddRegistered() {
		return addRegistered;
	}

	public void setAddRegistered(String addRegistered) {
		this.addRegistered = addRegistered;
	}

	public Date getDateestablished() {
		return dateestablished;
	}

	public void setDateestablished(Date dateestablished) {
		this.dateestablished = dateestablished;
	}

	public String getWebsite() {
		return website;
	}

	public void setWebsite(String website) {
		this.website = website;
	}

	public String getTelnumber() {
		return telnumber;
	}

	public void setTelnumber(String telnumber) {
		this.telnumber = telnumber;
	}

	public String getDirectors() {
		return directors;
	}

	public void setDirectors(String directors) {
		this.directors = directors;
	}

	public String getShareholders() {
		return shareholders;
	}

	public void setShareholders(String shareholders) {
		this.shareholders = shareholders;
	}

	public String getCustomers() {
		return customers;
	}

	public void setCustomers(String customers) {
		this.customers = customers;
	}

	public String getAccounts() {
		return accounts;
	}

	public void setAccounts(String accounts) {
		this.accounts = accounts;
	}

	public String getJurisdiction() {
		return jurisdiction;
	}

	public void setJurisdiction(String jurisdiction) {
		this.jurisdiction = jurisdiction;
	}

	public String getBustype() {
		return bustype;
	}

	public void setBustype(String bustype) {
		this.bustype = bustype;
	}

	public String getActivestatus() {
		return activestatus;
	}

	public void setActivestatus(String activestatus) {
		this.activestatus = activestatus;
	}

	public String getCompanyreference() {
		return companyreference;
	}

	public void setCompanyreference(String companyreference) {
		this.companyreference = companyreference;
	}

	public String getOrgType() {
		return orgType;
	}

	public void setOrgType(String orgType) {
		this.orgType = orgType;
	}

	public String getIndClassification() {
		return indClassification;
	}

	public void setIndClassification(String indClassification) {
		this.indClassification = indClassification;
	}

	public Long getSicCode() {
		return sicCode;
	}

	public void setSicCode(Long sicCode) {
		this.sicCode = sicCode;
	}

	public String getCompanyType() {
		return companyType;
	}

	public void setCompanyType(String companyType) {
		this.companyType = companyType;
	}

	public Set<User> getUsers() {
		return users;
	}

	public void setUsers(Set<User> users) {
		this.users = users;
	}

	public Address getAddress() {
		return address;
	}

	public void setAddress(Address address) {
		this.address = address;
	}

	@Override
	public String toString() {
		return "Company [id=" + id + ", name=" + name + ", altname=" + altname
				+ ", regNumber=" + regNumber + ", addTrading=" + addTrading
				+ ", addRegistered=" + addRegistered + ", dateestablished="
				+ dateestablished + ", website=" + website + ", telnumber="
				+ telnumber + ", directors=" + directors + ", shareholders="
				+ shareholders + ", customers=" + customers + ", accounts="
				+ accounts + ", jurisdiction=" + jurisdiction + ", bustype="
				+ bustype + ", activestatus=" + activestatus
				+ ", companyreference=" + companyreference + ", orgType="
				+ orgType + ", indClassification=" + indClassification
				+ ", sicCode=" + sicCode + ", companyType=" + companyType
				+ "]";
	}


}
