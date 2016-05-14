package com.tf.service;

import com.tf.model.Company;
import com.tf.persistance.util.DashboardModel;


public interface DashBoardService {
	
	
	public DashboardModel setDashBoardInformation(DashboardModel dashModel,String userType,Company scfCompany);

}
