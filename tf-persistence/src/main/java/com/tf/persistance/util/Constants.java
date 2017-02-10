package com.tf.persistance.util;

import java.text.SimpleDateFormat;
import java.util.Date;

public class Constants {

	public static final String ADMIN 			= "Admin";
	public static final String SCF_ADMIN 			= "SCF Company Admin";
	public static final String SELLER_ADMIN		 	= "Seller Admin";
	public static final String PRIMARY_INVESTOR_ADMIN 	= "Primary Investor Admin";

	public static final String OMNI_ADMIN 			= "Administrator";
	public static final String WHITEHALL_ADMIN 		= "WhiteHall Admin";

	public static final String DATE_FORMAT 			= "dd-MM-yyyy";
	public static final String COMPANY 			= "Companies";
	public static final String COMMA 			= ",";
	public static final String SPACE 			= " ";
	
	
	public static final String UNDERSCORE			= "_";
	public static final String EQUAL			= "=";
	public static final String SEMICOLON			= ";";
	public static final String XLSX_FORMAT			= ".xlsx";
	public static final String FILE_NAME			= "filename";

	public static String formatDate(String inDate) {
		String parsedDate = null;
		try {
			Date initDate = null;
			String inputDate = inDate.replace("-", "/");
			initDate = new SimpleDateFormat("dd/MM/yyyy").parse(inputDate);
			SimpleDateFormat formatter1 = new SimpleDateFormat("yyyy-MM-dd");
			parsedDate = formatter1.format(initDate);
			return parsedDate;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return parsedDate;
	}

	public static String formatDateInDDMMYYYY(String inDate) {
		  String parsedDate = null;
		  try {
		   Date initDate = null;
		   initDate = new SimpleDateFormat("yyyy-MM-dd").parse(inDate);
		   SimpleDateFormat formatter1 = new SimpleDateFormat("dd-MM-yyyy");
		   parsedDate = formatter1.format(initDate);
		   return parsedDate;
		  } catch (Exception e) {
		   
		   e.printStackTrace();
		  }
		  return parsedDate;
		 }
	
	public static String formatDateInDDMMYY(String inDate) {
		  String parsedDate = null;
		  try {
		   Date initDate = null;
		   initDate = new SimpleDateFormat("yyyy-MM-dd").parse(inDate);
		   SimpleDateFormat formatter1 = new SimpleDateFormat("dd-MM-yyyy");
		   parsedDate = formatter1.format(initDate);
		   return parsedDate;
		  } catch (Exception e) {
		   
		   e.printStackTrace();
		  }
		  return parsedDate;
		 }
	public static enum STATUS {
		PENDING("Pending"), APPROVED("Approve"), REJECTED("Reject");

		private final String value;

		STATUS(String value) {
			this.value = value;
		}

		public String getValue() {
			return value;
		}

	}
}
