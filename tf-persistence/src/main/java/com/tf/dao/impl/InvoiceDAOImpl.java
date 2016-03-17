package com.tf.dao.impl;

import com.tf.dao.InvoiceDAO;
import com.tf.model.InvestorTransaction;
import com.tf.model.Invoice;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

@Repository
@Transactional(rollbackFor = Exception.class)
public class InvoiceDAOImpl  extends BaseDAOImpl<Invoice, Long> implements InvoiceDAO {
	
	public InvoiceDAOImpl() {
		super(Invoice.class);
	}
	
	public Invoice getInvoicesById(long id){
		_log.debug("Inside getInvoicesById ");
		try {			
			Invoice invoice = (Invoice)sessionFactory.getCurrentSession().createCriteria(Invoice.class).add(Restrictions.eq("id", id)).uniqueResult();		              
			
			_log.debug("getInvoicesById successful, result size: "
					+ invoice);
			return invoice;
		} catch (RuntimeException re) {
			_log.error("getInvoicesById failed", re);
			throw re;
		}
		
		
		
	}
	public Invoice getInvoicesBytradeId(long id){
		try{
		Invoice invoice = (Invoice)sessionFactory.getCurrentSession().createCriteria(Invoice.class).add(Restrictions.eq("scfTrade.id", id)).uniqueResult();
		_log.debug("getInvoicesBytradeId successful, result size: "
				+ invoice);
		return invoice;

	} catch (RuntimeException re) {
		_log.error("getInvoicesBytradeId failed", re);
		throw re;
	 }
	}

	public void addInvoices(List<Invoice> invoices) {
		try {
			Session session=sessionFactory.getCurrentSession();
			for(Invoice invoice: invoices){
				session.saveOrUpdate(invoice);
			}
			_log.debug("Invoices persisted successful");
		} catch (RuntimeException re) {
			_log.error("persist failed", re);
			throw re;
		}
	}

	
	@SuppressWarnings("unchecked")
	public List<Invoice> getInvoices(int startIndex,int pageSize){
		_log.debug("Inside getInvoice ");
		try {
			List<Invoice> results = (List<Invoice>) sessionFactory.getCurrentSession().createQuery("from Invoice").setFirstResult(startIndex).setMaxResults(pageSize).list();
			_log.debug("GetCompanies successful, result size: "
					+ results.size());
			return results;
		} catch (RuntimeException re) {
			_log.error("GetCompanies failed", re);
			throw re;
		}
	}
	
	public Long getInvoicesCount() {
		_log.debug("Inside getCompanies ");
		try {
			
			Long resultCount = (Long) sessionFactory.getCurrentSession().createCriteria(Invoice.class).setProjection(Projections.rowCount()).uniqueResult();
			_log.info("Companies Count:: "	+ resultCount);
			return resultCount;
		} catch (RuntimeException re) {
			_log.error("Companies Count failed", re);
			throw re;
		}
	}
	
	@SuppressWarnings("unchecked")
	public List<Invoice> getInvoicesAmount(List<Long> invoiceIds){
		_log.debug("Inside getInvoice ");
		try {
			
			Query query =  sessionFactory.getCurrentSession().createQuery("FROM Invoice invoice WHERE invoice.id IN (:ids) ");
			query.setParameterList("ids", invoiceIds);
			List<Invoice> results = (List<Invoice>)query.list();;
			_log.debug("GetCompanies successful, result size: "
					+ results.size());
			return results;
		} catch (RuntimeException re) {
			_log.error("GetCompanies failed", re);
			throw re;
		}
	}
	
	@SuppressWarnings("unchecked")
	public List<Invoice> getInvoices(long companyID,int startIndex,int pageSize){
		
		_log.debug("Inside getInvoices ");
		try {
			
			List<Invoice> results = (List<Invoice>) sessionFactory.getCurrentSession().createCriteria(Invoice.class).add(Restrictions.eq("scfCompany.id", companyID)).setFirstResult(startIndex).setMaxResults(pageSize).list();
			_log.debug("getInvoices successful, result size: "
					+ results.size());
			return results;
		} catch (RuntimeException re) {
			_log.error("getScfgetInvoicesTrades failed", re);
			throw re;
		}
		
	}
	
