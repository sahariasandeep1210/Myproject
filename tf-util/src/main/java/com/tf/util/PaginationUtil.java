package com.tf.util;

import javax.portlet.PortletRequest;

import org.springframework.stereotype.Component;

import com.liferay.portal.kernel.util.ParamUtil;
import com.tf.util.model.PaginationModel;

@Component
public class PaginationUtil {

	
	public  PaginationModel preparePaginationModel(PortletRequest request) {
		PaginationModel paginationModel=new PaginationModel();
		int currentPage=ParamUtil.getInteger(request, "currentPage",1);
		int pageSize=ParamUtil.getInteger(request, "pageSize",5);
		int startIndex=currentPage==1?0:(currentPage -1)*pageSize;
		paginationModel.setCurrentPage(currentPage);
		paginationModel.setPageSize(pageSize);		
		paginationModel.setStartIndex(startIndex);	
		return paginationModel;
	}
	
	public  PaginationModel setPaginationInfo(Long noOfRecords,PaginationModel paginationModel) {
		//needs to changed from actual count method
		paginationModel.setNoOfRecords(noOfRecords);
		int noOfPages=(int)Math.ceil(noOfRecords * 1.0/paginationModel.getPageSize());
		paginationModel.setNoOfPages(noOfPages);
		
		if(paginationModel.getCurrentPage()==1){
			paginationModel.setFirstPage(Boolean.TRUE);
			if(noOfPages==1){
				paginationModel.setLastPage(Boolean.TRUE);
			}
			
		}else if (paginationModel.getCurrentPage()==noOfPages){
			paginationModel.setLastPage(Boolean.TRUE);
		}	
		return paginationModel;
	}
}
