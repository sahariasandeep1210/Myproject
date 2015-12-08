package com.tf.dao.impl;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.tf.dao.AllotmentDAO;
import com.tf.model.Allotment;

@Repository
@Transactional
public class AllotmentDAOImpl extends BaseDAOImpl<Allotment, Long>   implements AllotmentDAO {

}
