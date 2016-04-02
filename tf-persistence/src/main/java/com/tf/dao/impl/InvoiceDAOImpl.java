
package com.tf.dao.impl;

import java.math.BigDecimal;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Disjunction;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.mysql.jdbc.StringUtils;
import com.tf.dao.InvoiceDAO;
import com.tf.model.Company;
import com.tf.model.Invoice;
import com.tf.persistance.util.ValidationUtil;
import com.tf.service.CompanyService;

@Repository
@Transactional(rollbackFor = Exception.class)
public class InvoiceDAOImpl extends BaseDAOImpl<Invoice, Long> implements InvoiceDAO {

	@Autowired
	protected ValidationUtil validationUtil;
   @Autowired
   protected CompanyService companyService;
	public InvoiceDAOImpl() {

		super(Invoice.class);
	}

	public Invoice getInvoicesById(long id) {

		_log.debug("Inside getInvoicesById ");
		try {
			Invoice invoice =
				(Invoice) sessionFactory.getCurrentSession().createCriteria(Invoice.class).add(Restrictions.eq("id", id)).uniqueResult();

			_log.debug("getInvoicesById successful, result size: " + invoice);
			return invoice;
		}
		catch (RuntimeException re) {
			_log.error("getInvoicesById failed", re);
			throw re;
		}

	}

	public List<Invoice> getInvoicesBytradeId(long id) {

		try {
			List<Invoice> invoices =
				(List<Invoice>) sessionFactory.getCurrentSession().createCriteria(Invoice.class).add(Restrictions.eq("scfTrade.id", id)).list();
			_log.debug("getInvoicesBytradeId successful, result size: " + invoices.size());
			return invoices;

		}
		catch (RuntimeException re) {
			_log.error("getInvoicesBytradeId failed", re);
			throw re;
		}
	}

	public void addInvoices(List<Invoice> invoices) {

		try {
			Session session = sessionFactory.getCurrentSession();
			for (Invoice invoice : invoices) {
				session.saveOrUpdate(invoice);
			}
			_log.debug("Invoices persisted successful");
		}
		catch (RuntimeException re) {
			_log.error("persist failed", re);
			throw re;
		}
	}
	
public void deleteInvoice(Invoice invoice){
	try{
	Session session = sessionFactory.getCurrentSession();
	Invoice inv= new Invoice();
	inv.setId(invoice.getId());
	session.delete(invoice);
	
	_log.debug("Invoices Deleted successful");
	}catch (RuntimeException e) {
		_log.error("Invoices Deleted failed", e);
		throw e;
		}
}
	@SuppressWarnings("unchecked")
	public List<Invoice> getInvoices(int startIndex, int pageSize) {

		_log.debug("Inside getInvoice ");
		try {
			List<Invoice> results =
				(List<Invoice>) sessionFactory.getCurrentSession().createQuery("from Invoice").setFirstResult(startIndex).setMaxResults(pageSize).list();
			_log.debug("GetCompanies successful, result size: " + results.size());
			return results;
		}
		catch (RuntimeException re) {
			_log.error("GetCompanies failed", re);
			throw re;
		}
	}

	public Long getInvoicesCount() {

		_log.debug("Inside getCompanies ");
		try {

			Long resultCount =
				(Long) sessionFactory.getCurrentSession().createCriteria(Invoice.class).setProjection(Projections.rowCount()).uniqueResult();
			_log.info("Companies Count:: " + resultCount);
			return resultCount;
		}
		catch (RuntimeException re) {
			_log.error("Companies Count failed", re);
			throw re;
		}
	}

	@SuppressWarnings("unchecked")
	public List<Invoice> getInvoicesAmount(List<Long> invoiceIds) {

		_log.debug("Inside getInvoicesAmount ");
		try {

			Query query = sessionFactory.getCurrentSession().createQuery("FROM Invoice invoice WHERE invoice.id IN (:ids) ");
			query.setParameterList("ids", invoiceIds);
			List<Invoice> results = (List<Invoice>) query.list();;
			_log.debug("getInvoicesAmount successful, result size: " + results.size());
			return results;
		}
		catch (RuntimeException re) {
			_log.error("GetCompanies failed", re);
			throw re;
		}
	}

