package com.tf.util;

import java.io.Serializable;

import com.tf.model.Company;
import com.tf.model.User;

public class Registration implements Serializable {
	
	
	private static final long serialVersionUID = -4485521649505250453L;
	
	private User user;
	private Company company;
	
	public Registration() {
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Company getCompany() {
		return company;
	}

	public void setCompany(Company company) {
		this.company = company;
	}

	@Override
	public String toString() {
		return "Registration [user=" + user + ", company=" + company + "]";
	}
	
	

}
