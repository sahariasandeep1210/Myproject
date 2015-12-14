package com.tf.dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.tf.dao.AllotmentDAO;
import com.tf.model.Allotment;

@Repository
@Transactional
public class AllotmentDAOImpl extends BaseDAOImpl<Allotment, Long>   implements AllotmentDAO {
	
	public List<Allotment> getALlotmentsbyTrade(long tradeID){
		List<Allotment>  allotmentList=new ArrayList<Allotment>();
		_log.debug("Inside getALlotmentsbyTrade ");
		try {
			
			allotmentList = (List<Allotment>) sessionFactory.getCurrentSession().createCriteria(Allotment.class).add(Restrictions.eq("scfTrade.id", tradeID)).list();
			_log.debug("getALlotmentsbyTrade successful, result size: "
					+ allotmentList.size());
			
		} catch (RuntimeException re) {
			_log.error("getALlotmentsbyTrade failed", re);
			throw re;
		}
		return allotmentList;
		
	}

}
