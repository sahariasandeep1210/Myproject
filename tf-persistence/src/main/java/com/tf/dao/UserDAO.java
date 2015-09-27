package com.tf.dao;

import java.util.List;

import com.tf.model.User;

public interface UserDAO {
	
	public void addorUpdateUser(User user);
	
	public List<User> findUserByCompanyId(long id);
	
	public User findById(long id) ;
	
	public long  getCompanyIDbyUserID(long id);

}
