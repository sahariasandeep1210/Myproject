package com.tf.dao.impl;

import com.tf.dao.SettingDAO;
import com.tf.model.SellerSetting;

import java.util.Date;
import java.util.List;

import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

@Repository
public class SettingDAOImpl  extends BaseDAOImpl<Object, Long>   implements SettingDAO  {

	public List<SellerSetting> getSellers() {
		try{
			List<SellerSetting> list =(List<SellerSetting>) sessionFactory.getCurrentSession().createCriteria(SellerSetting.class).list();

			_log.debug("getScfTrades successful, result size: "
					+ list.size());
			return list;
		}
		catch(RuntimeException re) {
			_log.error("getScfTrades failed", re);
			throw re;
}
	}
	public List<Object[]>  getSellersName(){
		 String sql = "select company.NAME, seller.seller_transaction_fee, seller.seller_finance_fee, seller.create_date, seller.update_date from tf_seller_setting seller, tf_company company where seller.company_id = company.idcompany";
		 SQLQuery query = sessionFactory.getCurrentSession().createSQLQuery(sql);
		 List data = query.list();
    	 return data;
	}
	
	

	public void saveSellerSettings(SellerSetting sellerLists) {

		_log.debug("persisting Seller Settings instance");
		try {
			
			Session session=sessionFactory.getCurrentSession();
			session.saveOrUpdate(sellerLists);
		
			_log.debug("persist successful"+sellerLists);
		} catch (RuntimeException re) {
			_log.error("persist failed", re);
			throw re;
		}
	
		
	}

	public void updateSellerSettings(SellerSetting sellerSetting) {
		try {
		Session session=sessionFactory.getCurrentSession();
		SellerSetting seller;
		seller=findBySellerId(sellerSetting.getId());
		seller.setSellerTransFee(sellerSetting.getSellerTransFee());
		seller.setSellerFinFee(sellerSetting.getSellerFinFee());
		seller.setUpdateDate(new Date());
	    session.update(seller);

		_log.debug("persist successful"+seller);

		} catch (RuntimeException re) {
			_log.error("persist failed", re);
			throw re;
		}
	}
	

	public List<SellerSetting> getSellersSetting() {

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
	public List<SellerSetting> getSellerList(long companyId){
		     _log.debug("Inside getSellerList ");
		
		List<SellerSetting> results=(List<SellerSetting>) sessionFactory.getCurrentSession().createCriteria(SellerSetting.class).add(Restrictions.eq("companyId", Long.valueOf(companyId))).list();
		  return results;

		
}
	 



	
	
	public List<SellerSetting> findByCompanyId(Long companyId) {
		_log.debug("getting User instance with id: " + companyId);
		try {
			List<SellerSetting> results = (List<SellerSetting>) sessionFactory.getCurrentSession().createCriteria(SellerSetting.class).add(Restrictions.eq("companyId",Long.valueOf(companyId))).list();
			if (results == null) {
				_log.debug("get successful, no instance found");
			} else {
				_log.debug("get successful, instance found");
			}
			return results;
		} catch (RuntimeException re) {
			_log.error("get failed", re);
			throw re;
		}
	}
	
	public SellerSetting findBySellerId(Long id) {
		// TODO Auto-generated method stub
		return null;
	}
	public SellerSetting getSellerSettings() {
		// TODO Auto-generated method stub
		return null;
	}
	public List<SellerSetting> getSellerSetting() {
		// TODO Auto-generated method stub
		return null;
	}
	
	
}
