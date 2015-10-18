package com.tf.dao.impl;

import java.util.List;

import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.tf.dao.PODocumentDAO;
import com.tf.model.PODocument;

@Repository
@Transactional(rollbackFor = Exception.class)
public class PODocumentDAOImpl  extends BaseDAOImpl<PODocument, Long> implements PODocumentDAO {
	
	public PODocumentDAOImpl() {
		super(PODocument.class);
	}
	
	public void addPODocument(PODocument podModel) {
		try {
			sessionFactory.getCurrentSession().saveOrUpdate(podModel);
			_log.debug("persist successful"+podModel);
		} catch (RuntimeException re) {
			_log.error("persist failed", re);
			throw re;
		}
	}
	
	public List<PODocument> getPODocuments() {
		_log.debug("Inside getPODocuments() ");
		try {
			
			List<PODocument> results = (List<PODocument>) sessionFactory.getCurrentSession().createQuery("from PODocument").list();
			_log.debug("PODocument successful, result size: "
					+ results.size());
			return results;
		} catch (RuntimeException re) {
			_log.error("PODocument failed", re);
			throw re;
		}
	}
	
	public List<PODocument> findById(long id) {
		_log.debug("getting User instance with id: " + id);
		try {
			List<PODocument> results = (List<PODocument>) sessionFactory.getCurrentSession().createCriteria(PODocument.class).add(Restrictions.eq("poID", id)).list();	
			PODocument instance = null;
			if (results != null && results.size() > 0) {
				
			}
			if (instance == null) {
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

	public void  deleteDocuments(PODocument poDocument) {
		_log.debug("getting User instance with id: " + poDocument);
		try {
			sessionFactory.getCurrentSession().delete(poDocument);
		} catch (RuntimeException re) {
			_log.error("get failed", re);
			throw re;
		}
	}

}
