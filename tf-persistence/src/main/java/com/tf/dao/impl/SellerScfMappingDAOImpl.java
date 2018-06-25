
package com.tf.dao.impl;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.hibernate.transform.Transformers;
import org.hibernate.type.StandardBasicTypes;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.tf.dao.SellerScfMappingDAO;
import com.tf.model.Company;
import com.tf.model.SellerScfCompanyMapping;
import com.tf.persistance.util.Constants;
import com.tf.persistance.util.SellerScfCompanyDTO;

@Repository
@Transactional
public class SellerScfMappingDAOImpl extends BaseDAOImpl<SellerScfCompanyMapping, Serializable> implements SellerScfMappingDAO {

	public SellerScfMappingDAOImpl() {

		super(SellerScfCompanyMapping.class);
	}

	@SuppressWarnings("unchecked")
	public List<SellerScfCompanyMapping> getSellerScfMapping(int startIndex, int pageSize, Long sellerComapanyId, Long scfCompanyId, String status[]) {

		_log.debug("Inside getSellerScfMapping  ");
		try {
			List<SellerScfCompanyMapping> results = new ArrayList<SellerScfCompanyMapping>();

			Session session = sessionFactory.getCurrentSession();
			Criteria criteria =
				session.createCriteria(SellerScfCompanyMapping.class);
			if (sellerComapanyId != null && sellerComapanyId > 0) {
				criteria.createAlias("sellerCompany", "sc");
				criteria.add(Restrictions.eq("sc.id", sellerComapanyId));
			}
			if (scfCompanyId != null && scfCompanyId != null) {
				criteria.add(Restrictions.eq("scfCompany", scfCompanyId));
			}
			if (status != null) {
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

	/**
	 * @param startIndex
	 * @param pageSize
	 * @param sellerComapanyId
	 * @param status
	 * @return Seller's SCF Company infomation
	 */
	@SuppressWarnings("unchecked")
	public Long getSellerScfompany(Long sellerComapanyId) {

		_log.debug("Inside getSellerScfMapping  ");
		try {
			List<SellerScfCompanyMapping> results = new ArrayList<SellerScfCompanyMapping>();

			Session session = sessionFactory.getCurrentSession();
			Criteria criteria =
				session.createCriteria(SellerScfCompanyMapping.class);
			if (sellerComapanyId != null && sellerComapanyId > 0) {
				criteria.createAlias("sellerCompany", "sc");
				criteria.add(Restrictions.eq("sc.id", sellerComapanyId));
			}	
			criteria.add(Restrictions.eq("status", Constants.STATUS.APPROVED.getValue()));			
			// temp code
			results = (List<SellerScfCompanyMapping>) criteria.setMaxResults(1).list();
			if(results!=null && results.size() >0){
				_log.debug("getSellerScfMapping successful, result size: " + results.size());
				return results.get(0).getScfCompany();
			}

			
		}
		catch (RuntimeException re) {
			_log.error("getSellerScfMapping failed", re);
			throw re;
		}
		return null;
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

	public void saveSeller(SellerScfCompanyMapping sellerScfMapping) {

		_log.debug("Inside saveSeller ");
		try {
			Session session = sessionFactory.getCurrentSession();
			session.save(sellerScfMapping);
		}
		catch (RuntimeException re) {
			_log.error("saveSeller failed", re);
			throw re;
		}

	}

	public void updateStatus(Long id, String status, String comment) {

		_log.debug("Inside updateStatus ");
		try {
			Session session = sessionFactory.getCurrentSession();
			Query query =
				session.createSQLQuery("UPDATE tf_seller_scfcompany_mapping SET status=:status,comment=:comment,update_date=NOW() WHERE id=:id");
			query.setParameter("status", status);
			query.setParameter("id", id);
			query.setParameter("comment", comment);
			query.executeUpdate();
		}
		catch (HibernateException e) {
			_log.error("updateStatus failed", e);
			throw e;
		}
	}

	public Long getSellerScfMappingCountBasedOnId(Long scfCompanyID) {
		_log.debug("Inside getSellerScfMapping ");
		try {
			Criteria criteria = (Criteria) sessionFactory.getCurrentSession().createCriteria(SellerScfCompanyMapping.class);
			criteria.add(Restrictions.eq("scfCompany", scfCompanyID));
			criteria.add(Restrictions.eq("status", Constants.STATUS.PENDING.getValue()));	
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
	
	
	@SuppressWarnings("unchecked")
	  public List<SellerScfCompanyMapping> getSellerCompanies(Long sellerComp) {
	   _log.debug("Inside getSellerCompanies ");
	   try {
		   
		 
	    StringBuilder sb = new StringBuilder();
	    List<SellerScfCompanyMapping> results = new ArrayList<SellerScfCompanyMapping>();
	    sb.append(" SELECT tf.idcompany,tf.name FROM tf_company tf ,tf_seller_scfcompany_mapping tfs  ");
	        sb.append(" WHERE  tf.idcompany = tfs.scf_company ");
	         sb.append(" AND tfs.status='Approve' AND tfs.seller_company='"+sellerComp+"'");
	    SQLQuery query = (SQLQuery) sessionFactory.getCurrentSession()
	      .createSQLQuery(sb.toString());
	    query.setResultTransformer(Criteria.ALIAS_TO_ENTITY_MAP);
	    List data = query.list();
	    if (null != data || data.size() > 0) {
	     for (Object companyObj : data) {
	      Map row = (Map) companyObj;
	   SellerScfCompanyMapping sellerScfCompanyMapping = new SellerScfCompanyMapping();
	      Company company = new Company();
	      sellerScfCompanyMapping.setId(Long.parseLong(row.get("idcompany").toString()));
	   //sellerScfCompanyMapping.setScfCompany(Long.parseLong(row.get("scf_company").toString()));
	      company.setName(row.get("name").toString());
	   sellerScfCompanyMapping.setSellerCompany(company);
	      results.add(sellerScfCompanyMapping);
	     }
	    }

	    _log.debug("GetCompanies successful, result size: "
	      + results.size());
	    return results;
	   } catch (RuntimeException re) {
	    _log.error("getSellerCompanies failed", re);
	    throw re;
	   }
	  }

	public List<SellerScfCompanyDTO> getSellerScfMappingAdminList(int startIndex, int pageSize, Long loggedInUserId, String orderBy) {
		_log.debug("Inside getSellerScfMappingAdminList ");
		try {
			StringBuilder sb = new StringBuilder();
			List<SellerScfCompanyMapping> results = new ArrayList<SellerScfCompanyMapping>();
			sb.append(" select mapping.id as sellerScfCompanyId, com.NAME as sellerName,"
					+ " com.regnumber as regNumber,com.dateestablished as dateestablished,"
					+ " com.telnumber,com1.name as scfCompanyName,mapping.status as status from tf_seller_scfcompany_mapping mapping"
					+ " left join tf_company com1 on mapping.scf_company = com1.idcompany left join tf_company com"
					+ " on mapping.seller_company = com.idcompany order by com."+orderBy);
			SQLQuery query = (SQLQuery) sessionFactory.getCurrentSession().createSQLQuery(sb.toString());
			
			query.addScalar("sellerScfCompanyId", StandardBasicTypes.LONG)
			     .addScalar("sellerName", StandardBasicTypes.STRING)
			     .addScalar("dateestablished", StandardBasicTypes.DATE)
			     .addScalar("telnumber", StandardBasicTypes.STRING)
			     .addScalar("scfCompanyName", StandardBasicTypes.STRING)
			     .addScalar("status", StandardBasicTypes.STRING)
			     .setResultTransformer(Transformers.aliasToBean(SellerScfCompanyDTO.class));
			List<SellerScfCompanyDTO> dataList = query.list();
		    return dataList;
		   } catch (RuntimeException re) {
		    _log.error("getSellerScfMappingAdminList failed", re);
		    throw re;
		   }
	}


}
