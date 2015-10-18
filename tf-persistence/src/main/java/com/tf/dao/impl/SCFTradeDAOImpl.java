package com.tf.dao.impl;

import java.io.Serializable;
import java.util.List;

import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.tf.dao.SCFTradeDAO;
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
			List<SCFTrade> results = (List<SCFTrade>) sessionFactory.getCurrentSession().createQuery("from SCFTrade").list();
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
			
			List<SCFTrade> results = (List<SCFTrade>) sessionFactory.getCurrentSession().createCriteria(SCFTrade.class).add(Restrictions.eq("company.id", companyID)).list();
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
}
