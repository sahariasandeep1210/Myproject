package com.tf.util;

import com.tf.model.Company;
import com.tf.model.User;

public class Registration {
	
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

}
