package com.tf.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tf.dao.InvoiceCompanyDAO;


@Service
public class InvoiceCompanyServiceImpl {
	
	@Autowired 
	private InvoiceCompanyDAO invoiceCompanyDAO;

}
