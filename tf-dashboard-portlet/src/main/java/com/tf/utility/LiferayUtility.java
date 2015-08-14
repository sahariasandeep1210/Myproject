package com.tf.utility;

import java.util.List;

import javax.portlet.PortletRequest;

import org.springframework.stereotype.Component;

import com.liferay.portal.kernel.exception.PortalException;
import com.liferay.portal.kernel.exception.SystemException;
import com.liferay.portal.kernel.portlet.LiferayPortletURL;
import com.liferay.portal.kernel.util.WebKeys;
import com.liferay.portal.model.Portlet;
import com.liferay.portal.service.PortletLocalServiceUtil;
import com.liferay.portal.theme.ThemeDisplay;
import com.liferay.portal.util.PortalUtil;
import com.liferay.portlet.PortletURLFactoryUtil;

@Component
public class LiferayUtility {
	
	public  String setPortletURL(PortletRequest request,String portletName,String inputParam,String inputValue,boolean isPrivateLayout) {
		// TODO Auto-generated method stub
		List<Portlet> portletList = PortletLocalServiceUtil.getPortlets();
        String portletId = null;
        LiferayPortletURL portletURL=null;
        for(Portlet portlet : portletList){
        	if(portlet.getPortletName().equalsIgnoreCase(portletName)){
        		portletId =  portlet.getPortletId();     
        		System.out.println("portletId:::::::::::::::::::::"+portletId);
        		break;
        	}                     
        }
        ThemeDisplay themeDisplay=(ThemeDisplay)request.getAttribute(WebKeys.THEME_DISPLAY);
        try {
        	long plid= PortalUtil.getPlidFromPortletId(themeDisplay.getScopeGroupId(),isPrivateLayout, portletId);
			 portletURL = PortletURLFactoryUtil.create(request,portletId, 
					plid, PortletRequest.RENDER_PHASE);
			if(inputParam!=null){				
				portletURL.setParameter(inputParam, inputValue);
			}
		} catch (PortalException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SystemException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        return  portletURL !=null?portletURL.toString():"";
		
	}

}
