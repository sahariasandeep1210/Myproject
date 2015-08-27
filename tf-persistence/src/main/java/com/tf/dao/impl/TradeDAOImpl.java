package com.tf.dao.impl;

import java.util.List;

import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.tf.dao.PODocumentDAO;
import com.tf.dao.PurchaseOrderDAO;
import com.tf.dao.TradeDAO;
import com.tf.model.Company;
import com.tf.model.PODocument;
import com.tf.model.PurchaseOrderModel;

@Repository
@Transactional(rollbackFor = Exception.class)
public class TradeDAOImpl  extends BaseDAO implements TradeDAO {

}
