package com.tf.dao.impl;

import com.tf.dao.GeneralSettingDAO;
import com.tf.model.Company;
import com.tf.model.GeneralSetting;
import com.tf.model.SellerSetting;

import java.util.List;

import org.hibernate.Session;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
@Transactional
public class GeneralSettingDAOImpl extends BaseDAOImpl<GeneralSetting, Long>  implements GeneralSettingDAO {
	public GeneralSettingDAOImpl(){
		super(GeneralSetting.class);
	}
	
	
	public List<GeneralSetting> getGeneralSettings() {
		try{
			List<GeneralSetting> list =(List<GeneralSetting>) sessionFactory.getCurrentSession().createCriteria(GeneralSetting.class).list();

			_log.debug("getGeneralSettings successful, result size: "
					+ list.size());
			return list;
		}
		catch(RuntimeException re) {
			_log.error("getGeneralSettings failed", re);
			throw re;
		}
}
	
	public void saveGeneralSettings(GeneralSetting generalSettingModel) {
		_log.debug("persisting General Settings instance");
		try{
		Session session=sessionFactory.getCurrentSession();
		session.saveOrUpdate(generalSettingModel);
		_log.debug("persist successful"+generalSettingModel);

		}catch(RuntimeException re) {
			_log.error("persist failed", re);
			throw re;
			
		}

	}

	
}
