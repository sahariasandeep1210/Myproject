package com.tf.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.tf.dao.PurchaseOrderDAO;
import com.tf.model.Company;
import com.tf.model.PODocument;
import com.tf.model.PurchaseOrderModel;

@Repository
@Transactional(rollbackFor = Exception.class)
public class PurchaseOrderDAOImpl  extends BaseDAO implements PurchaseOrderDAO {
	
	public PurchaseOrderModel addPO(PurchaseOrderModel poModel) {
		try {
			long id=(Long) sessionFactory.getCurrentSession().save(poModel);
			poModel.setId(id);
			_log.debug("persist successful"+poModel);
		} catch (RuntimeException re) {
			_log.error("persist failed", re);
			throw re;
		}
		return poModel;
	}
	
	public void UpdatePurchaseOrder(PurchaseOrderModel poModel) {
		try {
			sessionFactory.getCurrentSession().saveOrUpdate(poModel);
			_log.debug("persist successful"+poModel);
		} catch (RuntimeException re) {
			_log.error("persist failed", re);
			throw re;
		}
	}	
	
	public PurchaseOrderModel addPODocuments(PurchaseOrderModel poModel) {
		try {
			long id=(Long) sessionFactory.getCurrentSession().save(poModel);
			poModel.setId(id);
			_log.debug("persist successful"+poModel);
		} catch (RuntimeException re) {
			_log.error("persist failed", re);
			throw re;
		}
		return poModel;
	}
	
	
	public List<PurchaseOrderModel> getPurchaseOrderList(){
		_log.debug("Inside getPurchaseOrderList() ");
		try {
			List<PurchaseOrderModel> results = (List<PurchaseOrderModel>) sessionFactory.getCurrentSession().createQuery("from PurchaseOrderModel").list();
			_log.debug("getPurchaseOrderList() successful, result size: "
					+ results.size());
			return results;
		} catch (RuntimeException re) {
			_log.error("getPurchaseOrderList failed", re);
			throw re;
		}
	}
	
	public PurchaseOrderModel findById(long id) {
		_log.debug("getting User instance with id: " + id);
		try {
			PurchaseOrderModel instance = (PurchaseOrderModel) sessionFactory.getCurrentSession().get(
					"com.tf.model.PurchaseOrderModel", id);
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
