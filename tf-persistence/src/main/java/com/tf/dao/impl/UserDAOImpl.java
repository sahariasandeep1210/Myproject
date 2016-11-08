package com.tf.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.tf.dao.UserDAO;
import com.tf.model.Company;
import com.tf.model.User;


@Repository
@Transactional
public class UserDAOImpl extends BaseDAOImpl<User, Long>  implements UserDAO{
	
	public UserDAOImpl() {
		super(User.class);
	}

	
	
	public Long addorUpdateUser(User user) {
		try {
			if(user.getId()==null){
				sessionFactory.getCurrentSession().save(user);			
			}else{
				sessionFactory.getCurrentSession().saveOrUpdate(user);
			}
				
			
			_log.debug("persist successful"+user);
			return user.getId();
		} catch (RuntimeException re) {
			_log.error("persist failed", re);			
			return user.getId();
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
	
	public Object[] getUserTypeAndLifearyID(long id) {
		_log.debug("getting User instance with id: " + id);
		try {
			Query query =sessionFactory.getCurrentSession().createQuery("SELECT type, liferayUserId  FROM User where id = :id").setLong("id",id);
			Object[] array = (Object[]) query.list().get(0);
			
			if (array == null) {
				_log.debug("get successful, no instance found");
			} else {
				_log.debug("get successful, instance found");
			}
			return array;
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
			re.printStackTrace();
			_log.error("get failed", re);
			throw re;
		}
	}
	
	public String findUserOjectByCompanyId(long id) {
		_log.debug("getting User instance with id: " + id);
		try {	
			String email = (String) sessionFactory.getCurrentSession().createQuery("select email from User where company.id = :companyID").setLong("companyID",id).uniqueResult();
			if (email.equals("")) {
				_log.debug("get successful, no instance found");
			} else {
				_log.debug("get successful, email instance found - "+email);
			}
			return email;
		} catch (RuntimeException re) {
			re.printStackTrace();
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
	
	public Company  getCompanybyUserID(long id) {
		_log.debug("getting User instance with id: " + id);
		Company company=null;
		try {
			if(id!=0){
				
				company = (Company) sessionFactory.getCurrentSession().createQuery("select user.company from User user where user.liferayUserId = :id").setLong("id",id).uniqueResult();
				if (company == null) {
					_log.debug("get successful, no instance found");
				} else {
					_log.debug("get successful, instance found");
				}
			}
			return company;
		} catch (RuntimeException re) {
			_log.error("get failed", re);
			throw re;
		}
	}
	
	public long  getUserbyLiferayUserID(long id) {
		_log.debug("getting User instance with id: " + id);
		Long userId=null;
		try {
			if(id!=0){
				
				userId = (Long) sessionFactory.getCurrentSession().createQuery("select user.id from User user where user.liferayUserId = :id").setLong("id",id).uniqueResult();
				if (userId == null) {
					_log.debug("get successful, no instance found");
				} else {
					_log.debug("get successful, instance found");
				}
			}
			return userId;
		} catch (RuntimeException re) {
			_log.error("get failed", re);
			throw re;
		}
	}
	
	
	public Long findUserByEmail(String emailID) {
		_log.debug("getting User instance with email: " + emailID);
		try {	
			Long liferayUserID = (Long) sessionFactory.getCurrentSession().createQuery("select liferayUserId from User where email = :email").setString("email",emailID).uniqueResult();
			
			return liferayUserID;
		} catch (RuntimeException re) {
			re.printStackTrace();
			_log.error("get failed", re);
			throw re;
		}
	}
	
	public User  getUserbyLiferayID(long id) {
		_log.debug("getting User instance with id: " + id);
		User user=null;
		try {
			if(id!=0){
				
			    user = (User) sessionFactory.getCurrentSession().createQuery("from User user where user.liferayUserId = :id").setLong("id",id).uniqueResult();
				if (user == null) {
					_log.debug("get successful, no instance found");
				} else {
					_log.debug("get successful, instance found");
				}
			}
			return user;
		} catch (RuntimeException re) {
			_log.error("get failed", re);
			throw re;
		}
	}

}
