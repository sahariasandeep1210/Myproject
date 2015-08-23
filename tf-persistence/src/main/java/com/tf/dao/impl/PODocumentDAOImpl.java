package com.tf.dao.impl;

import java.util.List;

import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.tf.dao.PODocumentDAO;
import com.tf.dao.PurchaseOrderDAO;
import com.tf.model.Company;
import com.tf.model.PODocument;
import com.tf.model.PurchaseOrderModel;

@Repository
@Transactional(rollbackFor = Exception.class)
public class PODocumentDAOImpl  extends BaseDAO implements PODocumentDAO {
	
	public PODocument addPODocument(PODocument podModel) {
		try {
			long id=(Long) sessionFactory.getCurrentSession().save(podModel);
			podModel.setPoID(id);
			_log.debug("persist successful"+podModel);
		} catch (RuntimeException re) {
			_log.error("persist failed", re);
			throw re;
		}
		return podModel;
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
	
	public PODocument findById(long id) {
		_log.debug("getting User instance with id: " + id);
		try {
			List<PODocument> results = (List<PODocument>) sessionFactory.getCurrentSession().createCriteria(PODocument.class).add(Restrictions.ne("poID", id)).list();	
			PODocument instance = null;
			if (results != null && results.size() > 0) {
				instance = results.get(0);
			}
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
