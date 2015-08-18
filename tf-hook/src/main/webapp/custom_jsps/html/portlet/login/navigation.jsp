

<%@ include file="/html/portlet/login/init.jsp" %>

<%
String companyPortletId="tfcompanyportlet_WAR_tfadminportlet";
long companyPortletPlid= PortalUtil.getPlidFromPortletId(themeDisplay.getScopeGroupId(),false, companyPortletId);
%>

<liferay-portlet:renderURL portletName="tfcompanyportlet_WAR_tfadminportlet"   var="createCompanyURL" plid="<%=companyPortletPlid%>"   windowState="<%=WindowState.NORMAL.toString()%>">
 <liferay-portlet:param name="render" value="registerCompany"/> 
</liferay-portlet:renderURL>

<liferay-util:buffer var="navigation">
	<liferay-ui:icon-list>

		<ul class="taglib-icon-list unstyled">
			<li class="" role="presentation"> 
				<a href="${createCompanyURL}" class=" taglib-icon"  role="menuitem"> 
					<img id="rjus_column1_0" src="/tf-theme/images/common/add_user.png" alt=""> <span class="taglib-text ">Register Company</span> </a> 
			</li>
			<li class="" role="presentation"> 
				<liferay-util:include page='<%= "/html/portlet/login/navigation/forgot_password.jsp" %>' portletId="<%= portletDisplay.getRootPortletId() %>" />
			</li>
		</ul>

		

	</liferay-ui:icon-list>
</liferay-util:buffer>

<%
navigation = navigation.trim();
%>

<c:if test="<%= Validator.isNotNull(navigation) %>">
	<div class="navigation">
		<%= navigation %>
	</div>
</c:if>

<%!
private String _getSectionJsp(String name) {
	return TextFormatter.format(name, TextFormatter.N);
}
%>