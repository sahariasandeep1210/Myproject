package com.tf.util;

import java.io.IOException;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.SimpleTagSupport;
 
/**
 * @author gautamkct
 *
 */
public class PaginationTag extends SimpleTagSupport {
 
	//current Page number
    private Integer pageNumber;
    //total no of pages
    private Integer totalPage;
    //default page Size 
    final int PAGINATION_INTERVAL = 5;
 

	public void setPageNumber(Integer pageNumber) {
		this.pageNumber = pageNumber;
	}

	public void setTotalPage(Integer totalPage) {
		this.totalPage = totalPage;
	}

	public PaginationTag() {
    }
 
  
 
    @Override
    public void doTag() throws JspException, IOException {
        System.out.println("pageNumber is:" + pageNumber);
        System.out.println("totalPage is:" + totalPage);
        try {
        	
        	getJspContext().getOut().write("<div class=\"pagination pagination-centered\">");
        		getJspContext().getOut().write("<ul>");
			        	if (totalPage != 1){
			        		getJspContext().getOut().write("<li class=\"disabled\"><a  href=\"javascript:void(0);\">«</a></li>");
			        		// getJspContext().getOut().write(" <li class=\"disabled\"><a href=\"javascript:void(0);\"  aria-label=\"Previous\"><span aria-hidden=\"true\">&laquo;</span></a></li>");
			        		if (pageNumber > 5){
			        			getJspContext().getOut().write("<li><a href=\"javascript:void(0);\" onclick=\"setPage(1)\">1</a></li>");
			        			getJspContext().getOut().write("<li><a>...</a></li>");
			        			
							}
			        		for (int i = Math.max(1, pageNumber - (PAGINATION_INTERVAL/2)); i <= Math.min(pageNumber + PAGINATION_INTERVAL, totalPage); i++) {
								if (pageNumber == i){
									//<span class=\"sr-only\">(current)</span>
									getJspContext().getOut().write(" <li class=\"active\"><a href=\"javascript:void(0);\">"+i+" </a></li>");
								}else{
									getJspContext().getOut().write("<li><a href=\"javascript:void(0);\" onclick=\"setPage("+i+")\">"+i+"</a></li>");
								}
			        		}
			        		if ((totalPage - pageNumber) > PAGINATION_INTERVAL){
			        			getJspContext().getOut().write("<li><a>...</a></li>");
			        			getJspContext().getOut().write("<li><a href=\"javascript:void(0);\" onclick=\"setPage("+totalPage+")\">"+totalPage+"</a></li>");
							}
			        		
			        		getJspContext().getOut().write("<li><a  href=\"javascript:void(0);\">»</a></li>");
			        		//getJspContext().getOut().write("<li><a  href=\"javascript:void(0);\" aria-label=\"Next\"><span aria-hidden=\"true\">»</span></a></li>");
			        		
			        	}
			        	else{
			        		//<span class=\"sr-only\">(current)</span>
			        		getJspContext().getOut().write("<li class=\"active\"><a>1</a></li>");
			        	}
			     getJspContext().getOut().write("</ul>");
			 getJspContext().getOut().write("</div>");
        } catch (Exception e) {
            e.printStackTrace();
            // stop page from loading further by throwing SkipPageException
            
        }
    }
 
}