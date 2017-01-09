
package com.tf.dao.impl;

import java.math.BigDecimal;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Disjunction;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.tf.dao.InvoiceDAO;
import com.tf.model.Company;
import com.tf.model.GenericListModel;
import com.tf.model.Invoice;
import com.tf.persistance.util.Constants;
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
	@SuppressWarnings({ "unchecked", "unused", "rawtypes" })
	public GenericListModel getInvoices(Long companyID,int startIndex, int pageSize,String registrationNo) {
		_log.debug("Inside getInvoices ");
		try {
			 List<Invoice> results = new ArrayList<Invoice>();;
			if (companyID != null) {

				String sqlQuery = "";
				if (companyID != null && ! StringUtils.isNotBlank(registrationNo)) {
					sqlQuery = "SELECT scf.*,tf.name FROM scf_invoice scf LEFT JOIN tf_company  tf ON tf.regnumber = scf.seller_company_registration_number where scf.scf_company = '"
							+ companyID + "' ORDER BY scf.update_date DESC";
				} else if (StringUtils.isNotBlank(registrationNo)) {
					sqlQuery = "SELECT scf.*,tf.name FROM scf_invoice scf LEFT JOIN tf_company  tf ON tf.regnumber = scf.seller_company_registration_number where scf.seller_company_registration_number = '"
							+ companyID + "' ORDER BY scf.update_date DESC";
				}
				SQLQuery query = (SQLQuery) sessionFactory.getCurrentSession()
						.createSQLQuery(sqlQuery).setFirstResult(startIndex)
						.setMaxResults(pageSize);
				query.setResultTransformer(Criteria.ALIAS_TO_ENTITY_MAP);
				List data = query.list();
				if (null != data || data.size() > 0) {
					for (Object invoiceObj : data) {
						Map row = (Map) invoiceObj;
						Invoice invoiceObject = new Invoice();
						Company company = new Company();
						invoiceObject.setId(Long.parseLong(row.get("id").toString()));
						invoiceObject.setInvoiceNumber(row.get("invoice_number").toString());
						try {
							DateFormat df = new SimpleDateFormat(Constants.DATE_FORMAT);
							Date paymentDate = df.parse(row.get("payment_date").toString());
							invoiceObject.setPayment_date(paymentDate);
						} catch (Exception e) {
							System.out.println(e);
						}
						try {
							invoiceObject.setSellerCompanyVatNumber(null == row.get("seller_company_vat_number").toString() ? "" : row.get("seller_company_vat_number").toString());
						} catch (Exception e) {
							invoiceObject.setSellerCompanyVatNumber("");
						}
						try {
							BigDecimal bt = new BigDecimal(null == row.get("vat_amount").toString() ? "" : row.get("vat_amount").toString());
							invoiceObject.setVatAmount(bt);
						} catch (Exception e) {
							String ammount = "0";
							BigDecimal vatAmmount = new BigDecimal(ammount);
							invoiceObject.setVatAmount(vatAmmount);
						}
						try {
							invoiceObject.setSellerCompanyRegistrationNumber(row.get("seller_company_registration_number").toString());
						} catch (Exception e) {
							invoiceObject.setSellerCompanyRegistrationNumber("");
						}
						
						try {
							BigDecimal bd = new BigDecimal(row.get("invoice_amout").toString());
							invoiceObject.setInvoiceAmount(bd);
						} catch (Exception e) {
							invoiceObject.setInvoiceAmount(null);
						}
						try {
							invoiceObject.setInvoiceDesc(null == row.get(	"invoice_desc").toString() ? "" : row.get("invoice_desc").toString());
						} catch (Exception e) {
							invoiceObject.setInvoiceDesc("");
						}
						try {
							invoiceObject.setDuration(Integer.parseInt(null == row.get("duration").toString() ? "1" : row.get("duration").toString()));
						} catch (Exception e) {
							int duration = 0;
							invoiceObject.setDuration(duration);
						}
						try {
							invoiceObject.setCurrency(null == row.get("currency").toString() ? "" : row.get("currency").toString());
						} catch (Exception e) {
							invoiceObject.setCurrency("");
						}
						try {
							company.setName(null == row.get("name").toString() ? "": row.get("name").toString());
							invoiceObject.setScfCompany(company);
						} catch (Exception e) {
							invoiceObject.setScfCompany(company);
						}
						try {
							invoiceObject.setStatus(null == row.get("status").toString() ? "": row.get("status").toString());
						} catch (Exception e) {
							invoiceObject.setStatus("");
						}
						results.add(invoiceObject);
					}
				}
			}
			else{
				 Criteria  criteria=sessionFactory.getCurrentSession().createCriteria(Invoice.class);
			    	if(companyID!=null){
			    	    criteria.add(Restrictions.eq("scfCompany.id", companyID));
			    	}else if(StringUtils.isNotBlank(registrationNo)){
			    	    criteria.add(Restrictions.eq("sellerCompanyRegistrationNumber", registrationNo));
			    	}
			    	results =(List<Invoice>)criteria.addOrder(Order.desc("updateDate")).setFirstResult(startIndex).setMaxResults(pageSize).list();
			}
			
		       
			
			GenericListModel genericModel=new GenericListModel();
			genericModel.setCount(getInvoicesCount(companyID,registrationNo));
			genericModel.setList(results);
			_log.debug("getInvoices successful, result size: " + results.size());	
			return genericModel;
		}
		catch (RuntimeException re) {
			_log.error("getInvoices failed", re);
			throw re;
		}
	}

	public Long getInvoicesCount(Long companyID,String registrationNo) {
		_log.debug("Inside getInvoicesCount ");
		try {
		    	Criteria criteria=sessionFactory.getCurrentSession().createCriteria(Invoice.class);		
			if(companyID!=null){
		    	    criteria.add(Restrictions.eq("scfCompany.id", companyID));
		    	}else if(StringUtils.isNotBlank(registrationNo)){
		    	    criteria.add(Restrictions.eq("sellerCompanyRegistrationNumber", registrationNo));
		    	}
			Long resultCount =(Long)criteria.setProjection(Projections.rowCount()).uniqueResult();
			_log.info("getInvoicesCount Count:: " + resultCount);
			return resultCount;
		}
		catch (RuntimeException re) {
			_log.error("getInvoicesCount failed", re);
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

	public Invoice getInvoicesByInvoiceNumAndCompanyId(String invoiceNo, long companyId) {
		try {
			Invoice invoice =
				(Invoice) sessionFactory.getCurrentSession().createCriteria(Invoice.class).add(Restrictions.eq("invoiceNumber", invoiceNo)).add(
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
	public GenericListModel getInvoicesByFilter(String search, String frmDate, String toDate, String value, int startIndex, int pageSize,Long companyID,String registrationNo) {
		_log.debug("Inside getInvoicesByFilter");
		GenericListModel genericModel=new GenericListModel();
		try {
			
			StringBuilder sqlQuery = new StringBuilder();
			sqlQuery.append("SELECT scf.*,tf.name FROM scf_invoice scf LEFT JOIN tf_company  tf ON tf.regnumber = scf.seller_company_registration_number");
			if(null != value && value.length()>3){
				sqlQuery.append(" Where scf.status LIKE '"+search+"%' AND scf.invoice_number LIKE '"+search+"%' AND tf.name LIKE '"+search+"%'");
			}else{
				sqlQuery.append(" Where scf.status LIKE '"+search+"%' OR scf.invoice_number LIKE '"+search+"%' OR tf.name LIKE '"+search+"%'");
			}
			
		
			 if(companyID!=null){
					sqlQuery.append(" AND scf.scf_company = '"+companyID+"'");
			 }else if(StringUtils.isNotBlank(registrationNo)){
				     sqlQuery.append(" AND scf.seller_company_registration_number = '"+registrationNo+"'");
			 }
			
			if (frmDate != null && toDate != null) {
				 
				if(value.equals("invoiceDate")){
					sqlQuery.append(" AND scf.invoice_date between '"+frmDate+"' AND  '"+toDate+"'");
				} else if(value.equals("payment_date")){
					sqlQuery.append(" AND scf.payment_date between '"+frmDate+"' AND  '"+toDate+"'");
				} else if(value.equals("financeDate")){
					sqlQuery.append(" AND scf.finance_date between '"+frmDate+"' AND  '"+toDate+"'");
				}
			}
			else if (frmDate != null && toDate == null) {
				if(value.equals("invoiceDate")){
					sqlQuery.append(" AND scf.invoice_date >= '"+frmDate+"'");
				} else if(value.equals("payment_date")){
					sqlQuery.append(" AND scf.payment_date >= '"+frmDate+"'");
				} else if(value.equals("financeDate")){
					sqlQuery.append(" AND scf.finance_date >= '"+frmDate+"'");
				}
				
			}
			else if (frmDate == null && toDate != null) {
				if(value.equals("invoiceDate")){
					sqlQuery.append(" AND scf.invoice_date <= '"+toDate+"'");
				} else if(value.equals("payment_date")){
					sqlQuery.append(" AND scf.payment_date <= '"+toDate+"'");
				} else if(value.equals("financeDate")){
					sqlQuery.append(" AND scf.finance_date <= '"+toDate+"'");
				}
			}
			sqlQuery.append(" ORDER BY scf.update_date DESC");
			List<Invoice> invoicelist = new ArrayList<Invoice>();
			
			SQLQuery query = (SQLQuery) sessionFactory.getCurrentSession().createSQLQuery(sqlQuery.toString()).setFirstResult(startIndex)
					.setMaxResults(pageSize);
			query.setResultTransformer(Criteria.ALIAS_TO_ENTITY_MAP);
			List data = query.list();
			if (null != data || data.size() > 0) {

				for (Object invoiceObj : data) {
					Map row = (Map) invoiceObj;
					Invoice invoiceObject = new Invoice();
					Company company = new Company();
					invoiceObject.setId(Long.parseLong(row.get("id")
							.toString()));
					invoiceObject.setInvoiceNumber(row
							.get("invoice_number").toString());

					try {
						DateFormat df = new SimpleDateFormat(
								Constants.DATE_FORMAT);
						Date paymentDate = df.parse(row.get("payment_date")
								.toString());
						invoiceObject.setPayment_date(paymentDate);
					} catch (Exception e) {
						System.out.println(e);
					}

					try {
						invoiceObject.setSellerCompanyVatNumber(null == row
								.get("seller_company_vat_number")
								.toString() ? "" : row.get(
								"seller_company_vat_number").toString());
					} catch (Exception e) {
						invoiceObject.setSellerCompanyVatNumber("");
					}
					try {
						BigDecimal bt = new BigDecimal(null == row.get(
								"vat_amount").toString() ? "" : row.get(
								"vat_amount").toString());
						invoiceObject.setVatAmount(bt);
					} catch (Exception e) {
						String ammount = "0";
						BigDecimal vatAmmount = new BigDecimal(ammount);
						invoiceObject.setVatAmount(vatAmmount);
					}
					invoiceObject.setSellerCompanyRegistrationNumber(row
							.get("seller_company_registration_number")
							.toString());
					BigDecimal bd = new BigDecimal(row.get("invoice_amout")
							.toString());
					invoiceObject.setInvoiceAmount(bd);
					invoiceObject.setInvoiceDesc(null == row.get(
							"invoice_desc").toString() ? "" : row.get(
							"invoice_desc").toString());
					invoiceObject.setDuration(Integer.parseInt(null == row
							.get("duration").toString() ? "1" : row.get(
							"duration").toString()));

					invoiceObject.setCurrency(null == row.get("currency")
							.toString() ? "" : row.get("currency")
							.toString());
					company.setName(null == row.get("name").toString() ? ""
							: row.get("name").toString());
					invoiceObject.setScfCompany(company);
					invoiceObject
							.setStatus(null == row.get("status").toString() ? ""
									: row.get("status").toString());
					invoicelist.add(invoiceObject);
				}
			
				
			}
			/*	DetachedCriteria criteria = DetachedCriteria.forClass(Invoice.class);	
				Disjunction or = Restrictions.disjunction();
					or.add(Restrictions.like("invoiceNumber",search,MatchMode.ANYWHERE));
					or.add(Restrictions.like("status", search, MatchMode.ANYWHERE));
					or.add(Restrictions.like("company.name", search, MatchMode.ANYWHERE));
					
					
				if(companyID!=null){
				   	    criteria.add(Restrictions.eq("scfCompany.id", companyID));
				 }else if(StringUtils.isNotBlank(registrationNo)){
				    	    criteria.add(Restrictions.eq("sellerCompanyRegistrationNumber", registrationNo));
				 }
				
				
				if (frmDate != null && toDate != null) {
					criteria.add(Restrictions.ge(value, frmDate));
					criteria.add(Restrictions.le(value, toDate));
				}
				else if (frmDate != null && toDate == null) {
					criteria.add(Restrictions.ge(value, frmDate));
				}
				else if (frmDate == null && toDate != null) {
					criteria.add(Restrictions.le(value, toDate));
				}	
				criteria.addOrder(Order.desc("updateDate"));
				List<Invoice> invoicelist = criteria.getExecutableCriteria(sessionFactory.getCurrentSession()).createAlias("scfCompany", "company")
							  .add(or).setFirstResult(startIndex).setMaxResults(pageSize).list();*/
				
				genericModel.setCount(getInvoicesByFilterCount(search,frmDate,toDate,value,companyID,registrationNo));
				genericModel.setList(invoicelist);
				_log.debug("getInvoicesByFilter successful, result size: " + invoicelist.size());
          	
		}catch (RuntimeException re) {
			_log.error("getInvoicesByFilter failed", re);
			throw re;
		}
		
		return genericModel;

	}
	
	public Long getInvoicesByFilterCount(String search, String frmDate, String toDate, String value,Long companyID,String registrationNo) {
		_log.debug("Inside getInvoicesByFilterCount ");
		try {
			DateFormat formatter = new SimpleDateFormat(Constants.DATE_FORMAT);
			Date fromDate = null ;
			Date toDates = null;
			try {
				if(null != frmDate && frmDate.length()>0){
					fromDate = formatter.parse(frmDate);
				}
				if(null != toDate && toDate.length()>0){
					toDates = formatter.parse(toDate);
				}
			} catch (ParseException e) {
				System.out.println(e);
			}
			DetachedCriteria criteria = DetachedCriteria.forClass(Invoice.class);
			Disjunction or = Restrictions.disjunction();
				or.add(Restrictions.like("invoiceNumber",search,MatchMode.ANYWHERE));
				or.add(Restrictions.like("status", search, MatchMode.ANYWHERE));
				or.add(Restrictions.like("company.name", search, MatchMode.ANYWHERE));
			
			if(companyID!=null){
		   	    criteria.add(Restrictions.eq("scfCompany.id", companyID));
        		 }else if(StringUtils.isNotBlank(registrationNo)){
        		    	    criteria.add(Restrictions.eq("sellerCompanyRegistrationNumber", registrationNo));
        		 }
			if (frmDate != null && toDate != null) {
				criteria.add(Restrictions.ge(value, fromDate));
				criteria.add(Restrictions.le(value, toDates));
			} else if (frmDate != null && toDate == null) {
				criteria.add(Restrictions.ge(value, fromDate));
			} else if ( frmDate == null && toDate != null) {
				criteria.add(Restrictions.le(value, toDates));
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

	public int validInvoiceImport(String invoiceNumber, Long Id) {
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

	public Long getInvoicesCount() {
	    	try {
		    Criteria criteria = sessionFactory.getCurrentSession()
			    .createCriteria(Invoice.class);
		    Long resultCount = (Long) criteria.setProjection(
			    Projections.rowCount()).uniqueResult();
		    _log.info("getInvoicesCount Count:: " + resultCount);
		    return resultCount;
		} catch (Exception e) {
		    // TODO: handle exception
		}
	    	 return 0l;
	}
	
	
}