	@SuppressWarnings("unchecked")
	public List<Invoice> getInvoices(long companyID, int startIndex, int pageSize) {

		_log.debug("Inside getInvoices ");
		try {

			List<Invoice> results =
				(List<Invoice>) sessionFactory.getCurrentSession().createCriteria(Invoice.class).add(Restrictions.eq("scfCompany.id", companyID)).setFirstResult(
					startIndex).setMaxResults(pageSize).list();
			_log.debug("getInvoices successful, result size: " + results.size());
			return results;
		}
		catch (RuntimeException re) {
			_log.error("getScfgetInvoicesTrades failed", re);
			throw re;
		}

	}

	@SuppressWarnings("unchecked")
	public List<Invoice> getInvoicesByCompanyNumber(String companyNumber, int startIndex, int pageSize) {

		_log.debug("Inside getInvoicesByCompanyNumber ");
		try {

			List<Invoice> results =
				(List<Invoice>) sessionFactory.getCurrentSession().createCriteria(Invoice.class).add(
					Restrictions.eq("sellerCompanyRegistrationNumber", companyNumber)).setFirstResult(startIndex).setMaxResults(pageSize).list();
			_log.debug("getInvoicesByCompanyNumber successful, result size: " + results.size());
			return results;
		}
		catch (RuntimeException re) {
			_log.error("getInvoicesByCompanyNumber failed", re);
			throw re;
		}

	}

	@SuppressWarnings("unchecked")
	public List<Invoice> getInvoicesByCompanyNoAndStatus(String companyNumber, String status) {

		_log.debug("Inside getInvoicesByCompanyNumber ");
		try {

			List<Invoice> results =
				(List<Invoice>) sessionFactory.getCurrentSession().createCriteria(Invoice.class).add(
					Restrictions.eq("sellerCompanyRegistrationNumber", companyNumber)).add(Restrictions.eq("status", status)).list();
			_log.debug("getInvoicesByCompanyNumber successful, result size: " + results.size());
			return results;
		}
		catch (RuntimeException re) {
			_log.error("getInvoicesByCompanyNumber failed", re);
			throw re;
		}

	}

	public void updateInvoices(List<Invoice> invoices) {

		try {
			Session session = sessionFactory.getCurrentSession();
			for (Invoice invoice : invoices) {
				session.saveOrUpdate(invoice);
			}
			_log.debug("Invoices updated successful");
		}
		catch (RuntimeException re) {
			_log.error("persist failed", re);
			throw re;
		}
	}

	/* New method added for finding the RegistrationNumber */
	@SuppressWarnings("unchecked")
	public List<Invoice> findByRegNum(String regNum) {

		try {
			List<Invoice> invoices =
				(List<Invoice>) sessionFactory.getCurrentSession().createCriteria(Invoice.class).add(
					Restrictions.eq("sellerCompanyRegistrationNumber", regNum)).list();

			if (invoices == null) {
				_log.debug("get successful, no instance found");
			}
			else {
				_log.debug("get successful, instance found");
			}
			return invoices;
		}
		catch (RuntimeException e) {
			_log.error("get failed", e);
			throw e;
		}
	}

	public Long getInvoiceCounts(String regNum) {

		_log.debug("Inside getInvoiceCounts ");
		try {

			Long resultCount =
				(Long) sessionFactory.getCurrentSession().createCriteria(Invoice.class).add(
					Restrictions.eq("sellerCompanyRegistrationNumber", regNum)).setProjection(Projections.rowCount()).uniqueResult();
			_log.debug("getInvoiceCounts  " + resultCount);
			return resultCount;
		}
		catch (RuntimeException re) {
			_log.error("getInvoiceCounts Count failed", re);
			throw re;
		}
	}

	public Long getInvsCounts(long companyID) {

		_log.debug("Inside getInvoiceCounts ");
		try {

			Long resultCount =
				(Long) sessionFactory.getCurrentSession().createCriteria(Invoice.class).add(Restrictions.eq("scfCompany.id", companyID)).setProjection(
					Projections.rowCount()).uniqueResult();
			_log.debug("getInvoiceCounts  " + resultCount);
			return resultCount;
		}
		catch (RuntimeException re) {
			_log.error("getInvoiceCounts Count failed", re);
			throw re;
		}
	}