	@SuppressWarnings("unchecked")
	public List<Invoice> getInvoicesByCompanyNumber(String companyNumber,int startIndex,int pageSize){
		
		_log.debug("Inside getInvoicesByCompanyNumber ");
		try {
			
			List<Invoice> results = (List<Invoice>) sessionFactory.getCurrentSession().createCriteria(Invoice.class).add(Restrictions.eq("sellerCompanyRegistrationNumber", companyNumber)).setFirstResult(startIndex).setMaxResults(pageSize).list();
			_log.debug("getInvoicesByCompanyNumber successful, result size: "
					+ results.size());
			return results;
		} catch (RuntimeException re) {
			_log.error("getInvoicesByCompanyNumber failed", re);
			throw re;
		}
		
	}
	
	@SuppressWarnings("unchecked")
	public List<Invoice> getInvoicesByCompanyNoAndStatus(String companyNumber,String status){
		
		_log.debug("Inside getInvoicesByCompanyNumber ");
		try {
			
			List<Invoice> results = (List<Invoice>) sessionFactory.getCurrentSession().createCriteria(Invoice.class)
					.add(Restrictions.eq("sellerCompanyRegistrationNumber", companyNumber))
					.add(Restrictions.eq("status", status))
					.list();
			_log.debug("getInvoicesByCompanyNumber successful, result size: "
					+ results.size());
			return results;
		} catch (RuntimeException re) {
			_log.error("getInvoicesByCompanyNumber failed", re);
			throw re;
		}
		
	}
	
	public void updateInvoices(List<Invoice> invoices) {
		try {
			Session session=sessionFactory.getCurrentSession();
			for(Invoice invoice: invoices){
				session.saveOrUpdate(invoice);
			}
			_log.debug("Invoices updated successful");
		} catch (RuntimeException re) {
			_log.error("persist failed", re);
			throw re;
		}
	}
	
	/* New method added for finding the RegistrationNumber */
	@SuppressWarnings("unchecked")
	public List<Invoice> findByRegNum(String regNum) {
		try{
			List<Invoice> invoices=(List<Invoice>) sessionFactory.getCurrentSession().createCriteria(Invoice.class)
				.add(Restrictions.eq("sellerCompanyRegistrationNumber", regNum)).list();
		
		
		if (invoices == null) {
			_log.debug("get successful, no instance found");
		} else {
			_log.debug("get successful, instance found");
		}
		return invoices;
	} catch (RuntimeException e) {
		_log.error("get failed", e);
		throw e;
	}
	}
	public Long getInvoiceCounts(String regNum) {
		_log.debug("Inside getInvoiceCounts ");
		try {
		
			Long resultCount = (Long) sessionFactory.getCurrentSession().createCriteria(Invoice.class).add(Restrictions.eq("sellerCompanyRegistrationNumber", regNum)).setProjection(Projections.rowCount()).uniqueResult();
			_log.debug("getInvoiceCounts  "	+ resultCount);
			return resultCount;
		} catch (RuntimeException re) {
			_log.error("getInvoiceCounts Count failed", re);
			throw re;
		}
	}
	
