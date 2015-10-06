package com.tf.model;

import java.io.Serializable;
import java.util.Date;

public class OfficerModel  implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	
	private String name;
	private String officer_role;
	private Date appointed_on;
	private AddressModel address;
	private Date resigned_on;
	private String country_of_residence;
	private String nationality;
	private String occupation;
	
	public OfficerModel() {
		// TODO Auto-generated constructor stub
	}
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getOfficer_role() {
		return officer_role;
	}
	public void setOfficer_role(String officer_role) {
		this.officer_role = officer_role;
	}
	public Date getAppointed_on() {
		return appointed_on;
	}
	public void setAppointed_on(Date appointed_on) {
		this.appointed_on = appointed_on;
	}
	public AddressModel getAddress() {
		return address;
	}
	public void setAddress(AddressModel address) {
		this.address = address;
	}
	public Date getResigned_on() {
		return resigned_on;
	}
	public void setResigned_on(Date resigned_on) {
		this.resigned_on = resigned_on;
	}
	public String getCountry_of_residence() {
		return country_of_residence;
	}
	public void setCountry_of_residence(String country_of_residence) {
		this.country_of_residence = country_of_residence;
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

	@Override
	public String toString() {
		return "OfficerModel [name=" + name + ", officer_role=" + officer_role
				+ ", appointed_on=" + appointed_on + ", address=" + address
				+ ", resigned_on=" + resigned_on + ", country_of_residence="
				+ country_of_residence + ", nationality=" + nationality
				+ ", occupation=" + occupation + "]";
	}

}
