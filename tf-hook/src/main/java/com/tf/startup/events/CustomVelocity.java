package com.tf.startup.events;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.liferay.portal.kernel.events.Action;
import com.liferay.portal.kernel.events.ActionException;
import com.liferay.portal.kernel.exception.PortalException;
import com.liferay.portal.kernel.exception.SystemException;
import com.liferay.portal.kernel.util.WebKeys;
import com.liferay.portal.model.User;
import com.liferay.portal.util.PortalUtil;

public class CustomVelocity extends Action {

	@Override
	public void run(HttpServletRequest request, HttpServletResponse response)
			throws ActionException {
		Map<String, Object> vmVariables = new HashMap<String, Object>();
		try {
			if(PortalUtil.getUser(request)!=null){
				User user= PortalUtil.getUser(request);
				vmVariables.put("screenName", user.getScreenName());	
			}
		} catch (PortalException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SystemException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		request.setAttribute(WebKeys.VM_VARIABLES, vmVariables);
		
	}

}
