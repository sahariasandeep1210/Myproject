package com.tf.dao.impl;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.ProjectionList;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.tf.dao.InvestorDAO;
import com.tf.dao.UserDAO;
import com.tf.model.Investor;
import com.tf.model.InvestorPortfolio;
import com.tf.persistance.util.DashboardModel;
import com.tf.persistance.util.InvestorDTO;
import com.tf.persistance.util.InvestorProtfolioDTO;

@Repository
@Transactional
public class InvestorDAOImpl extends BaseDAOImpl<InvestorPortfolio, Long>   implements InvestorDAO {
	
	@Autowired
	private UserDAO userDAO;
	
	public InvestorPortfolio  getInvestorByCompanyId(long id) {
		_log.debug("getting User instance with id: " + id);
		InvestorPortfolio investor=null;
		try {
			if(id!=0){
				
				investor = (InvestorPortfolio) sessionFactory.getCurrentSession().createQuery("from InvestorPortfolio investorprot where investorprot.company.id = :id").setLong("id",id).uniqueResult();
				if (investor == null) {
					_log.debug("get successful, no instance found");
				} else {
					_log.debug("get successful, instance found");
				}
			}
			return investor;
		} catch (RuntimeException re) {
			_log.error("get failed", re);
			throw re;
		}
	}
	
	
	public Map<Long,List<InvestorPortfolio>>  getInvestorPortfolioByUserId(long id) {
		_log.debug("getting User instance with id: " + id);
		Map<Long,List<InvestorPortfolio>>  map=new HashMap<Long,List<InvestorPortfolio>>();
		long companyId= userDAO.getCompanyIDbyUserID(id);
		long investorID=getInvestorID(companyId);
		try {
			if(id!=0){
				
				List<InvestorPortfolio> list = (List<InvestorPortfolio>) sessionFactory.getCurrentSession().createQuery("from InvestorPortfolio investorprot where investorprot.investor.investorId = :id").setLong("id",investorID).list();
				map.put(investorID, list);
				
			}
			return map;
		} catch (RuntimeException re) {
			_log.error("get failed", re);
			throw re;
		}
	}
	private Long getInvestorID(long companyId) {
		Long investorID=null;
		try {
			if(companyId!=0){
				
				investorID = (Long) sessionFactory.getCurrentSession().createQuery("select investor.investorId from Investor investor where investor.company.id = :id").setLong("id",companyId).uniqueResult();
				if (investorID == null) {
					_log.debug("get successful, no instance found");
				} else {
					_log.debug("get successful, instance found");
				}
			}
			return investorID;
		} catch (RuntimeException re) {
			_log.error("get failed", re);
			throw re;
		}
		
	}
	public Long getInvestorIDByCompanyId(long companyId) {
		try {
			
				
			Long	investorID = (Long) sessionFactory.getCurrentSession().createQuery("select investor.investorId from Investor investor where investor.company.id = :id").setLong("id",companyId).uniqueResult();

				if (investorID == null) {
					_log.debug("get successful, no instance found");
				} else {
					_log.debug("get successful, instance found");
				}
			
			return investorID;
		} catch (RuntimeException re) {
			_log.error("get failed", re);
			throw re;
		}
		
	}


	public DashboardModel  getDashBoardInformation(DashboardModel dasboardModel,Long scfCompanyID) {
		try {
			StringBuilder queryBuilder=new StringBuilder();
			queryBuilder.append("SELECT SUM(myCreditLine) AS totalcap,SUM(availToInvest ) AS availinvest,SUM(amountInvested) AS amountInvested FROM InvestorPortfolio");
			if(scfCompanyID!=null && scfCompanyID>0l){
				queryBuilder.append(" WHERE company_id=:scfCompanyID");
			}
				Query query =sessionFactory.getCurrentSession().createQuery(queryBuilder.toString());
				if(scfCompanyID!=null && scfCompanyID>0l){
					query.setParameter("scfCompanyID", scfCompanyID);
				}
				 List<Object[]> list = query.list();
			        for(Object[] arr : list){
			        	dasboardModel.setInvestmentCap(arr[0]!=null?Long.valueOf(arr[0].toString()):0);
			        	dasboardModel.setAvailToInvest(arr[1]!=null?Long.valueOf(arr[1].toString()):0);
			        	dasboardModel.setAmountInvested(arr[2]!=null?Long.valueOf(arr[2].toString()):0);
			        } 
			return dasboardModel;
		} catch (RuntimeException re) {
			_log.error("get failed", re);
			throw re;
		}
	}





