package com.tf.controller.company;

import java.io.File;
import java.io.FileInputStream;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.portlet.ActionRequest;
import javax.portlet.ActionResponse;
import javax.portlet.RenderRequest;
import javax.portlet.RenderResponse;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.portlet.ModelAndView;
import org.springframework.web.portlet.bind.annotation.ActionMapping;
import org.springframework.web.portlet.bind.annotation.RenderMapping;

import com.liferay.portal.kernel.util.ParamUtil;
import com.tf.model.Invoice;
import com.tf.service.InvoiceService;


/**
 * This controller is responsible for request/response handling on Seller/Company screens
 * @author pawan
 *
 */
@Controller
@RequestMapping(value = "VIEW")
public class InvoiceController {
	
	@Autowired
	protected InvoiceService invoiceService;
	
	@RenderMapping
	protected ModelAndView renderInvoiceList(@ModelAttribute("invoiceModel") Invoice invoice,ModelMap model,RenderRequest request, RenderResponse response) throws Exception {		
		System.out.println("In render");
		return new ModelAndView("addInvoice", model);		
	}	
	
	
	@ActionMapping(params="action=importInvoice")
	protected ModelAndView callAction(@ModelAttribute("invoiceModel") Invoice invoice, 
												 ModelMap model, 
												 ActionRequest request,
												 ActionResponse response) throws Exception {
			String d=ParamUtil.getString(request, "check"); 
			String docu=ParamUtil.getString(request, "docu"); 
			System.out.println("docu:::::"+docu);
			String path=request.getParameter("insuranceDoc");
			System.out.println(d);
			System.out.println(path);
	        FileInputStream inputStream = new FileInputStream(new File("C:\\Office pic\\Sample.xlsx"));
	        Workbook workbook = new XSSFWorkbook(inputStream);
	        List<Invoice> invoiceList=new ArrayList<Invoice>();
	        int numberOfSheets = workbook.getNumberOfSheets();
	        for(int i=0; i < numberOfSheets; i++){
	        	Invoice obj=new Invoice();
	        	Sheet sheet = workbook.getSheetAt(i);
                //every sheet has rows, iterate over them
                Iterator<Row> rowIterator = sheet.iterator();
                while (rowIterator.hasNext()) 
                {
                	Row row = rowIterator.next();
                    //Every row has columns, get the column iterator and iterate over them
                    Iterator<Cell> cellIterator = row.cellIterator();
                    int index=0;
                    while (cellIterator.hasNext()) 
                    {  
                    	Cell cell = cellIterator.next();
                        //Get the Cell object
                       if(index==0){
                    	   obj.setInvoiceNumber((long)(cell.getNumericCellValue())); 
                       }else if(index==1){
                    	   obj.setInvoiceDate(cell.getDateCellValue());
                    	   
                       }else if(index==2){
                    	   obj.setSellerCompanyRegistrationNumber(cell.getStringCellValue());
                       }
                       else if(index==3){
                    	   obj.setSellerCompanyVatNumber(cell.getStringCellValue());
                       }
                       else if(index==4){
                    	   obj.setInvoiceAmount(BigDecimal.valueOf(cell.getNumericCellValue()));
                       }
                       else if(index==5){
                    	   obj.setVatAmount(BigDecimal.valueOf(cell.getNumericCellValue()));
                       }
                       else if(index==6){
                    	   obj.setInvoiceDesc(cell.getStringCellValue());
                       }
                       else if(index==7){
                    	   obj.setDuration((int)(cell.getNumericCellValue()));
                       }
                       else if(index==8){
                    	   obj.setPayment_date(cell.getDateCellValue());
                       }
                       else if(index==9){
                    	   obj.setCurrency(cell.getStringCellValue());
                       }
                        index++;
                    }   
                    invoiceList.add(obj);
                }
               
	        }
	        try {
				if (invoiceList != null && invoiceList.size() > 0) {
					for (Invoice invoice2 : invoiceList) {
						invoiceService.addInvoice(invoice2);
					}
				}
			} catch (Exception e) {
				// TODO: handle exception
			}finally{
				  inputStream.close();
			}
	    	return new ModelAndView("addInvoice", model);	

	}
}
