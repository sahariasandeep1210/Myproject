package com.tf.dao.impl;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;


public class BaseDAO {
	
	protected static final Log _log = LogFactory.getLog(BaseDAO.class);

	
	 @Autowired
	 public SessionFactory sessionFactory;

}
