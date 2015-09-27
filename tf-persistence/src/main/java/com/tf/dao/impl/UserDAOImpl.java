package com.tf.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.tf.dao.UserDAO;
import com.tf.model.User;


@Repository
@Transactional
public class UserDAOImpl extends BaseDAOImpl<User, Long>  implements UserDAO{
	
	
	public void addorUpdateUser(User user) {
		try {
			sessionFactory.getCurrentSession().saveOrUpdate(user);
			_log.debug("persist successful"+user);
		} catch (RuntimeException re) {
			_log.error("persist failed", re);
			throw re;
		}
	}
	
	public User findById(long id) {
		_log.debug("getting User instance with id: " + id);
		try {
			User instance = (User) sessionFactory.getCurrentSession().get(
					"com.tf.model.User", id);
			if (instance == null) {
				_log.debug("get successful, no instance found");
			} else {
				_log.debug("get successful, instance found");
			}
			return instance;
		} catch (RuntimeException re) {
			_log.error("get failed", re);
			throw re;
		}
	}
	
	@SuppressWarnings("unchecked")
	public List<User> findUserByCompanyId(long id) {
		_log.debug("getting User instance with id: " + id);
		try {
			Query query = sessionFactory.getCurrentSession().createQuery("from User where company.id = :companyID ");
			query.setParameter("companyID", id);
			
			List<User> list = query.list();
			if (list == null) {
				_log.debug("get successful, no instance found");
			} else {
				_log.debug("get successful, instance found");
			}
			return list;
		} catch (RuntimeException re) {
			_log.error("get failed", re);
			throw re;
		}
	}
	
	public long  getCompanyIDbyUserID(long id) {
		_log.debug("getting User instance with id: " + id);
		Long companyId=null;
		try {
			if(id!=0){
				
				companyId = (Long) sessionFactory.getCurrentSession().createQuery("select user.company.id from User user where user.liferayUserId = :id").setLong("id",id).uniqueResult();
				if (companyId == null) {
					_log.debug("get successful, no instance found");
				} else {
					_log.debug("get successful, instance found");
				}
			}
			return companyId;
		} catch (RuntimeException re) {
			_log.error("get failed", re);
			throw re;
		}
	}

}
