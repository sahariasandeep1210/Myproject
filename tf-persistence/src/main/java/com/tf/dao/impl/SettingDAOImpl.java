package com.tf.dao.impl;

import java.math.BigDecimal;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.hibernate.Criteria;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import com.tf.dao.SettingDAO;
import com.tf.model.Company;
import com.tf.model.SellerSetting;
import com.tf.model.SellerSettingModel;
import com.tf.persistance.util.Constants;

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
		seller=getSellerSetting(sellerSetting.getId());
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
	public List<SellerSettingModel> getSellersSettingUsingJoin() {
		
		_log.debug("Inside getSellerSettings ");
		try {
			
			List<SellerSettingModel> SellerSettingModel = new ArrayList<SellerSettingModel>();	
			StringBuilder sb = new StringBuilder();
			sb.append("SELECT inttable.*,inttable.name AS company , cmptble.name AS scf_companyname ");
			sb.append(" FROM (SELECT map.scf_company,map.seller_company,ss.*,cmp.name FROM tf_seller_scfcompany_mapping map, tf_seller_setting ss, tf_company cmp");
			sb.append(" WHERE ss.company_id=map.seller_company AND map.status='Approve' AND cmp.idcompany=ss.company_id ) inttable, tf_company cmptble");
			sb.append(" WHERE inttable.scf_company=cmptble.idcompany");
			SQLQuery query = (SQLQuery) sessionFactory.getCurrentSession()
					.createSQLQuery(sb.toString());
			query.setResultTransformer(Criteria.ALIAS_TO_ENTITY_MAP);
			List data = query.list();
			if (null != data || data.size() > 0) {
				for (Object sellerObj : data) {
					Map row = (Map) sellerObj;
					SellerSettingModel sellerSettingModel = new SellerSettingModel();
					Company company = new Company();
					sellerSettingModel.setId(Long.parseLong(row.get("id")
							.toString()));
					Date updateDate = null;
					try{
						DateFormat df = new SimpleDateFormat(Constants.DATE_FORMAT);
						Date createDate = df.parse(row.get("create_date").toString());
						sellerSettingModel.setCreateDate(createDate);
					    updateDate = df.parse(row.get("update_date").toString());
						sellerSettingModel.setUpdateDate(updateDate);
					}catch(Exception e){
						sellerSettingModel.setUpdateDate(updateDate);
					}
					
					try {
						BigDecimal big = new BigDecimal(row.get("seller_transaction_fee").toString());
						sellerSettingModel.setSellerTransFee(big);
					} catch (Exception e) {}
					try {
						BigDecimal big = new BigDecimal(row.get("seller_finance_fee").toString());
						sellerSettingModel.setSellerFinFee(big);
					} catch (Exception e) {
					}
					sellerSettingModel.setCompany(row.get("company").toString());
					sellerSettingModel.setInvestorCompany(row.get("scf_companyname")
							.toString());
					SellerSettingModel.add(sellerSettingModel);
				}

			}

			return SellerSettingModel;
		} catch (RuntimeException re) {
			_log.error("getSellerSettings failed", re);
			throw re;
		}
	}

}
