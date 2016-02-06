package com.tf.dao.impl;

import java.util.List;

import org.hibernate.criterion.Restrictions;
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


	public List<SellerSetting> getSellerSettings() {

		_log.debug("Inside getSellerSettings ");
		try {
			
			List<SellerSetting> sellerSettings = (List<SellerSetting>) sessionFactory.getCurrentSession().createCriteria(SellerSetting.class).list();		
			return sellerSettings;
		} catch (RuntimeException re) {
			_log.error("getSellerSettings failed", re);
			throw re;
		}
	
	}


	public SellerSetting getSellerSetting(long sellerCmpId) {
		_log.debug("Inside getSellerSetting ");
		try {			
			SellerSetting sellerSetting = (SellerSetting) sessionFactory.getCurrentSession().createCriteria(SellerSetting.class).add(Restrictions.eq("company.id", sellerCmpId)).uniqueResult();		
			return sellerSetting;
		} catch (RuntimeException re) {
			_log.error("getSellerSetting failed", re);
			throw re;
		}
	
	
	}



	

}
