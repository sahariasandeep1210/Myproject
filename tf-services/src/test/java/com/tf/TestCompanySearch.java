package com.tf;

import com.tf.model.CompanyList;
import com.tf.model.CompanyModel;
import com.tf.service.CompanyServices;

public class TestCompanySearch {

	public static void main(String[] args) {
		CompanyServices companyServices = new CompanyServices();
		CompanyModel companyList =companyServices.getCompanyInfo("00002065");
		System.out.println("companyList:::::"+companyList);

	}

}
