package com.tf.dao.impl;

import org.springframework.stereotype.Repository;

import com.tf.dao.SettingDAO;
import com.tf.model.SellerSetting;

@Repository
public class SettingDAOImpl  extends BaseDAOImpl<Object, Long>   implements SettingDAO  {

	

	public void saveSellerSettings(SellerSetting sellerDTO) {

		_log.debug("persisting Seller Settings instance");
		try {
			sessionFactory.getCurrentSession().saveOrUpdate(sellerDTO);
			_log.debug("persist successful"+sellerDTO);
		} catch (RuntimeException re) {
			_log.error("persist failed", re);
			throw re;
		}
	
		
	}
	
	

}
