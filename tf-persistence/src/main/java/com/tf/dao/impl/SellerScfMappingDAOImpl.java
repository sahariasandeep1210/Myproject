package com.tf.dao.impl;

import com.tf.dao.SellerScfMappingDAO;
import com.tf.model.SellerScfCompanyMapping;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
@Transactional
public class SellerScfMappingDAOImpl extends BaseDAOImpl<SellerScfCompanyMapping, Serializable> implements SellerScfMappingDAO  {
	public SellerScfMappingDAOImpl() {

		super(SellerScfCompanyMapping.class);
	}
	
	@SuppressWarnings("unchecked")
	public List<SellerScfCompanyMapping> getSellerScfMapping(int startIndex, int pageSize,Long sellerComapanyId,Long scfCompanyId,String status[]) {

		_log.debug("Inside getSellerScfMapping  ");
		try {
			List<SellerScfCompanyMapping> results = new ArrayList<SellerScfCompanyMapping>();

				Session session = sessionFactory.getCurrentSession();
				Criteria criteria =
					session.createCriteria(SellerScfCompanyMapping.class);
				if(sellerComapanyId!=null && sellerComapanyId>0){
					criteria.createAlias("sellerCompany","sc");
					criteria.add(Restrictions.eq("sc.id", sellerComapanyId));
				}
				if(scfCompanyId!=null && scfCompanyId!=null){
					criteria.add(Restrictions.eq("scfCompany", scfCompanyId));
				}
				if(status!=null){
					criteria.add(Restrictions.in("status", status));
				}
					results = (List<SellerScfCompanyMapping>) criteria.list();
			
			_log.debug("getSellerScfMapping successful, result size: " + results.size());
			return results;
		}
		catch (RuntimeException re) {
			_log.error("getSellerScfMapping failed", re);
			throw re;
		}
	}

	public Long getSellerScfMappingCount() {
		_log.debug("Inside getSellerScfMapping ");
		try {
			Criteria criteria = (Criteria) sessionFactory.getCurrentSession().createCriteria(SellerScfCompanyMapping.class);
			Long resultCount =
				(Long) criteria.setProjection(
					Projections.rowCount()).uniqueResult();
			_log.info("getSellerScfMapping Count:: " + resultCount);
			return resultCount;
		}
		catch (RuntimeException re) {
			_log.error("getSellerScfMapping Count failed", re);
			throw re;
		}
	}
	
	public void saveSeller(SellerScfCompanyMapping sellerScfMapping){
		_log.debug("Inside saveSeller ");
		try {
		Session session = sessionFactory.getCurrentSession();
        session.save(sellerScfMapping);
		}catch(RuntimeException re){
			_log.error("saveSeller failed", re);
			throw re;
		}
		
		
	}

	public void updateStatus(Long id, String status,String comment ) {
		_log.debug("Inside updateStatus ");
		try {
			Session session = sessionFactory.getCurrentSession();
			Query query=session.createSQLQuery("UPDATE tf_seller_scfcompany_mapping SET status=:status,comment=:comment,update_date=NOW() WHERE id=:id");
			query.setParameter("status", status);
			query.setParameter("id", id);
			query.setParameter("comment", comment);
			query.executeUpdate();
		} catch (HibernateException e) {
			_log.error("updateStatus failed",e);
			throw e;
		}
	}
	

}
