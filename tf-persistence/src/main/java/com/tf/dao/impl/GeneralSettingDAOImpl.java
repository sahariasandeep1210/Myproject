package com.tf.dao.impl;

import org.hibernate.Session;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.tf.dao.GeneralSettingDAO;
import com.tf.model.GeneralSetting;

@Repository
@Transactional
public class GeneralSettingDAOImpl extends BaseDAOImpl<GeneralSetting, Long>  implements GeneralSettingDAO {
	public GeneralSettingDAOImpl(){
		super(GeneralSetting.class);
	}
	
	
	public GeneralSetting getGeneralSetting() {
		try{
			 GeneralSetting list =(GeneralSetting) sessionFactory.getCurrentSession().createCriteria(GeneralSetting.class).uniqueResult();
			_log.debug("getGeneralSettings successful, result size: "+ list);
			return list;
		}
		catch(RuntimeException re) {
			_log.error("getGeneralSettings failed", re);
			throw re;
		}
 }
	
	public void saveGeneralSettings(GeneralSetting generalSettingModel) {
		_log.debug("persisting General Settings instance");
		System.out.println("saved general setting*******1"+ generalSettingModel.getVatInvestor());
		try{
		Session session=sessionFactory.getCurrentSession();
		session.saveOrUpdate(generalSettingModel);
		
		_log.info("persist successful"+generalSettingModel.toString());

		System.out.println("saved general setting*******2"+ generalSettingModel.getVatInvestor());
		}catch(RuntimeException re) {
			_log.error("persist failed", re);
			throw re;
			
		}

	}

	
}
