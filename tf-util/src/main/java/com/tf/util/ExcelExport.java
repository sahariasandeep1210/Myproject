package com.tf.util;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.List;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.CreationHelper;
import org.apache.poi.ss.usermodel.Font;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.stereotype.Component;

@Component
public class ExcelExport {
    
    public <T> Workbook excelExport(String fileName, List<String> headers, List<T> list) throws NoSuchMethodException, SecurityException, IllegalAccessException, IllegalArgumentException, InvocationTargetException{
	
	Workbook workbook = new XSSFWorkbook();
	Sheet sheet = workbook.createSheet(fileName);
	int rowIndex = 0;
	int columnCount = 0;
	
	CellStyle cellDateStyle = workbook.createCellStyle();
	CreationHelper createHelper = workbook.getCreationHelper();
	short dateFormat = createHelper.createDataFormat().getFormat(Constants.DATE_FORMAT);
	cellDateStyle.setDataFormat(dateFormat);
	
	Row headerRow = sheet.createRow(++rowIndex);
	Cell headerCell = null;
	
	CellStyle style = workbook.createCellStyle();
	Font font = workbook.createFont();
	font.setBold(true);
	style.setFont(font);
	
	
	// Set Header columns
	for(int i=0;i<headers.size();i++){
	    headerCell = headerRow.createCell(i);
	    headerCell.setCellStyle(style);
	    headerCell.setCellValue(headers.get(i));
	}
	Class<? extends Object> classz = list.get(0).getClass();
	for(T object : list){
	    Row row = sheet.createRow(rowIndex++);
	    columnCount = 0;
	    for (String fieldName : headers) {
		 Cell cell = row.createCell(columnCount);
		 Method method = null;
		 try {
                     method = classz.getMethod("get" + capitalize(fieldName));
                 } catch (NoSuchMethodException nme) {
                     method = classz.getMethod("get" + fieldName);
                 }
		 Object value = method.invoke(object, (Object[]) null);
		 if (value != null) {
                     if (value instanceof String) {
                         cell.setCellValue((String) value);
                     } else if (value instanceof Long) {
                         cell.setCellValue((Long) value);
                     } else if (value instanceof Integer) {
                         cell.setCellValue((Integer) value);
                     } else if (value instanceof Double) {
                         cell.setCellValue((Double) value);
                     }
                 }
		 columnCount++;		
	    }
	
	}
	
	return workbook;
	
			
    }
    
  //capitalize the first letter of the field name for retriving value of the field later
    private  String capitalize(String s) {
        if (s.length() == 0)
            return s;
        return s.substring(0, 1).toUpperCase() + s.substring(1);
    }

}
