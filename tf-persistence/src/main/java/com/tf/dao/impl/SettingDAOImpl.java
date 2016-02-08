package com.tf.dao.impl;

import com.tf.dao.SettingDAO;
import com.tf.model.Company;
import com.tf.model.SellerSetting;
import com.tf.persistance.util.InvestorDTO;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.hibernate.Query;


import org.hibernate.Criteria;
import org.hibernate.FetchMode;
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
	
	

	public void saveSellerSettings(SellerSetting sellerSetting) {

		_log.debug("persisting Seller Settings instance");
		try {
			Session session=sessionFactory.getCurrentSession();
            session.save(sellerSetting);
			
			_log.debug("persist successful"+sellerSetting);
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
		seller.setComapnyId(sellerSetting.getCompanyId());
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
	

	public SellerSetting getSellerSettings() {

		_log.debug("Inside getSellerSettings ");
		try {
			
			SellerSetting sellerSetting = (SellerSetting) sessionFactory.getCurrentSession().createCriteria(SellerSetting.class).uniqueResult();			
			return sellerSetting;
		} catch (RuntimeException re) {
			_log.error("getSellerSettings failed", re);
			throw re;
		}
	
	}
	
	public SellerSetting findBySellerId(Long id){
		try {
		SellerSetting instance = (SellerSetting) sessionFactory.getCurrentSession().get(
				"com.tf.model.SellerSetting", id);
		if (instance == null) {
			_log.debug("get successful, no instance found");
		} else {
			_log.debug("get successful, instance found");
		}
		return instance;
	} catch (RuntimeException re) {
		_log.error("get failed", re);
		throw re;
	}
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
}
