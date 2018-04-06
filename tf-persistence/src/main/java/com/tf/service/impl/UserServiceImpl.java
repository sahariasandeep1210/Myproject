package com.tf.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tf.dao.UserDAO;
import com.tf.model.Company;
import com.tf.model.User;
import com.tf.service.UserService;


@Service
public class UserServiceImpl implements UserService {
	
	@Autowired
	private UserDAO userDAO;

	public  Long addorUpdateUser(User user) {
		return userDAO.addorUpdateUser(user);		
	}

	public List<User> findUserByCompanyId(long id) {
		// TODO Auto-generated method stub
		return userDAO.findUserByCompanyId(id);
	}
	
	public String findUserOjectByCompanyId(long id) {
		// TODO Auto-generated method stub
		return userDAO.findUserOjectByCompanyId(id);
	}
	
	public User findById(long id){
		return userDAO.findById(id);
	}
	public long  getCompanyIDbyUserID(long id){
		return userDAO.getCompanyIDbyUserID(id);
	}
	
	public long  getUserbyLiferayUserID(long id){
		return userDAO.getUserbyLiferayUserID(id);
	}

	public Company getCompanybyUserID(long id) {
		return userDAO.getCompanybyUserID(id);
	}
	
	public Object[] getUserTypeAndLifearyID(long id) {
		return userDAO.getUserTypeAndLifearyID(id);
	}
	
	public User  getUserbyLiferayID(long id){
	    return userDAO.getUserbyLiferayID(id);
	}

	public void deleteUser(long UserId) {
		// TODO Auto-generated method stub
		 userDAO.deleteUser(UserId);
	}
}
