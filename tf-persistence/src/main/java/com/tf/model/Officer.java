package com.tf.model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;


@Entity
@Table(name="tf_officer")
public class Officer implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;


	@Id
    @Column(name="officer_id")
    @GeneratedValue
	private Long id;	
	

	@ManyToOne(cascade=CascadeType.ALL)	
	@JoinColumn(name = "company_id")  
	private Company company;
	
	@Column(name="name")
	private String name;	
	
	@Column(name="officer_role")
	private String officerRole;
	
	@Column(name="appointed_on")
	private Date appointedDate;	
	
	@Column(name="resigned_on")
	private Date resignedDate;
	
	@Column(name="country_of_residence")
	private String residenceCountry;		
	
	@Column(name="nationality")
	private String nationality;	
	
	@Column(name="occupation")
	private String occupation;
	
	@Column(name="updated_on")
	private Date updatedon;
	
	@Column(name="iduser")
	private Long iduser;
	
	@OneToOne(mappedBy = "officer",cascade=CascadeType.ALL)    
	private OfficerAddress officerAddress;
	
	public Officer() {
		
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

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getOfficerRole() {
		return officerRole;
	}

	public void setOfficerRole(String officerRole) {
		this.officerRole = officerRole;
	}

	public Date getAppointedDate() {
		return appointedDate;
	}

	public void setAppointedDate(Date appointedDate) {
		this.appointedDate = appointedDate;
	}

	public Date getResignedDate() {
		return resignedDate;
	}

	public void setResignedDate(Date resignedDate) {
		this.resignedDate = resignedDate;
	}

	public String getResidenceCountry() {
		return residenceCountry;
	}

	public void setResidenceCountry(String residenceCountry) {
		this.residenceCountry = residenceCountry;
	}

	public String getNationality() {
		return nationality;
	}

	public void setNationality(String nationality) {
		this.nationality = nationality;
	}

	public String getOccupation() {
		return occupation;
	}

	public void setOccupation(String occupation) {
		this.occupation = occupation;
	}

	public Date getUpdatedon() {
		return updatedon;
	}

	public void setUpdatedon(Date updatedon) {
		this.updatedon = updatedon;
	}

	public Long getIduser() {
		return iduser;
	}

	public void setIduser(Long iduser) {
		this.iduser = iduser;
	}

	public OfficerAddress getOfficerAddress() {
		return officerAddress;
	}

	public void setOfficerAddress(OfficerAddress officerAddress) {
		this.officerAddress = officerAddress;
	}

	@Override
	public String toString() {
		return "Officer [id=" + id + ", company=" + company + ", name=" + name
				+ ", officerRole=" + officerRole + ", appointedDate="
				+ appointedDate + ", resignedDate=" + resignedDate
				+ ", residenceCountry=" + residenceCountry + ", nationality="
				+ nationality + ", occupation=" + occupation + "]";
	}	
	

}
