package com.tf.model;

import java.io.Serializable;

public class AddressModel implements Serializable{
	
	
	private static final long serialVersionUID = 1L;
	
	private String postal_code;
	private String address_line_1;
	private String address_line_2;
	private String region;
	private String locality;
	private String country;
	private String care_of;
	private String premises;
	
	public AddressModel() {
		// TODO Auto-generated constructor stub
	}

	public String getPostal_code() {
		return postal_code;
	}

	public void setPostal_code(String postal_code) {
		this.postal_code = postal_code;
	}

	public String getAddress_line_1() {
		return address_line_1;
	}

	public void setAddress_line_1(String address_line_1) {
		this.address_line_1 = address_line_1;
	}

	public String getAddress_line_2() {
		return address_line_2;
	}

	public void setAddress_line_2(String address_line_2) {
		this.address_line_2 = address_line_2;
	}

	public String getRegion() {
		return region;
	}

	public void setRegion(String region) {
		this.region = region;
	}

	public String getLocality() {
		return locality;
	}

	public void setLocality(String locality) {
		this.locality = locality;
	}

	public String getCare_of() {
		return care_of;
	}

	public void setCare_of(String care_of) {
		this.care_of = care_of;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public String getPremises() {
		return premises;
	}

	public void setPremises(String premises) {
		this.premises = premises;
	}

	@Override
	public String toString() {
		return "AddressModel [postal_code=" + postal_code + ", address_line_1="
				+ address_line_1 + ", address_line_2=" + address_line_2
				+ ", region=" + region + ", locality=" + locality
				+ ", country=" + country + ", care_of=" + care_of
				+ ", premises=" + premises + "]";
	}

}
