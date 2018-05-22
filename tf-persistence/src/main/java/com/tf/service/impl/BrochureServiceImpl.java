package com.tf.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tf.dao.BrochureDAO;
import com.tf.model.Brochure;
import com.tf.service.BrochureService;

@Service
public class BrochureServiceImpl implements BrochureService {

	@Autowired
	private BrochureDAO brochureDAO;

	public Long saveBrochure(Brochure brochure) {
		return brochureDAO.saveBrochure(brochure);

	}
}
