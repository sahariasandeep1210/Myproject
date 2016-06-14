package com.tf.util;

import java.io.IOException;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.SimpleTagSupport;

import com.liferay.portal.kernel.log.Log;
import com.liferay.portal.kernel.log.LogFactoryUtil;
import com.tf.util.model.PaginationModel;
 
/**
 * @author gautamkct
 *
 */
public class PaginationTag extends SimpleTagSupport {
	
	
	protected Log _log = LogFactoryUtil.getLog(PaginationTag.class.getName());
 
	private static final String BLANK 	 = "";
	private static final String DISABLED = "disabled";
	//current Page number
    private Integer pageNumber;
    //total no of pages
    private Integer totalPage;
    //pagination model
    private PaginationModel paginationModel;
    //default page Size 
    private int PAGINATION_INTERVAL = 10;
    
 

	public void setPageNumber(Integer pageNumber) {
		this.pageNumber = pageNumber;
	}

	public void setTotalPage(Integer totalPage) {
		this.totalPage = totalPage;
	}

	public void setPaginationModel(PaginationModel paginationModel) {
		this.paginationModel = paginationModel;
		this.pageNumber = paginationModel.getCurrentPage();
		this.totalPage = paginationModel.getNoOfPages();
		this.PAGINATION_INTERVAL=paginationModel.getPageSize();
	}
	

	public PaginationTag() {
    }
 
  
 
    @Override
    public void doTag() throws JspException, IOException {
        System.out.println("pageNumber is:" + pageNumber);
       
        System.out.println("totalPage is:" + totalPage);
        _log.info("pageNumber is:" + pageNumber);
        _log.info("totalPage is:" + totalPage);
        try {
        	        	
        	getJspContext().getOut().write("<div  id=\"pagination\" class=\"pagination pagination-centered\">");
        		getJspContext().getOut().write("<ul class=\"pagination-content\">");
			        	if (totalPage > 1){
			        		if(paginationModel.isFirstPage()){
			        			getJspContext().getOut().write("<li class=\"disabled\" ><a class=\"disabled\" href=\"javascript:void(0);\">«</a></li>");
			        		}else{
			        			getJspContext().getOut().write("<li  onclick=\"setPage("+(pageNumber-1)+")\"><a  href=\"javascript:void(0);\">«</a></li>");
			        		}
			        		
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
			        		//this code needs to optimized
			            	if(paginationModel.isLastPage()){
			            		getJspContext().getOut().write("<li class=\"disabled\"  ><a  class=\"disabled\"  href=\"javascript:void(0);\" >»</a></li>");
			            	}else{
			            		getJspContext().getOut().write("<li  onclick=\"setPage("+(pageNumber+1)+")\" ><a  href=\"javascript:void(0);\" >»</a></li>");
			            	}
			        		
			        		//getJspContext().getOut().write("<li><a  href=\"javascript:void(0);\" aria-label=\"Next\"><span aria-hidden=\"true\">»</span></a></li>");
			        		
			        	}
			        	//don't need this code as we will activate pagination  one pages are more than one
			        	/*else{
			        		//<span class=\"sr-only\">(current)</span>
			        		getJspContext().getOut().write("<li class=\"active\"><a>1</a></li>");
			        	}*/
			     getJspContext().getOut().write("</ul>");
			 getJspContext().getOut().write("</div>");
        } catch (Exception e) {
            e.printStackTrace();
            // stop page from loading further by throwing SkipPageException
            
        }
    }
 
}