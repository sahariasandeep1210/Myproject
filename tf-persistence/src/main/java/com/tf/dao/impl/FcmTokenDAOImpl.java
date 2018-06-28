package com.tf.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;







import com.tf.dao.FcmTokenDAO;
import com.tf.model.FcmToken;


@Repository
@Transactional
public class FcmTokenDAOImpl  extends BaseDAOImpl<FcmToken, Long>   implements FcmTokenDAO {

	public FcmTokenDAOImpl() {
		super(FcmToken.class);
	}

	public void addFcmToken(FcmToken fcmToken) {
		// TODO Auto-generated method stub
		
		try {
		System.out.println(" Before Saving  token  ");
		sessionFactory.getCurrentSession().saveOrUpdate(fcmToken);
		System.out.println(" After Saving  token ");
		} catch (RuntimeException re) {
			_log.error("Saved in", re);
			throw re;
		}
		
	}
	
	public String getUserId(String regNo){
		
		  StringBuilder qeryStringSettled = new StringBuilder();
		  qeryStringSettled.append("SELECT u.liferay_user_id ");
		  qeryStringSettled.append("FROM  tf_company c,tf_user u ");
		  qeryStringSettled.append("WHERE c.regnumber =:regNo  ");
		  qeryStringSettled.append("AND c.idcompany = u.company_id ");
		
		 // qeryStringSettled.append("AND a.investor_id=:investorId ");
		 // qeryStringSettled.append("AND t.status = 'Settled' ");
		 // qeryStringSettled.append("GROUP BY t.company_id, c.name ");
		    
	      Query querySettled= sessionFactory.getCurrentSession().createSQLQuery(qeryStringSettled.toString());
	      querySettled.setParameter("regNo",regNo);
			List<Object[]> graphArraySettled = querySettled.list();
			System.out.println("******Get UserId*****"+ graphArraySettled.size()+" " + graphArraySettled.get(0));
			
			return  graphArraySettled.get(0)+"";
	}
	
   public String getFcmToken(String userId){
	   
	   
	   StringBuilder qeryStringSettled = new StringBuilder();
	    
		  qeryStringSettled.append("SELECT f.token ");
		  qeryStringSettled.append("FROM  fcm_token f ");
		  qeryStringSettled.append("WHERE f.userId =:userId  ");
		
		 // qeryStringSettled.append("AND a.investor_id=:investorId ");
		 // qeryStringSettled.append("AND t.status = 'Settled' ");
		 // qeryStringSettled.append("GROUP BY t.company_id, c.name ");
		    
	      Query querySettled= sessionFactory.getCurrentSession().createSQLQuery(qeryStringSettled.toString());
	      querySettled.setParameter("userId",userId);
			List<Object[]> graphArraySettled = querySettled.list();
			System.out.println("******Get token*****"+ graphArraySettled.size()+" " + graphArraySettled.get(0));
			
			return String.valueOf(graphArraySettled.get(0));
         
   }
	
}