	public void addInvestorPortfolios(List<InvestorPortfolio> investors,
			long investorId) {
		Investor investor=findByInvestorId(investorId);
		try {
			Session session=sessionFactory.getCurrentSession();
			for(InvestorPortfolio investorPortfolio: investors){
				investorPortfolio.setInvestor(investor);
				session.save(investorPortfolio);
			}
			_log.debug("Invoices persisted successful");
		} catch (RuntimeException re) {
			_log.error("persist failed", re);
			throw re;
		}
		
	}
	
	public void updateInvestorPortfolios(List<InvestorPortfolio> investors,
			long investorId) {
		Investor investor=findByInvestorId(investorId);
		try {
			Session session=sessionFactory.getCurrentSession();
			for(InvestorPortfolio investorPortfolio: investors){
				investorPortfolio.setInvestor(investor);
				session.update(investorPortfolio);
			}
			_log.debug("Invoices updated successful");
		} catch (RuntimeException re) {
			_log.error("update failed", re);
			throw re;
		}
		
	}
	
	public Investor findByInvestorId(long id) {
		_log.debug("getting Investor instance with id: " + id);
		try {
			Investor instance = (Investor) sessionFactory.getCurrentSession().get(
					"com.tf.model.Investor", id);
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
	
	public Map<String,BigDecimal>  getProtfolioTotals(long id) {
		try {
			Map<String,BigDecimal> map =new HashMap<String,BigDecimal>();
				
				Query query =sessionFactory.getCurrentSession().createQuery("SELECT SUM(currentCreditLine) AS totalCreditLine,SUM(myCreditLine) AS totalMyCreditLine,SUM(availToInvest ) AS availinvest,SUM(amountInvested) AS amountInvested FROM InvestorPortfolio "
						+ " where investor.investorId = :id").setLong("id",id);
				Query totalCrLineQuery=sessionFactory.getCurrentSession().createQuery("SELECT SUM(myCreditLine) AS totalCreditLine FROM InvestorPortfolio ");
				List<BigDecimal> totalCrLineList = totalCrLineQuery.list();
				BigDecimal totalCrLine=totalCrLineList.get(0)!=null?totalCrLineList.get(0):BigDecimal.ZERO;
			    List<Object[]> list = query.list();
			        for(Object[] arr : list){
			        	map.put("creditLine",totalCrLine);
			        	map.put("myCreditLine",arr[1]!=null?new BigDecimal(arr[1].toString()):BigDecimal.ZERO);
			        	map.put("availToInvest",arr[2]!=null?new BigDecimal(arr[2].toString()):BigDecimal.ZERO);
			        	map.put("amountInvested",arr[3]!=null?new BigDecimal(arr[3].toString()):BigDecimal.ZERO);
			        } 
			return map;
		} catch (RuntimeException re) {
			_log.error("get failed", re);
			throw re;
		}
	}
	
	public Map<String,BigDecimal>  getProtfolioTotals() {
		try {
			Map<String,BigDecimal> map =new HashMap<String,BigDecimal>();
				
				Query query =sessionFactory.getCurrentSession().createQuery("SELECT SUM(myCreditLine) AS totalMyCreditLine,SUM(availToInvest ) AS availinvest,SUM(amountInvested) AS amountInvested FROM InvestorPortfolio ");
						
			    List<Object[]> list = query.list();
			        for(Object[] arr : list){
			        	map.put("myCreditLine",arr[0]!=null?new BigDecimal(arr[0].toString()):BigDecimal.ZERO);
			        	map.put("availToInvest",arr[1]!=null?new BigDecimal(arr[1].toString()):BigDecimal.ZERO);
			        	map.put("amountInvested",arr[2]!=null?new BigDecimal(arr[2].toString()):BigDecimal.ZERO);
			        } 
			return map;
		} catch (RuntimeException re) {
			_log.error("get failed", re);
			throw re;
		}
	}
	
	public List<Long> getInvestorsScfCompanies(long investorID) {
		List<Long> list = new ArrayList<Long>();
		try {
			if (investorID != 0) {

				list = (List<Long>) sessionFactory
						.getCurrentSession()
						.createQuery(" select investorprot.company.id	from InvestorPortfolio investorprot where investorprot.investor.investorId = :id")
						.setLong("id", investorID).list();

			}
			return list;
		} catch (RuntimeException re) {
			_log.error("get failed", re);
			throw re;
		}
	}
	
	public InvestorPortfolio getInvestorProtfolio(long investorID,long scfCompany) {
		try {				
			InvestorPortfolio investorPortfolio = (InvestorPortfolio) sessionFactory.getCurrentSession().createQuery("from InvestorPortfolio protfolio where protfolio.company.id = :companyid and protfolio.investor.investorId = :id").setLong("companyid",scfCompany).setLong("id", investorID).uniqueResult();
				
			return investorPortfolio;
		} catch (RuntimeException re) {
			_log.error("get failed", re);
			throw re;
		}
		
	}
	
	public Map<Long,BigDecimal>  findTotalCreditLine(long investorID) {		
		try {		
			Map<Long,BigDecimal> map=new HashMap<Long, BigDecimal>();
			List<Object[]> protfolioObjArray= sessionFactory.getCurrentSession().createSQLQuery("SELECT company_id,SUM(my_credit_line) FROM tf_investor_portfolio GROUP BY  company_id").list();				
			for(Object[] row : protfolioObjArray){
				map.put(Long.valueOf(row[0].toString()), new BigDecimal(row[1].toString()));
	            
	        }
			return map;
		} catch (RuntimeException re) {
			_log.error("get failed", re);
			throw re;
		}
		
	}
	
	public 	List<InvestorPortfolio>  findTotalCreditLineBreakDown(long scfCompany) {
		try {		
			List<InvestorPortfolio> list= (List<InvestorPortfolio>)sessionFactory.getCurrentSession().createQuery("from InvestorPortfolio where company.id = :companyid").setLong("companyid",scfCompany).list();				
			
			return list;
		} catch (RuntimeException re) {
			_log.error("get failed", re);
			throw re;
		}
		
	}
	
	public 	List<InvestorPortfolio>  findAllInvestorProtFolios() {
		try {		
			List<InvestorPortfolio> list= (List<InvestorPortfolio>)sessionFactory.getCurrentSession().createQuery("from InvestorPortfolio order by investor.investorId").list();				
			
			return list;
		} catch (RuntimeException re) {
			_log.error("get failed", re);
			throw re;
		}
		
	}
	
	public List<InvestorProtfolioDTO> findInvestorByRate(long comapanyId) {
		try {
			List<InvestorProtfolioDTO>  list = new ArrayList<InvestorProtfolioDTO>();
			InvestorProtfolioDTO investorProtfolioDTO ;
			List<Object[]> protfolioObjArray = sessionFactory
					.getCurrentSession()
					.createSQLQuery(
							"SELECT  investor_id,my_credit_line,amount_invested,available_to_invest,investment_discount_rate,company_id,investor_portfolio_id FROM tf_investor_portfolio WHERE company_id=:companyID ORDER BY investment_discount_rate,my_credit_line")
					.setLong("companyID", comapanyId).list();
			for (Object[] row : protfolioObjArray) {
				investorProtfolioDTO=new InvestorProtfolioDTO();
				investorProtfolioDTO.setInvestorId(Long.valueOf(row[0].toString()));
				investorProtfolioDTO.setMycreditLine(new BigDecimal(row[1].toString()));
				investorProtfolioDTO.setAmountInvested(row[2]!=null?new BigDecimal(row[2].toString()):null);
				investorProtfolioDTO.setAvailToInvest(row[3]!=null?new BigDecimal(row[3].toString()):null);
				investorProtfolioDTO.setDiscountRate(Integer.valueOf(row[4].toString()));
				investorProtfolioDTO.setInvestorProtId(Long.valueOf(row[6].toString()));
				list.add(investorProtfolioDTO);

			}
			return list;
		} catch (RuntimeException re) {
			_log.error("get failed", re);
			throw re;
		}

	}
	
	
	public List<InvestorDTO> getInvestorDetails(){
		List<InvestorDTO>  list = new ArrayList<InvestorDTO>();
		InvestorDTO investor ;
		List<Object[]> investorArray = sessionFactory
				.getCurrentSession()
				.createSQLQuery(
						"SELECT inv.investor_id, cmp.name,inv.whitehall_share FROM tf_investor inv,tf_company cmp WHERE inv.company_id=cmp.idcompany").list();
		for (Object[] row : investorArray) {
			investor=new InvestorDTO();
			investor.setInvestorID(Long.valueOf(row[0].toString()));
			investor.setName(row[1].toString());
			investor.setWhitehallShare(row[2]!=null ?new BigDecimal(row[2].toString()):null);
			list.add(investor);
		}
		return list;
	}
	
	public InvestorPortfolio  loadInvestorPortfolio(long protfolioID){
		InvestorPortfolio investorPortfolio =(InvestorPortfolio)sessionFactory.getCurrentSession().load("com.tf.model.InvestorPortfolio", protfolioID); 
		return investorPortfolio;		
	}


	


	public void updateInvestorDetails(List<InvestorDTO> investors) {
		try {
			Session session=sessionFactory.getCurrentSession();
			Investor inv;
			for(InvestorDTO investor: investors){	
				inv=findByInvestorId(investor.getInvestorID());
				inv.setWhitehallShare(investor.getWhitehallShare());
				inv.setUpdateDate(new Date());
				session.update(inv);
			}
			_log.debug("Invoices updated successful");
		} catch (RuntimeException re) {
			_log.error("update failed", re);
			throw re;
		}
		
	}





	public BigDecimal getWhiteHallShare(long id) {
		BigDecimal whitehallShare=BigDecimal.ZERO;
		try {
			if(id!=0){
				
				whitehallShare = (BigDecimal) sessionFactory.getCurrentSession().createQuery("select investor.whitehallShare from Investor investor where investor.id = :id").setLong("id",id).uniqueResult();
				if (whitehallShare == null) {
					_log.debug("get successful, no instance found");
				} else {
					_log.debug("get successful, instance found");
				}
			}
			return whitehallShare;
		} catch (RuntimeException re) {
			_log.error("get failed", re);
			throw re;
		}	
	}
	
	public void updateInvestor(Investor investor){
		try {
			sessionFactory.getCurrentSession().update(investor);			
			_log.debug("Investor updated successful");
		} catch (RuntimeException re) {
			_log.error("update failed", re);
			throw re;
		}	
	
	}


	public List<Investor> getCashPoition() {
		List<Investor> investors=null;
		try {
			Session session = sessionFactory.getCurrentSession();
			Criteria criteria= session.createCriteria(Investor.class);
			criteria.createAlias("company", "cmp");
			criteria.add(Restrictions.isNotNull("cashPosition"));
			criteria.addOrder(Order.desc("cashPosition"));
			criteria.setMaxResults(5);
			ProjectionList projList = Projections.projectionList();
			projList.add(Projections.property("cashPosition"));
			projList.add(Projections.property("cmp.name"));
			criteria.setProjection(projList);
			investors=criteria.list();
		} catch (RuntimeException e) {
			_log.error("getCachPoition", e);
			throw e;
		}
		return investors;
	}


	public List<InvestorPortfolio> getInvestorPortfolioDataForGraph(
			Long scfCompanyId) {
		/*String SQL_QUERY = "SELECT student.course, COUNT(student.course) FROM Student student GROUP BY student.course";  */
		
		StringBuilder builder=new StringBuilder();
		builder.append("SELECT SUM(availToInvest) , discountRate FROM InvestorPortfolio");
		if(scfCompanyId!=null && scfCompanyId>0l){
			builder.append(" WHERE company_id=:scfCompanyId");
		}
		builder.append(" GROUP BY discountRate");
		try {
			Query query=sessionFactory.getCurrentSession().createQuery(builder.toString());
			if(scfCompanyId!=null && scfCompanyId>0l){
				query.setParameter("scfCompanyId", scfCompanyId);
			}
			List<InvestorPortfolio> investorPortfolios =query.setFirstResult(0).setMaxResults(5).list();
			if(investorPortfolios!=null && investorPortfolios.size()>0){
				return investorPortfolios;
			}
		} catch (RuntimeException e) {
			_log.error("getInvestorPortfolioDataForGraph", e);
		}
		return null;
	}
	
	public List<InvestorPortfolio> getInvestorPortfolioDataForInvestorGraph(
		Long investorID) {	
		StringBuilder builder=new StringBuilder();
		builder.append("SELECT SUM(availToInvest) , discountRate FROM InvestorPortfolio");
		if(investorID!=null && investorID>0l){
			builder.append(" where investor.investorId=:investorID");
		}
		builder.append(" GROUP BY discountRate");
		try {
			Query query=sessionFactory.getCurrentSession().createQuery(builder.toString());
			if(investorID!=null && investorID>0l){
				query.setParameter("investorID", investorID);
			}
			List<InvestorPortfolio> investorPortfolios =query.setFirstResult(0).setMaxResults(5).list();
			if(investorPortfolios!=null && investorPortfolios.size()>0){
				return investorPortfolios;
			}
	} catch (RuntimeException e) {
		_log.error("getInvestorPortfolioDataForGraph", e);
	}
	return null;
}
	
	public BigDecimal getTotalCreditAvailForInvestorGraph(
		Long investorID) {
				BigDecimal totalCreditAvail=BigDecimal.ZERO;			
			StringBuilder builder=new StringBuilder();
			builder.append("SELECT SUM(availToInvest)  FROM InvestorPortfolio");			
			if(investorID!=null && investorID>0l){
				builder.append(" where investor.investorId=:investorID");
			}
			try {
				Query query=sessionFactory.getCurrentSession().createQuery(builder.toString());
				if(investorID>0l){
					query.setParameter("investorID", investorID);
				}
				totalCreditAvail =(BigDecimal)query.uniqueResult();
				
			} catch (RuntimeException e) {
				_log.error("getInvestorPortfolioDataForGraph", e);
			}
	return totalCreditAvail;
}
	
	public BigDecimal getTotalCreditAvailForGraph(
		long scfCompanyId) {
				BigDecimal totalCreditAvail=BigDecimal.ZERO;			
			StringBuilder builder=new StringBuilder();
			builder.append("SELECT SUM(availToInvest)  FROM InvestorPortfolio");
			if(scfCompanyId>0l){
				builder.append(" WHERE company_id=:scfCompanyId");
			}
			try {
				Query query=sessionFactory.getCurrentSession().createQuery(builder.toString());
				if(scfCompanyId>0l){
					query.setParameter("scfCompanyId", scfCompanyId);
				}
				totalCreditAvail =(BigDecimal)query.uniqueResult();
				
			} catch (RuntimeException e) {
				_log.error("getInvestorPortfolioDataForGraph", e);
			}
	return totalCreditAvail;
}
	
	public Long getInvestorCount() {

		_log.debug("Inside getInvestorCount ");
		try {

			Long resultCount =
				(Long) sessionFactory.getCurrentSession().createCriteria(Investor.class).setProjection(Projections.rowCount()).uniqueResult();
			_log.info("getInvestorCount Count:: " + resultCount);
			return resultCount;
		}
		catch (RuntimeException re) {
			_log.error("getInvestorCount failed", re);
			throw re;
		}
	}
	
	public List<Investor> getInvestorsByCashPosition() {		
		
		try {
			Criteria criteria = sessionFactory.getCurrentSession().createCriteria(Investor.class);
			/*criteria.createAlias("company", "company");
			ProjectionList prList = Projections.projectionList();
			prList.add(Projections.property("company.name"));
			prList.add(Projections.property("cashPosition"));
			criteria.setProjection(prList);*/
			criteria.addOrder(Order.desc("cashPosition"));
			List<Investor> investors = (List<Investor>) criteria.setMaxResults(7).list();
			return investors;
		} catch (RuntimeException e) {
			_log.error("getInvestorPortfolioDataForGraph", e);
		}
		return null;
	}

}
