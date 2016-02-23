package com.tf.dao.impl;

import java.io.Serializable;
import java.util.List;
import java.util.Set;

import org.hibernate.FetchMode;
import org.hibernate.Hibernate;
import org.hibernate.criterion.CriteriaSpecification;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.tf.dao.SCFTradeDAO;
import com.tf.model.Company;
import com.tf.model.Invoice;
import com.tf.model.SCFTrade;

@Repository
@Transactional
public class SCFTradeDAOImpl extends BaseDAOImpl<SCFTrade, Serializable> implements SCFTradeDAO {	
	
	public SCFTradeDAOImpl() {
		super(SCFTrade.class);
	}

	
	public List<SCFTrade>  getScfTrades(){
		_log.debug("Inside getScfTrades  ");
		try {
			List<SCFTrade> results = (List<SCFTrade>) sessionFactory.getCurrentSession().createCriteria(SCFTrade.class).setFetchMode("invoices",FetchMode.JOIN).setFetchMode("allotments", FetchMode.JOIN)
					.setResultTransformer(CriteriaSpecification.DISTINCT_ROOT_ENTITY).list();
			_log.debug("getScfTrades successful, result size: "
					+ results.size());
			return results;
		} catch (RuntimeException re) {
			_log.error("getScfTrades failed", re);
			throw re;
		}
	}
	
	public SCFTrade save(SCFTrade scfTrade) {
		try {
			Long id=(Long)sessionFactory.getCurrentSession().save(scfTrade);
			scfTrade.setId(id);
			_log.debug("persist successful"+scfTrade);
		} catch (RuntimeException re) {
			_log.error("persist failed", re);
			throw re;
		}
		
		return scfTrade;
	}
	
	public List<SCFTrade> getScfTrades(Long companyID){		
		_log.debug("Inside getScfTrades ");
		try {
			
			List<SCFTrade> results = (List<SCFTrade>) sessionFactory.getCurrentSession().createCriteria(SCFTrade.class).add(Restrictions.eq("company.id", companyID)).setFetchMode("invoices",FetchMode.JOIN).
					setResultTransformer(CriteriaSpecification.DISTINCT_ROOT_ENTITY).list();
			_log.debug("getScfTrades successful, result size: "
					+ results.size());
		return results;
		} catch (RuntimeException re) {
			_log.error("getScfTrades failed", re);
			throw re;
		}
		
	}
	
	public SCFTrade findById(long id) {
		_log.debug("getting Trade instance with id: " + id);
		try {
			SCFTrade instance = (SCFTrade) sessionFactory.getCurrentSession().get(
					"com.tf.model.SCFTrade", id);
			Hibernate.initialize(instance.getInvoices());
			//Set<Invoice> invoices= instance.getInvoices();
			
			//_log.info("Invoices Size:::"+invoices.size());
			//instance.setInvoices(invoices);
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
	
	public List<SCFTrade> getScfTradesByTradeId(Long tradeId){		
		_log.debug("Inside getScfTrades ");
		try {
			
			List<SCFTrade> results = (List<SCFTrade>) sessionFactory.getCurrentSession().createCriteria(SCFTrade.class).add(Restrictions.eq("id", tradeId)).list();
			_log.debug("getScfTrades successful, result size: "
					+ results.size());
			return results;
		} catch (RuntimeException re) {
			_log.error("getScfTrades failed", re);
			throw re;
		}
		
	}
	
	@SuppressWarnings("unchecked")
	public List<SCFTrade> getScfTrades(Long companyID,int startIndex,int pageSize) {
		_log.debug("Inside getCompanies ");
		try {
			
			List<SCFTrade> results = (List<SCFTrade>) sessionFactory.getCurrentSession().createCriteria(SCFTrade.class).add(Restrictions.ne("company.id", companyID)).setFirstResult(startIndex).setMaxResults(pageSize).list();
			_log.debug("GetCompanies successful, result size: "
					+ results.size());
			return results;
		} catch (RuntimeException re) {
			_log.error("GetCompanies failed", re);
			throw re;
		}
	}
	@SuppressWarnings("unchecked")
	public Long getScfTradesCount(Long companyID) {
		_log.debug("Inside getCompanies ");
		try {
			
			Long resultCount = (Long) sessionFactory.getCurrentSession().createCriteria(SCFTrade.class).add(Restrictions.ne("company.id", companyID)).setProjection(Projections.rowCount()).uniqueResult();
			_log.debug("Companies Count "	+ resultCount);
			return resultCount;
		} catch (RuntimeException re) {
			_log.error("Companies Count failed", re);
			throw re;
		}
	}
	
	
	
}
