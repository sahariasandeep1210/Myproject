package com.tf.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.tf.dao.OfficerDAO;
import com.tf.model.Invoice;
import com.tf.model.Officer;
import com.tf.model.User;


@Repository
@Transactional(rollbackFor = Exception.class)
public class OfficerDAOImpl extends BaseDAOImpl<User, Long> implements  OfficerDAO{

	public List<Officer> findOfficersByCompanyId(long id) {
		
		try {
			Query query = sessionFactory.getCurrentSession().createQuery("from Officer where company.id = :companyID ");
			query.setParameter("companyID", id);
			
			List<Officer> list = query.list();
			if (list == null) {
				_log.debug("get successful, no instance found");
			} else {
				_log.debug("get successful, instance found");
			}
			return list;
		} catch (RuntimeException re) {
			_log.error("get failed", re);
			throw re;
		}
	}
	
	public void addOfficer(List<Officer> officers) {
		try {
			Session session=sessionFactory.getCurrentSession();
			for(Officer officer: officers){
				session.save(officer);
			}
			_log.debug("officers persisted successful");
		} catch (RuntimeException re) {
			_log.error("persist failed", re);
			throw re;
		}
	}


}
