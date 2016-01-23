package com.tf.model;

import java.io.Serializable;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;


@Entity
@Table(name="tf_user")
public class User implements Serializable {
	
	
	private static final long serialVersionUID = -6791071025519510534L;

	@Id
    @Column(name="iduser")
    @GeneratedValue
	private Long id;
	
    @Column(name="liferay_user_id")
	private Long liferayUserId;
    
	@Column(name="firstname")
	private String firstName;
	
	@Column(name="middlename")
	private String middleName;
	
	@Column(name="lastname")
	private String lastName;
	
	@Column(name="title")
	private String title;
	
	@Column(name="username")
	private String username;
	
	@Column(name="password")
	private String password;
	
	@Column(name="type")
	private String type;
	
	//@Column(name="active")
	@Column(name="active",nullable = false, columnDefinition = "TINYINT", length = 1)
	private boolean active;	
	
	@Column(name="email")
	private String email;
	
	@Column(name="telwork")
	private String telWork;
	
	@Column(name="telmobile")
	private String mobile;
	
	@Column(name="level")
	private String level;
	
	@Column(name="diremail")
	private String dirEmail;
	
	@Column(name="dirname")
	private String dirName;
	
	@Column(name="tcagree")
	private String tcAgree;
	
	@Column(name="dirconfirm")
	private String dirConfirm;
	
	@Column(name="checksagree")
	private String checksAgree;
	

	
	@Column(name="memtype")
	private String memtype;
	
	@Column(name="updateflag")
	private Integer updateFlag; 
	
	//@Column(name="active_status")
	@Column(name="active_status",nullable = false, columnDefinition = "TINYINT", length = 1)
	private boolean activeStatus; 
	
	@Column(name="companydirector")
	private String companyDirector;
	
	
	@ManyToOne(cascade=CascadeType.ALL)	
	@JoinColumn(name = "company_id")  
	private Company company;
	
	public User() {
	}


	public Long getId() {
		return id;
	}


	public void setId(Long id) {
		this.id = id;
	}


	public Long getLiferayUserId() {
		return liferayUserId;
	}


	public void setLiferayUserId(Long liferayUserId) {
		this.liferayUserId = liferayUserId;
	}


	public String getFirstName() {
		return firstName;
	}


	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}


	public String getMiddleName() {
		return middleName;
	}


	public void setMiddleName(String middleName) {
		this.middleName = middleName;
	}


	public String getLastName() {
		return lastName;
	}


	public void setLastName(String lastName) {
		this.lastName = lastName;
	}


	public String getTitle() {
		return title;
	}


	public void setTitle(String title) {
		this.title = title;
	}


	public String getUsername() {
		return username;
	}


	public void setUsername(String username) {
		this.username = username;
	}


	public String getPassword() {
		return password;
	}


	public void setPassword(String password) {
		this.password = password;
	}


	public String getType() {
		return type;
	}


	public void setType(String type) {
		this.type = type;
	}


	public boolean getActive() {
		return active;
	}


	public void setActive(boolean active) {
		this.active = active;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public String getTelWork() {
		return telWork;
	}


	public void setTelWork(String telWork) {
		this.telWork = telWork;
	}


	public String getMobile() {
		return mobile;
	}


	public void setMobile(String mobile) {
		this.mobile = mobile;
	}


	public String getLevel() {
		return level;
	}


	public void setLevel(String level) {
		this.level = level;
	}


	public String getDirEmail() {
		return dirEmail;
	}


	public void setDirEmail(String dirEmail) {
		this.dirEmail = dirEmail;
	}


	public String getDirName() {
		return dirName;
	}


	public void setDirName(String dirName) {
		this.dirName = dirName;
	}


	public String getTcAgree() {
		return tcAgree;
	}


	public void setTcAgree(String tcAgree) {
		this.tcAgree = tcAgree;
	}


	public String getDirConfirm() {
		return dirConfirm;
	}


	public void setDirConfirm(String dirConfirm) {
		this.dirConfirm = dirConfirm;
	}


	public String getChecksAgree() {
		return checksAgree;
	}


	public void setChecksAgree(String checksAgree) {
		this.checksAgree = checksAgree;
	}

	public String getMemtype() {
		return memtype;
	}


	public void setMemtype(String memtype) {
		this.memtype = memtype;
	}


	public Integer getUpdateFlag() {
		return updateFlag;
	}


	public void setUpdateFlag(Integer updateFlag) {
		this.updateFlag = updateFlag;
	}


	public boolean getActiveStatus() {
		return activeStatus;
	}


	public void setActiveStatus(boolean activeStatus) {
		this.activeStatus = activeStatus;
	}


	public String getCompanyDirector() {
		return companyDirector;
	}


	public void setCompanyDirector(String companyDirector) {
		this.companyDirector = companyDirector;
	}


	public Company getCompany() {
		return company;
	}


	public void setCompany(Company company) {
		this.company = company;
	}


	@Override
	public String toString() {
		return "User [id=" + id + ", liferayUserId=" + liferayUserId
				+ ", firstName=" + firstName + ", middleName=" + middleName
				+ ", lastName=" + lastName + ", title=" + title + ", username="
				+ username + ", password=" + password + ", type=" + type
				+ ", active=" + active + ", email=" + email + ", telWork="
				+ telWork + ", mobile=" + mobile + ", level=" + level
				+ ", dirEmail=" + dirEmail + ", dirName=" + dirName
				+ ", tcAgree=" + tcAgree + ", dirConfirm=" + dirConfirm
				+ ", checksAgree=" + checksAgree 
				+ ", memtype=" + memtype + ", updateFlag=" + updateFlag
				+ ", activeStatus=" + activeStatus + ", companyDirector="
				+ companyDirector + ", company=" + company + "]";
	}
	

}
