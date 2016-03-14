package com.tf.dao.impl;

import java.io.Serializable;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.tf.dao.WhiteHallTransactionDAO;
import com.tf.model.WhiteHallTransaction;

@Repository
public class WhiteHallTransactionDAOImpl extends BaseDAOImpl<WhiteHallTransaction, Serializable> implements WhiteHallTransactionDAO {

}
