package com.tf.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.tf.dao.SCFTradeDAO;
import com.tf.model.SCFTrade;

@Repository
@Transactional(rollbackFor = Exception.class)
public class SCFTradeDAOImpl extends BaseDAO implements SCFTradeDAO {	

	
	public List<SCFTrade>  getScfTrades(){
		_log.debug("Inside getInvoice ");
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
	
	public void saveorUpdate(SCFTrade scfTrade) {
		try {
			sessionFactory.getCurrentSession().saveOrUpdate(scfTrade);
			_log.debug("persist successful"+scfTrade);
		} catch (RuntimeException re) {
			_log.error("persist failed", re);
			throw re;
		}
	}
}
