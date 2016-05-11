<%@page import="com.liferay.portal.kernel.util.WebKeys"%>
<%@page import="com.liferay.portal.theme.ThemeDisplay"%>
<%
/**
 * Copyright (c) 2000-present Liferay, Inc. All rights reserved.
 *
 * This library is free software; you can redistribute it and/or modify it under
 * the terms of the GNU Lesser General Public License as published by the Free
 * Software Foundation; either version 2.1 of the License, or (at your option)
 * any later version.
 *
 * This library is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
 * FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more
 * details.
 */
%>
<%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="portlet" %>
<%@ taglib uri="http://liferay.com/tld/aui" prefix="aui" %>
<%@ taglib uri="http://liferay.com/tld/ui" prefix="liferay-ui" %>
<%@ taglib uri="http://liferay.com/tld/theme" prefix="liferay-theme" %>

<%
ThemeDisplay themeDisplay = (ThemeDisplay) request.getAttribute(WebKeys.THEME_DISPLAY);
System.out.println(themeDisplay.getPathThemeImage());
System.out.println(themeDisplay.getPathThemeImages());
String imagePath=themeDisplay.getPathThemeImage();
%>

<portlet:defineObjects />

<div class="container">
	<div class="row-fluid">
		<div class="span4 offset4">
			<div class="login">
				<a class="logo custom-logo text-center" href="" title="Go to bvi_internal"> <img alt="bvi_internal"  src="<%=imagePath%>/logo.png"  > </a>
				<aui:form method="post" action="" >
					<div class="login-body">
					    <aui:input  type="text" name="email_address" placeholder="" label="Username">
					    	<aui:validator name="required" errorMessage="Enter username"></aui:validator>
					    </aui:input>
					    <aui:input  type="password" name="password" placeholder="" label="Password">
					    	<aui:validator name="required" errorMessage="Enter password"></aui:validator>
					    </aui:input>
					</div>
				
					<div class="footer">
					    <aui:button cssClass="btn-block btnBgBuSm" type="submit" id="btn-submit"  value="LOGIN"/>
					    <div class="link"><a href="/signup" class="image-link">New User Signup</a><span class="footer-link-devide">|</span><a href="" class="image-link">Forgot Your Password</a></div>
					</div>
				</aui:form>
			</div>
		</div>
	</div>
</div>