	@SuppressWarnings("unchecked")
	public List<Invoice> getInvoicesByRegNum(String regNum) {

		_log.debug("Inside getScfTradesByRegNumAndTradeId ");
		try {
			Criteria criteria = sessionFactory.getCurrentSession().createCriteria(Invoice.class);
			criteria.createAlias("invoices", "inv");
			List<Invoice> invList = (List<Invoice>) criteria.add(Restrictions.eq("inv.sellerCompanyRegistrationNumber", regNum)).list();
			_log.debug("getScfTradesByRegNumAndTradeId successful, result size: " + invList.size());
			return invList;

		}
		catch (RuntimeException re) {
			_log.error("getScfTradesByRegNumAndTradeId failed", re);
			throw re;
		}

	}

	public Invoice getInvoicesByInvoiceNumAndCompanyId(long id, long companyId) {

		try {
			Invoice invoice =
				(Invoice) sessionFactory.getCurrentSession().createCriteria(Invoice.class).add(Restrictions.eq("invoiceNumber", id)).add(
					Restrictions.eq("scfCompany.id", companyId)).uniqueResult();
			_log.debug("getInvoicesByInvoiceNumber successful, result size: " + invoice);
			return invoice;

		}
		catch (RuntimeException re) {
			_log.error("getInvoicesByInvoiceNumber failed", re);
			throw re;
		}
	}