	public Long getInvsCounts(long companyID) {
		_log.debug("Inside getInvoiceCounts ");
		try {
		
			Long resultCount = (Long) sessionFactory.getCurrentSession().createCriteria(Invoice.class).add(Restrictions.eq("scfCompany.id", companyID)).setProjection(Projections.rowCount()).uniqueResult();
			_log.debug("getInvoiceCounts  "	+ resultCount);
			return resultCount;
		} catch (RuntimeException re) {
			_log.error("getInvoiceCounts Count failed", re);
			throw re;
		}
	}
	
	
	@SuppressWarnings("unchecked")
	public List<Invoice> getInvoicesByRegNum(String regNum){
		_log.debug("Inside getScfTradesByRegNumAndTradeId ");
		try {
			Criteria criteria  = sessionFactory.getCurrentSession().createCriteria(Invoice.class);
			criteria.createAlias("invoices", "inv");
			List<Invoice> invList=(List<Invoice>)criteria.add(Restrictions.eq("inv.sellerCompanyRegistrationNumber", regNum)).list();
			_log.debug("getScfTradesByRegNumAndTradeId successful, result size: "
					+ invList.size());
			return invList;

		} catch (RuntimeException re) {
			_log.error("getScfTradesByRegNumAndTradeId failed", re);
			throw re;
		}
		
	}
	public Invoice getInvoicesByInvoiceNumAndCompanyId(long id,long companyId){
		try{
		Invoice invoice = (Invoice)sessionFactory.getCurrentSession().createCriteria(Invoice.class)
				         .add(Restrictions.eq("invoiceNumber", id))
				         .add(Restrictions.eq("scfCompany.id", companyId))
				         .uniqueResult();
		_log.debug("getInvoicesByInvoiceNumber successful, result size: "
				+ invoice);
		return invoice;

	} catch (RuntimeException re) {
		_log.error("getInvoicesByInvoiceNumber failed", re);
		throw re;
	 }
	}
	
	
	@SuppressWarnings("unchecked")
	public List<Invoice> getInvoicesByFilter(String search,Date frmDate,Date toDate,String value,int startIndex,int pageSize){
		_log.debug("Inside getInvoicesByFilter");
		List<Invoice> InvoiceList=new ArrayList<Invoice>();
        System.out.println("search"+search);
        System.out.println("frmDate"+frmDate);
        System.out.println("toDate"+toDate);
        System.out.println("value"+value);
		try {
			DetachedCriteria criteria= DetachedCriteria.forClass(Invoice.class);
			/*Pattern pattern = Pattern.compile(".*[^0-9].*");
			Pattern pattern1 = Pattern.compile("^[a-zA-Z]*$");
			Matcher isNumber = pattern.matcher(search);
	        Matcher matcher = pattern1.matcher(search);
			System.out.println("isNumber:"+isNumber);
			if(isNumber.matches()){
				System.out.println("Numeric");
				criteria.add(Restrictions.like("invoiceNumber", Long.valueOf("%"+search+"%")));
			}else if(matcher.matches()){
				System.out.println("Alpha");

				criteria .add(Restrictions.like("scfCompany.name", "%"+search+"%"));
			}else{
				System.out.println("AlphaNumeric");
				criteria.add(Restrictions.like("status", "%"+search+"%"));
			}*/
			if(!StringUtils.isEmpty(search)){
				criteria.add(Restrictions.like("status", "%"+search+"%"));
			}
			if(("invoiceDate").equals(value) && frmDate != null && toDate != null){
				System.out.println("iam in inv1");

				criteria.add(Restrictions.ge("invoiceDate", frmDate));
				criteria.add(Restrictions.le("invoiceDate",toDate));
			}else if(("invoiceDate").equals(value) && frmDate != null && toDate==null){
				System.out.println("iam in inv2");

				criteria.add(Restrictions.eq("invoiceDate", frmDate));
			}else if(("invoiceDate").equals(value) && frmDate == null && toDate!=null){
				System.out.println("iam in inv3");

				criteria.add(Restrictions.eq("invoiceDate",toDate));

			}
			if(("financeDate").equals(value) && frmDate != null && toDate != null){
				System.out.println("iam in fi1");

				criteria.add(Restrictions.ge("financeDate", frmDate));
				criteria.add(Restrictions.le("financeDate",toDate));
			}else if(("financeDate").equals(value) && frmDate != null && toDate==null){
				System.out.println("iam in fi2");

				criteria.add(Restrictions.eq("financeDate", frmDate));
			}else if(("financeDate").equals(value) && frmDate == null && toDate!=null){
				System.out.println("iam in fi3");

				criteria.add(Restrictions.eq("financeDate",toDate));

			}
			if(("paymentDate").equals(value) && frmDate != null && toDate != null){
				System.out.println("iam in pa1");
				criteria.add(Restrictions.ge("payment_date", frmDate));
				criteria.add(Restrictions.le("payment_date",toDate));
			}else if(("paymentDate").equals(value) && frmDate != null && toDate==null){
				System.out.println("iam in pa2");
				criteria.add(Restrictions.eq("payment_date", frmDate));
			}else if(("paymentDate").equals(value) && frmDate == null && toDate!=null){
				System.out.println("iam in pa3");

				criteria.add(Restrictions.eq("payment_date",toDate));
			}
			
            InvoiceList=criteria.getExecutableCriteria(sessionFactory.getCurrentSession()).setFirstResult(startIndex).setMaxResults(pageSize).list();
            System.out.println("InvoiceList"+InvoiceList);
			_log.debug("getInvoicesByFilter successful, result size: "
					+ InvoiceList.size());
			return InvoiceList;
		} catch (RuntimeException re) {
			_log.error("getInvoicesByFilter failed", re);
			throw re;
		}
	}
	
