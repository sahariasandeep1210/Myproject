package com.tf.util;

import java.io.IOException;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.portlet.ResourceResponse;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.CreationHelper;
import org.apache.poi.ss.usermodel.Font;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import com.liferay.portal.kernel.exception.SystemException;
import com.liferay.portal.kernel.servlet.HttpHeaders;
import com.liferay.portal.kernel.util.ContentTypes;
import com.tf.model.Company;
import com.tf.persistance.util.CompanyStatus;
import com.tf.persistance.util.Constants;

public class ReportUtility {
    
    
    public static final List<String> COMPANY_HEADER		= getCompanyHeader();

    
    
    public static void generateCusotomerDemoRepots(List<Company> companyList, ResourceResponse resourceResponse) throws SystemException, IOException{
	
	
	Workbook workbook = new XSSFWorkbook();
	Sheet sheet = workbook.createSheet(Constants.COMPANY);
	int rowIndex = 0;

	CellStyle cellDateStyle = workbook.createCellStyle();
	CreationHelper createHelper = workbook.getCreationHelper();
	short dateFormat = createHelper.createDataFormat().getFormat(Constants.DATE_FORMAT);
	cellDateStyle.setDataFormat(dateFormat);
	Row headerRow = sheet.createRow(rowIndex++);	
	Cell headerCell = null;
	CellStyle style = workbook.createCellStyle();
	Font font = workbook.createFont();
	font.setBoldweight(Font.BOLDWEIGHT_BOLD);
	style.setFont(font);
	
	// Set Header columns	
	for(int i=0;i<COMPANY_HEADER.size();i++){
		headerCell = headerRow.createCell(i);
		headerCell.setCellStyle(style);
		headerCell.setCellValue(COMPANY_HEADER.get(i));
	}
	
	
	for(Company company : companyList){
		Row row = sheet.createRow(rowIndex++);
		
		int cellNo = 0;
		sheet.autoSizeColumn(cellNo);
		Cell cell = row.createCell(cellNo++);
		cell.setCellValue(company.getName());
		//cell.setCellStyle(cellDateStyle);
		
		sheet.autoSizeColumn(cellNo);
		cell = row.createCell(cellNo++);
		cell.setCellValue(company.getRegNumber());
		
		sheet.autoSizeColumn(cellNo);
		cell = row.createCell(cellNo++);
		cell.setCellValue(getAddress(company));
		
		sheet.autoSizeColumn(cellNo);
		cell = row.createCell(cellNo++);
		cell.setCellValue(company.getDateestablished());
		cell.setCellStyle(cellDateStyle);
		
		sheet.autoSizeColumn(cellNo);
		cell = row.createCell(cellNo++);
		String comType=(String)company.getCompanyType();
		if(comType.equals("1") || comType == "1"){comType="Primary Investor";}
		if(comType.equals("2") || comType == "2"){comType="Secondary Investor";}
		if(comType.equals("3") || comType == "3"){comType="Admin";}
		if(comType.equals("4") || comType == "4"){comType="Seller";}
		if(comType.equals("5") || comType == "5"){comType="SCF Company";}
		cell.setCellValue(comType);	
		
		
		sheet.autoSizeColumn(cellNo);
		cell = row.createCell(cellNo++);
		cell.setCellValue(company.getTelnumber());
		
		sheet.autoSizeColumn(cellNo);
		cell = row.createCell(cellNo++);
		cell.setCellValue(company.getActivestatus());
		
	}
	
	resourceResponse.setContentType(ContentTypes.APPLICATION_VND_MS_EXCEL);
	resourceResponse.addProperty(HttpHeaders.CONTENT_DISPOSITION, getReportName(Constants.COMPANY));
	resourceResponse.addProperty("Set-Cookie", "fileDownload=true; path=/");
	resourceResponse.addProperty("Cache-Control", "no-cache, no-store, must-revalidate");
	OutputStream outStrm = null;
	outStrm = resourceResponse.getPortletOutputStream();
	workbook.write(outStrm);
	outStrm.flush();
	outStrm.close();
	
	
		
    }
    
    public static String getReportName(String reportType){
	StringBuilder reportName=new StringBuilder();
	SimpleDateFormat sdf = new SimpleDateFormat(Constants.DATE_FORMAT);
	reportName.append(HttpHeaders.CONTENT_DISPOSITION_ATTACHMENT);
	reportName.append(Constants.SEMICOLON);
	reportName.append(Constants.SPACE);
	reportName.append(Constants.FILE_NAME);
	reportName.append(Constants.EQUAL);
	reportName.append(reportType);
	reportName.append(Constants.UNDERSCORE);		
	reportName.append(sdf.format(new Date()));
	reportName.append(Constants.XLSX_FORMAT);		
	return reportName.toString();
	
}



      private static String getAddress(Company cmp) {
	StringBuilder address=new StringBuilder();
	address.append(cmp.getAddress().getRegion());
	address.append(Constants.COMMA);
	address.append(Constants.SPACE);
	address.append(cmp.getAddress().getCountry());
	return address.toString();
    }



    private static List<String> getCompanyHeader() {
        	List<String> companyHeader =new ArrayList<String>();
        	companyHeader.add("Name");
        	companyHeader.add("Registration No");
        	companyHeader.add("Address Registered");
        	companyHeader.add("Established date");
        	companyHeader.add("Company Type");
        	companyHeader.add("Telephone No");
        	companyHeader.add("Status");	
        	return companyHeader;
        }
}
