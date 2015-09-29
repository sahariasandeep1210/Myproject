package com.tf.model;

import java.io.Serializable;
import java.util.List;

public class CompanyList implements Serializable {
	
	
	private static final long serialVersionUID = 1L;
	
	
	private List<CompanyModel> items; 
	private int items_per_page;
	private String kind;
	private int page_number;
	private int start_index;
	private int total_results;
	
	public CompanyList() {
		// TODO Auto-generated constructor stub
	}

	public List<CompanyModel> getItems() {
		return items;
	}

	public void setItems(List<CompanyModel> items) {
		this.items = items;
	}

	public int getItems_per_page() {
		return items_per_page;
	}

	public void setItems_per_page(int items_per_page) {
		this.items_per_page = items_per_page;
	}

	public String getKind() {
		return kind;
	}

	public void setKind(String kind) {
		this.kind = kind;
	}

	public int getPage_number() {
		return page_number;
	}

	public void setPage_number(int page_number) {
		this.page_number = page_number;
	}

	public int getStart_index() {
		return start_index;
	}

	public void setStart_index(int start_index) {
		this.start_index = start_index;
	}

	public int getTotal_results() {
		return total_results;
	}

	public void setTotal_results(int total_results) {
		this.total_results = total_results;
	}

	@Override
	public String toString() {
		return "CompanyList [items=" + items + ", items_per_page="
				+ items_per_page + ", kind=" + kind + ", page_number="
				+ page_number + ", start_index=" + start_index
				+ ", total_results=" + total_results + "]";
	}
	
	

}
