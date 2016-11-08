package com.tf.services.dto;

import java.io.Serializable;

public class SellerDetails implements Serializable {
  
    

    private static final long serialVersionUID = 7167811278842258089L;
    
    
    private Long 	supplierID;
    private Long 	supplierCompanyID;
    private String	supplierCompanyName;
    private String 	scfCompanyName;
    private String 	phoneNo;
    private String 	email;
    private Address 	address;
  
    
    
    public SellerDetails() {
	
    }



    public Long getSupplierID() {
        return supplierID;
    }



    public void setSupplierID(Long supplierID) {
        this.supplierID = supplierID;
    }



    public Long getSupplierCompanyID() {
        return supplierCompanyID;
    }



    public void setSupplierCompanyID(Long supplierCompanyID) {
        this.supplierCompanyID = supplierCompanyID;
    }



    public String getSupplierCompanyName() {
        return supplierCompanyName;
    }



    public void setSupplierCompanyName(String supplierCompanyName) {
        this.supplierCompanyName = supplierCompanyName;
    }



    public String getScfCompanyName() {
        return scfCompanyName;
    }



    public void setScfCompanyName(String scfCompanyName) {
        this.scfCompanyName = scfCompanyName;
    }



    public String getPhoneNo() {
        return phoneNo;
    }



    public void setPhoneNo(String phoneNo) {
        this.phoneNo = phoneNo;
    }



    public String getEmail() {
        return email;
    }



    public void setEmail(String email) {
        this.email = email;
    }



    public Address getAddress() {
        return address;
    }



    public void setAddress(Address address) {
        this.address = address;
    }



    @Override
    public String toString() {
	return "SellerDetails [supplierID=" + supplierID
		+ ", supplierCompanyID=" + supplierCompanyID
		+ ", supplierCompanyName=" + supplierCompanyName
		+ ", scfCompanyName=" + scfCompanyName + ", phoneNo=" + phoneNo
		+ ", email=" + email + ", address=" + address + "]";
    }
    

    

}
