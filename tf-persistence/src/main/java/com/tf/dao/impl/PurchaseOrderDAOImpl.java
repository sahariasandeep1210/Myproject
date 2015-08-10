package com.tf.dao.impl;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.tf.dao.PurchaseOrderDAO;
import com.tf.model.PurchaseOrderModel;

@Repository
@Transactional
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

}
