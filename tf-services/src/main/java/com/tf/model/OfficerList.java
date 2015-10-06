package com.tf.model;

import java.io.Serializable;
import java.util.List;

public class OfficerList implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private List<OfficerModel> items;
	private int active_count;
	private int resigned_count;
	private int total_results;
	
	public OfficerList() {
		// TODO Auto-generated constructor stub
	}
	
	public List<OfficerModel> getItems() {
		return items;
	}
	public void setItems(List<OfficerModel> items) {
		this.items = items;
	}
	public int getActive_count() {
		return active_count;
	}
	public void setActive_count(int active_count) {
		this.active_count = active_count;
	}
	public int getResigned_count() {
		return resigned_count;
	}
	public void setResigned_count(int resigned_count) {
		this.resigned_count = resigned_count;
	}
	public int getTotal_results() {
		return total_results;
	}
	public void setTotal_results(int total_results) {
		this.total_results = total_results;
	}

	@Override
	public String toString() {
		return "OfficerList [items=" + items + ", active_count=" + active_count
				+ ", resigned_count=" + resigned_count + ", total_results="
				+ total_results + "]";
	}	
 
}
