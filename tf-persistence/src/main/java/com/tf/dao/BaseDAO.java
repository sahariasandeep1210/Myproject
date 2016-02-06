package com.tf.dao;

import java.io.Serializable;


public interface BaseDAO<T, ID extends Serializable> {
	
	public T findById(Serializable id); 
	 
	public void update(T entity);
	 
	public T saveEntity(T entity);
	 
	public T loadById(Serializable id);

}
