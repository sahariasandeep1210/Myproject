package com.tf.util.model;

import java.io.Serializable;


/**
 * 
 * Pagination Model
 * @author Gautam Sharma
 *
 */
public class PaginationModel  implements Serializable{
	
	private static final long serialVersionUID = 5667536631070363869L;
	
	
	private int 		startIndex;
	private int 		pageSize;
	private int 		currentPage;
	private int 		noOfPages;
	private boolean 	firstPage;
	private boolean 	lastPage;

	
	
	public PaginationModel() {
		
	}

	public int getStartIndex() {
		return startIndex;
	}

	public void setStartIndex(int startIndex) {
		this.startIndex = startIndex;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getNoOfPages() {
		return noOfPages;
	}

	public void setNoOfPages(int noOfPages) {
		this.noOfPages = noOfPages;
	}

	public boolean isFirstPage() {
		return firstPage;
	}

	public void setFirstPage(boolean firstPage) {
		this.firstPage = firstPage;
	}

	public boolean isLastPage() {
		return lastPage;
	}

	public void setLastPage(boolean lastPage) {
		this.lastPage = lastPage;
	}

	@Override
	public String toString() {
		return "PaginationModel [startIndex=" + startIndex + ", pageSize="
				+ pageSize + ", currentPage=" + currentPage + ", noOfPages="
				+ noOfPages + ", firstPage=" + firstPage + ", lastPage="
				+ lastPage + "]";
	}
	

}
