package com.tf.dao.impl;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.tf.dao.BrochureDAO;
import com.tf.model.Brochure;
import com.tf.model.User;


@Repository
@Transactional
public class BrochureDAOImpl extends BaseDAOImpl<User, Long>  implements BrochureDAO{
	
	public BrochureDAOImpl() {
		super(User.class);
	}

	public Long saveBrochure(Brochure brochure) {
		try {
			if(brochure.getId()==null){
				sessionFactory.getCurrentSession().save(brochure);		
			}
			_log.debug("persist successful brochure");
			return brochure.getId();
		} catch (RuntimeException re) {
			_log.error("persist failed", re);			
			return 0l;
		}
	}
}
