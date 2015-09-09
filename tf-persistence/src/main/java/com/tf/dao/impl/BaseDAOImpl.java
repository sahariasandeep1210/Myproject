package com.tf.dao.impl;

import java.io.Serializable;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.tf.dao.BaseDAO;


public class BaseDAOImpl<T, ID extends Serializable> implements BaseDAO<T, ID>  {
	
	protected static final Log _log = LogFactory.getLog(BaseDAOImpl.class);

	
	 @Autowired
	 public SessionFactory sessionFactory;
	 
	 private Class<T> persistentClass;  


	public T findById(Serializable id) {
		 T entity; 
		entity = (T) sessionFactory.getCurrentSession().load(getPersistentClass(), id); 
		return entity;  
	}
	
	public Class<T> getPersistentClass() {  
        return persistentClass;  
    }  


}