	@SuppressWarnings("unchecked")
	public List<Invoice> getInvoicesByFilter(String search, Date frmDate, Date toDate, String value, int startIndex, int pageSize) {

		_log.debug("Inside getInvoicesByFilter");
		List<Invoice> InvoiceList = new ArrayList<Invoice>();
		Invoice invoice = null;
		List<Object[]> resultscheck = new ArrayList<Object[]>();
		
		try {
			DetachedCriteria criteria = DetachedCriteria.forClass(Invoice.class);
			if (validationUtil.isNumeric(search)) {
				String qry="";
				if( StringUtils.isNullOrEmpty(value)){
				   qry="select invoice_number,payment_date,invoice_amout,duration,status ,(select idcompany from tf_company cmp where cmp.idcompany=scf_company) from scf_invoice invoice WHERE invoice.invoice_number like (:invoiceNumber)LIMIT " +
						startIndex + "," + pageSize;
				}else if(("invoiceDate").equals(value) && frmDate != null && toDate != null){
					   qry="select invoice_number,payment_date,invoice_amout,duration,status ,(select idcompany from tf_company cmp where cmp.idcompany=scf_company) from scf_invoice invoice WHERE invoice.invoice_number like (:invoiceNumber) and invoice.invoice_date BETWEEN (:fromDate) and (:toDate)LIMIT " +
						startIndex + "," + pageSize;
				}else if (("invoiceDate").equals(value) && frmDate != null && toDate == null) {
					   qry="select invoice_number,payment_date,invoice_amout,duration,status ,(select idcompany from tf_company cmp where cmp.idcompany=scf_company) from scf_invoice invoice WHERE invoice.invoice_number like (:invoiceNumber) and invoice.invoice_date  >= (:fromDate)LIMIT " +
						startIndex + "," + pageSize;
				}else if (("invoiceDate").equals(value) && frmDate == null && toDate != null) {
					   qry="select invoice_number,payment_date,invoice_amout,duration,status ,(select idcompany from tf_company cmp where cmp.idcompany=scf_company) from scf_invoice invoice WHERE invoice.invoice_number like (:invoiceNumber) and invoice.invoice_date  <= (:toDate)LIMIT " +
						startIndex + "," + pageSize;
				}else if (("financeDate").equals(value) && frmDate != null && toDate != null){
					   qry="select invoice_number,payment_date,invoice_amout,duration,status ,(select idcompany from tf_company cmp where cmp.idcompany=scf_company) from scf_invoice invoice WHERE invoice.invoice_number like (:invoiceNumber) and invoice.finance_date BETWEEN (:fromDate) and (:toDate)LIMIT " +
						startIndex + "," + pageSize;

				}else if (("financeDate").equals(value) && frmDate != null && toDate == null) {
					   qry="select invoice_number,payment_date,invoice_amout,duration,status ,(select idcompany from tf_company cmp where cmp.idcompany=scf_company) from scf_invoice invoice WHERE invoice.invoice_number like (:invoiceNumber) and invoice.finance_date >= (:fromDate)LIMIT " +
						startIndex + "," + pageSize;
					
				}else if (("financeDate").equals(value) && frmDate == null && toDate != null) {
					   qry="select invoice_number,payment_date,invoice_amout,duration,status ,(select idcompany from tf_company cmp where cmp.idcompany=scf_company) from scf_invoice invoice WHERE invoice.invoice_number like (:invoiceNumber) and invoice.finance_date <= (:toDate)LIMIT " +
						startIndex + "," + pageSize;
				}else if (("paymentDate").equals(value) && frmDate != null && toDate != null){
					   qry="select invoice_number,payment_date,invoice_amout,duration,status ,(select idcompany from tf_company cmp where cmp.idcompany=scf_company) from scf_invoice invoice WHERE invoice.invoice_number like (:invoiceNumber) and invoice.payment_date BETWEEN (:fromDate) and (:toDate)LIMIT " +
						startIndex + "," + pageSize;

				}else if (("paymentDate").equals(value) && frmDate != null && toDate == null){
					   qry="select invoice_number,payment_date,invoice_amout,duration,status ,(select idcompany from tf_company cmp where cmp.idcompany=scf_company) from scf_invoice invoice WHERE invoice.invoice_number like (:invoiceNumber) and invoice.payment_date >= (:fromDate)LIMIT " +
						startIndex + "," + pageSize;

				}else if (("paymentDate").equals(value) && frmDate == null && toDate != null) {
					   qry="select invoice_number,payment_date,invoice_amout,duration,status ,(select idcompany from tf_company cmp where cmp.idcompany=scf_company) from scf_invoice invoice WHERE invoice.invoice_number like (:invoiceNumber) and invoice.payment_date  <= (:toDate)LIMIT " +
						startIndex + "," + pageSize;
				}
				Query query = sessionFactory.getCurrentSession().createSQLQuery(qry);
				if (!StringUtils.isNullOrEmpty(search)) {
				query.setParameter("invoiceNumber", "%"+search+"%");
				}
				if (frmDate != null) {
				query.setParameter("fromDate", frmDate);
				}
				if (toDate != null) {
				query.setParameter("toDate", toDate);
				}
				resultscheck = (List<Object[]>) query.list();
				DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");

				for(Object[] row:resultscheck){
					invoice =new Invoice();
					invoice.setInvoiceNumber(Long.valueOf(row[0].toString()));
					invoice.setPayment_date(formatter.parse(row[1].toString()));
					invoice.setInvoiceAmount(new BigDecimal(row[2].toString()));
					invoice.setDuration(Integer.valueOf(row[3].toString()));
					invoice.setStatus(row[4].toString());
					Company company= companyService.findById(Long.valueOf(row[5].toString()));
					invoice.setScfCompany(company);
					InvoiceList.add(invoice);
				}
				
/*				or.add(Restrictions.like("invoiceNumber", Long.valueOf(search)));
*/			}else{
			Disjunction or = Restrictions.disjunction();

			or.add(Restrictions.like("status", search, MatchMode.ANYWHERE));

			or.add(Restrictions.like("company.name", search, MatchMode.ANYWHERE));

			if (("invoiceDate").equals(value) && frmDate != null && toDate != null) {

				criteria.add(Restrictions.ge("invoiceDate", frmDate));
				criteria.add(Restrictions.le("invoiceDate", toDate));
			}
			else if (("invoiceDate").equals(value) && frmDate != null && toDate == null) {

				criteria.add(Restrictions.ge("invoiceDate", frmDate));
			}
			else if (("invoiceDate").equals(value) && frmDate == null && toDate != null) {

				criteria.add(Restrictions.le("invoiceDate", toDate));

			}
			if (("financeDate").equals(value) && frmDate != null && toDate != null) {

				criteria.add(Restrictions.ge("financeDate", frmDate));
				criteria.add(Restrictions.le("financeDate", toDate));
			}
			else if (("financeDate").equals(value) && frmDate != null && toDate == null) {

				criteria.add(Restrictions.ge("financeDate", frmDate));
			}
			else if (("financeDate").equals(value) && frmDate == null && toDate != null) {

				criteria.add(Restrictions.le("financeDate", toDate));

			}
			if (("paymentDate").equals(value) && frmDate != null && toDate != null) {
				criteria.add(Restrictions.ge("payment_date", frmDate));
				criteria.add(Restrictions.le("payment_date", toDate));
			}
			else if (("paymentDate").equals(value) && frmDate != null && toDate == null) {
				criteria.add(Restrictions.ge("payment_date", frmDate));
			}
			else if (("paymentDate").equals(value) && frmDate == null && toDate != null) {

				criteria.add(Restrictions.le("payment_date", toDate));
			}

			InvoiceList = criteria.getExecutableCriteria(sessionFactory.getCurrentSession()).createAlias("scfCompany", "company")

			.add(or).setFirstResult(startIndex).setMaxResults(pageSize).list();
			_log.debug("getInvoicesByFilter successful, result size: " + InvoiceList.size());
             }	
		}catch (RuntimeException re) {
			_log.error("getInvoicesByFilter failed", re);
			throw re;
		}
		catch (ParseException e) {
			_log.error("getInvoicesByFilter failed", e);
			e.printStackTrace();
		}
		return InvoiceList;

	}
	public Long getInvoicesByFilterNumberCount(String search, Date frmDate, Date toDate, String value) {
		_log.debug("Inside getInvoicesByFilterCount ");
		try {
			Query query=null;
			if (validationUtil.isNumeric(search)) {
				String qry="";
				if( StringUtils.isNullOrEmpty(value)){
				   qry="select invoice_number,payment_date,invoice_amout,duration,status ,(select idcompany from tf_company cmp where cmp.idcompany=scf_company) from scf_invoice invoice WHERE invoice.invoice_number like (:invoiceNumber)"; 
				}else if(("invoiceDate").equals(value) && frmDate != null && toDate != null){
					   qry="select invoice_number,payment_date,invoice_amout,duration,status ,(select idcompany from tf_company cmp where cmp.idcompany=scf_company) from scf_invoice invoice WHERE invoice.invoice_number like (:invoiceNumber) and invoice.invoice_date BETWEEN (:fromDate) and (:toDate)";
				}else if (("invoiceDate").equals(value) && frmDate != null && toDate == null) {
					   qry="select invoice_number,payment_date,invoice_amout,duration,status ,(select idcompany from tf_company cmp where cmp.idcompany=scf_company) from scf_invoice invoice WHERE invoice.invoice_number like (:invoiceNumber) and invoice.invoice_date  >= (:fromDate)";
				}else if (("invoiceDate").equals(value) && frmDate == null && toDate != null) {
					   qry="select invoice_number,payment_date,invoice_amout,duration,status ,(select idcompany from tf_company cmp where cmp.idcompany=scf_company) from scf_invoice invoice WHERE invoice.invoice_number like (:invoiceNumber) and invoice.invoice_date  <= (:toDate)"; 
				}else if (("financeDate").equals(value) && frmDate != null && toDate != null){
					   qry="select invoice_number,payment_date,invoice_amout,duration,status ,(select idcompany from tf_company cmp where cmp.idcompany=scf_company) from scf_invoice invoice WHERE invoice.invoice_number like (:invoiceNumber) and invoice.finance_date BETWEEN (:fromDate) and (:toDate)";

				}else if (("financeDate").equals(value) && frmDate != null && toDate == null) {
					   qry="select invoice_number,payment_date,invoice_amout,duration,status ,(select idcompany from tf_company cmp where cmp.idcompany=scf_company) from scf_invoice invoice WHERE invoice.invoice_number like (:invoiceNumber) and invoice.finance_date >= (:fromDate)"; 
					
				}else if (("financeDate").equals(value) && frmDate == null && toDate != null) {
					   qry="select invoice_number,payment_date,invoice_amout,duration,status ,(select idcompany from tf_company cmp where cmp.idcompany=scf_company) from scf_invoice invoice WHERE invoice.invoice_number like (:invoiceNumber) and invoice.finance_date <= (:toDate)";
				}else if (("paymentDate").equals(value) && frmDate != null && toDate != null){
					   qry="select invoice_number,payment_date,invoice_amout,duration,status ,(select idcompany from tf_company cmp where cmp.idcompany=scf_company) from scf_invoice invoice WHERE invoice.invoice_number like (:invoiceNumber) and invoice.payment_date BETWEEN (:fromDate) and (:toDate)";

				}else if (("paymentDate").equals(value) && frmDate != null && toDate == null){
					   qry="select invoice_number,payment_date,invoice_amout,duration,status ,(select idcompany from tf_company cmp where cmp.idcompany=scf_company) from scf_invoice invoice WHERE invoice.invoice_number like (:invoiceNumber) and invoice.payment_date >= (:fromDate)";

				}else if (("paymentDate").equals(value) && frmDate == null && toDate != null) {
					   qry="select invoice_number,payment_date,invoice_amout,duration,status ,(select idcompany from tf_company cmp where cmp.idcompany=scf_company) from scf_invoice invoice WHERE invoice.invoice_number like (:invoiceNumber) and invoice.payment_date  <= (:toDate)"; 
				}
				 query = sessionFactory.getCurrentSession().createSQLQuery(qry);
				if (!StringUtils.isNullOrEmpty(search)) {
				query.setParameter("invoiceNumber", "%"+search+"%");
				}
				if (frmDate != null) {
				query.setParameter("fromDate", frmDate);
				}
				if (toDate != null) {
				query.setParameter("toDate", toDate);
				}
			}	
				Long resultCount  = Long.valueOf(query.list().size());
		        return resultCount;
			}catch (RuntimeException re) {
		_log.error("getInvoicesByFilterCount failed", re);
		throw re;
		}

}
	public Long getInvoicesByFilterCount(String search, Date frmDate, Date toDate, String value) {
		_log.debug("Inside getInvoicesByFilterCount ");
		try {
			DetachedCriteria criteria = DetachedCriteria.forClass(Invoice.class);
			Disjunction or = Restrictions.disjunction();
			if (validationUtil.isNumeric(search)) {
				or.add(Restrictions.like("invoiceNumber",Long.valueOf(search)));
			}
			or.add(Restrictions.like("status", search, MatchMode.ANYWHERE));
			or.add(Restrictions.like("company.name", search, MatchMode.ANYWHERE));
			if (("invoiceDate").equals(value) && frmDate != null && toDate != null) {

				criteria.add(Restrictions.ge("invoiceDate", frmDate));
				criteria.add(Restrictions.le("invoiceDate", toDate));
			}
			else if (("invoiceDate").equals(value) && frmDate != null && toDate == null) {

				criteria.add(Restrictions.ge("invoiceDate", frmDate));
			}
			else if (("invoiceDate").equals(value) && frmDate == null && toDate != null) {

				criteria.add(Restrictions.le("invoiceDate", toDate));

			}
			if (("financeDate").equals(value) && frmDate != null && toDate != null) {

				criteria.add(Restrictions.ge("financeDate", frmDate));
				criteria.add(Restrictions.le("financeDate", toDate));
			}
			else if (("financeDate").equals(value) && frmDate != null && toDate == null) {

				criteria.add(Restrictions.ge("financeDate", frmDate));
			}
			else if (("financeDate").equals(value) && frmDate == null && toDate != null) {

				criteria.add(Restrictions.le("financeDate", toDate));

			}
			if (("paymentDate").equals(value) && frmDate != null && toDate != null) {
				criteria.add(Restrictions.ge("payment_date", frmDate));
				criteria.add(Restrictions.le("payment_date", toDate));
			}
			else if (("paymentDate").equals(value) && frmDate != null && toDate == null) {
				criteria.add(Restrictions.ge("payment_date", frmDate));
			}
			else if (("paymentDate").equals(value) && frmDate == null && toDate != null) {

				criteria.add(Restrictions.le("payment_date", toDate));
			}

			Long resultCount =
				(Long) criteria.getExecutableCriteria(sessionFactory.getCurrentSession()).createAlias("scfCompany", "company").add(or).setProjection(
					Projections.rowCount()).uniqueResult();

			_log.debug("getInvoicesByFilterCount  " + resultCount);
			return resultCount;
		}
		catch (RuntimeException re) {
			_log.error("getInvoicesByFilterCount failed", re);
			throw re;
		}
	}

	public int validInvoiceImport(Long invoiceNumber, Long Id) {
		_log.debug("Inside validInvoiceImport ");
		int valid=0;
		Query query=null;
		String qry="";
		List<Integer> results=null;
		try {
			qry="select id FROM scf_invoice WHERE invoice_number=:invoiceNumber AND scf_company=:id";
			query = sessionFactory.getCurrentSession().createSQLQuery(qry);
			query.setParameter("invoiceNumber", invoiceNumber);
			query.setParameter("id", Id);
			results = (List<Integer>) query.list();
			if(results!=null && !results.isEmpty()){
				valid++;
			}
			_log.debug("invoice.duplicate.message successful, result size: " + results.size());
		}
		catch (RuntimeException re) {
			_log.error("invoice.duplicate.message failed", re);
			throw re;
		}finally{
			results=null;
			qry=null;
			
		}
		return valid;
	}

}
