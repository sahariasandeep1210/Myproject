package com.tf.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.tf.dao.OfficerDAO;
import com.tf.model.Officer;


@Repository
@Transactional(rollbackFor = Exception.class)
public class OfficerDAOImpl extends BaseDAOImpl<Officer, Long> implements  OfficerDAO{
	
	public OfficerDAOImpl() {
		super(Officer.class);
	}

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
			re.printStackTrace();
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
	
	public Officer findById(long id){
		_log.debug("getting User instance with id: " + id);
		try {
			Officer instance = (Officer) sessionFactory.getCurrentSession().get(
					"com.tf.model.Officer", id);
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
	
	public void  addorUpdateOfficer(Officer officer){
		_log.debug("persisting Company instance");
		try {
			sessionFactory.getCurrentSession().saveOrUpdate(officer);
			_log.debug("persist successful"+officer);
		} catch (RuntimeException re) {
			_log.error("persist failed", re);
			throw re;
		}
	}


}
