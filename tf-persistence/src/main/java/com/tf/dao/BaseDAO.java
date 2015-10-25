package com.tf.dao;

import java.io.Serializable;


public interface BaseDAO<T, ID extends Serializable> {
	
	 public T findById(ID id);
	 
	 
	 public void update(T entity);
	 
	 public T saveEntity(T entity);

}
