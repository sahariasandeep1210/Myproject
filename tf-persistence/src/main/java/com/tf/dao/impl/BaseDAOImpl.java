package com.tf.dao.impl;

import java.io.Serializable;
import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;

import org.apache.log4j.Logger;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.tf.dao.BaseDAO;


@Repository
@Transactional
public abstract  class BaseDAOImpl<T, ID extends Serializable> implements BaseDAO<T, ID>  {
	
	protected static final Logger _log = Logger.getLogger(BaseDAOImpl.class);

	
	 @Autowired
	 public SessionFactory sessionFactory;
	 
	 private Class<T> persistentClass;  
	 
	
	 
	 public BaseDAOImpl(Class<T> persistentClass) {
	        this.persistentClass = persistentClass;
	  }

	 
	 public BaseDAOImpl() {
	        Type t = getClass().getGenericSuperclass();
	        ParameterizedType pt = (ParameterizedType) t;
	        persistentClass = (Class) pt.getActualTypeArguments()[0];
	    }


	 public T findById(Serializable id) {
		 T entity; 
		entity = (T) sessionFactory.getCurrentSession().get(getPersistentClass(), id); 
		return entity;  
	}
	
	
	public T loadById(Serializable id) {
		 T entity; 
		entity = (T) sessionFactory.getCurrentSession().load(getPersistentClass(), id); 
		return entity;  
	}
	
	
	
	 public void update(T entity) {
		  sessionFactory.getCurrentSession().saveOrUpdate(entity);
	 }
	 
	 public T saveEntity(T entity) {
		 long id=(Long) sessionFactory.getCurrentSession().save(entity);
		return entity;
	 }
	
	public Class<T> getPersistentClass() {  
        return persistentClass;  
    }  


}
