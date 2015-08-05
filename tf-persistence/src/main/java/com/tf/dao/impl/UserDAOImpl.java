package com.tf.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import com.tf.dao.UserDAO;
import com.tf.model.User;


@Repository
public class UserDAOImpl extends BaseDAO  implements UserDAO{
	
	
	public void addorUpdateUser(User user) {
		_log.debug("persisting Company instance");
		try {
			sessionFactory.getCurrentSession().saveOrUpdate(user);
			_log.debug("persist successful"+user);
		} catch (RuntimeException re) {
			_log.error("persist failed", re);
			throw re;
		}
	}
	
	@SuppressWarnings("unchecked")
	public List<User> findUserByCompanyId(long id) {
		_log.debug("getting User instance with id: " + id);
		try {
			Query query = sessionFactory.getCurrentSession().createQuery("from User where companyID = :companyID ");
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

}
