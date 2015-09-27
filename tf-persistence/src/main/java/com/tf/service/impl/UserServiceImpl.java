package com.tf.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tf.dao.UserDAO;
import com.tf.model.User;
import com.tf.service.UserService;


@Service
public class UserServiceImpl implements UserService {
	
	@Autowired
	private UserDAO userDAO;

	public void addorUpdateUser(User user) {
		userDAO.addorUpdateUser(user);		
	}

	public List<User> findUserByCompanyId(long id) {
		// TODO Auto-generated method stub
		return userDAO.findUserByCompanyId(id);
	}
	
	public User findById(long id){
		return userDAO.findById(id);
	}
	public long  getCompanyIDbyUserID(long id){
		return userDAO.getCompanyIDbyUserID(id);
	}

}
