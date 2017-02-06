package com.tf.util.model;

import java.io.Serializable;

public class ContactModel  implements Serializable{
  
    private static final long serialVersionUID = -8083535049443416450L;
    
    
    
    private String firstName;
    private String lastName;
    private String companyName;
    private String jobtitle;
    private String contactNo;
    private String emailAddress;
    private String message;
    
    
    public ContactModel() {
	
    }


    public String getFirstName() {
        return firstName;
    }


    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }


    public String getLastName() {
        return lastName;
    }


    public void setLastName(String lastName) {
        this.lastName = lastName;
    }


    public String getCompanyName() {
        return companyName;
    }


    public void setCompanyName(String companyName) {
        this.companyName = companyName;
    }


    public String getJobtitle() {
        return jobtitle;
    }


    public void setJobtitle(String jobtitle) {
        this.jobtitle = jobtitle;
    }


    public String getContactNo() {
        return contactNo;
    }


    public void setContactNo(String contactNo) {
        this.contactNo = contactNo;
    }


    public String getEmailAddress() {
        return emailAddress;
    }


    public void setEmailAddress(String emailAddress) {
        this.emailAddress = emailAddress;
    }


    public String getMessage() {
        return message;
    }


    public void setMessage(String message) {
        this.message = message;
    }
    
    

}
