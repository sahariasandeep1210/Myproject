package com.tf.service;

import java.util.List;

import com.tf.model.User;

public interface UserService {
	
	public void addorUpdateUser(User user);
	
	public List<User> findUserByCompanyId(long id);

}