	public Long getInvoicesByFilterCount(String search,Date frmDate,Date toDate,String value) {
		_log.debug("Inside getInvoicesByFilterCount ");
		try {
			DetachedCriteria criteria= DetachedCriteria.forClass(Invoice.class);
			/*Pattern pattern = Pattern.compile(".*[^0-9].*");
			Pattern pattern1 = Pattern.compile("^[a-zA-Z]*$");
			Matcher isNumber = pattern.matcher(search);
	        Matcher matcher = pattern1.matcher(search);
			System.out.println("isNumber:"+isNumber);
			if(isNumber.matches()){
				System.out.println("Numeric");
				criteria.add(Restrictions.like("invoiceNumber", Long.valueOf("%"+search+"%")));
			}else if(matcher.matches()){
				System.out.println("Alpha");

				criteria .add(Restrictions.like("scfCompany.name", "%"+search+"%"));
			}else{
				System.out.println("AlphaNumeric");
				criteria.add(Restrictions.like("status", "%"+search+"%"));
			}*/
			if(!StringUtils.isEmpty(search)){
				criteria.add(Restrictions.like("status", search+"%"));
			}
			if(("invoiceDate").equals(value) && frmDate != null && toDate != null){
				System.out.println("iam in inv1");

				criteria.add(Restrictions.ge("invoiceDate", frmDate));
				criteria.add(Restrictions.le("invoiceDate",toDate));
			}else if(("invoiceDate").equals(value) && frmDate != null && toDate==null){
				System.out.println("iam in inv2");

				criteria.add(Restrictions.eq("invoiceDate", frmDate));
			}else if(("invoiceDate").equals(value) && frmDate == null && toDate!=null){
				System.out.println("iam in inv3");

				criteria.add(Restrictions.eq("invoiceDate",toDate));

			}
			if(("financeDate").equals(value) && frmDate != null && toDate != null){
				System.out.println("iam in fi1");

				criteria.add(Restrictions.ge("financeDate", frmDate));
				criteria.add(Restrictions.le("financeDate",toDate));
			}else if(("financeDate").equals(value) && frmDate != null && toDate==null){
				System.out.println("iam in fi2");

				criteria.add(Restrictions.eq("financeDate", frmDate));
			}else if(("financeDate").equals(value) && frmDate == null && toDate!=null){
				System.out.println("iam in fi3");

				criteria.add(Restrictions.eq("financeDate",toDate));

			}
			if(("paymentDate").equals(value) && frmDate != null && toDate != null){
				System.out.println("iam in pa1");
				criteria.add(Restrictions.ge("payment_date", frmDate));
				criteria.add(Restrictions.le("payment_date",toDate));
			}else if(("paymentDate").equals(value) && frmDate != null && toDate==null){
				System.out.println("iam in pa2");
				criteria.add(Restrictions.eq("payment_date", frmDate));
			}else if(("paymentDate").equals(value) && frmDate == null && toDate!=null){
				System.out.println("iam in pa3");

				criteria.add(Restrictions.eq("payment_date",toDate));
			}
			

			Long resultCount=(Long) criteria.getExecutableCriteria(sessionFactory.getCurrentSession()).setProjection(Projections.rowCount()).uniqueResult();
					
					
			_log.debug("getInvoicesByFilterCount  "	+ resultCount);
			return resultCount;
		} catch (RuntimeException re) {
			_log.error("getInvoicesByFilterCount failed", re);
			throw re;
		}
	}
	
	
}
