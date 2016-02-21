package com.tf.dao.impl;

import java.io.Serializable;

import org.springframework.stereotype.Repository;

import com.tf.dao.TradeAuditDAO;
import com.tf.model.TradeAudit;


@Repository
public class TradeAuditDAOImpl extends BaseDAOImpl<TradeAudit, Serializable> implements TradeAuditDAO {

}
