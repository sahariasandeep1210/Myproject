package com.tf.model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

public class GenericListModel  implements Serializable {
    
  
    private static final long serialVersionUID = -5443978907849652613L;
    
    private long count=0;
    private Long totalAmount;
    private List<?> list=new ArrayList();
    
    public GenericListModel() {
	
    }

    public long getCount() {
        return count;
    }

    public void setCount(long count) {
        this.count = count;
    }

    public List<?> getList() {
        return list;
    }

    public void setList(List<?> list) {
        this.list = list;
    }

	public Long getTotalAmount() {
		return totalAmount;
	}

	public void setTotalAmount(Long totalAmount) {
		this.totalAmount = totalAmount;
	}
    
    
   
}
