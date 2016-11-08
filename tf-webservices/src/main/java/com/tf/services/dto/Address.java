package com.tf.services.dto;


import java.io.Serializable;



public class Address implements Serializable {	

    	private static final long serialVersionUID = 5574109613540162397L;


	private Long id;
	
	
	private String addressLine1;
	
	private String addressLine2;
	
	private String locality;	
	
	private String region;	
	
	private String country;
	
	private String postalCode;	
	
	public Address() {
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	

	public String getAddressLine1() {
		return addressLine1;
	}

	public void setAddressLine1(String addressLine1) {
		this.addressLine1 = addressLine1;
	}

	public String getAddressLine2() {
		return addressLine2;
	}

	public void setAddressLine2(String addressLine2) {
		this.addressLine2 = addressLine2;
	}

	public String getLocality() {
		return locality;
	}

	public void setLocality(String locality) {
		this.locality = locality;
	}

	public String getRegion() {
		return region;
	}

	public void setRegion(String region) {
		this.region = region;
	}

	public String getPostalCode() {
		return postalCode;
	}

	public void setPostalCode(String postalCode) {
		this.postalCode = postalCode;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	@Override
	public String toString() {
	    return "Address [id=" + id + ", addressLine1=" + addressLine1
		    + ", addressLine2=" + addressLine2 + ", locality="
		    + locality + ", region=" + region + ", country=" + country
		    + ", postalCode=" + postalCode + "]";
	}
	

}

