package com.tf.service;

import java.util.List;

import com.tf.model.Company;
import com.tf.model.User;

public interface UserService {
	
	public  Long addorUpdateUser(User user);
	
	public List<User> findUserByCompanyId(long id);
	
	public String findUserOjectByCompanyId(long id);
	
	public User findById(long id);
	
	public long  getCompanyIDbyUserID(long id);
	
	public long  getUserbyLiferayUserID(long id);
	
	public Company  getCompanybyUserID(long id);
	
	public Object[] getUserTypeAndLifearyID(long id) ;
	
	public User  getUserbyLiferayID(long id);
	public void deleteUser(long UserId);

}
