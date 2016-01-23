<%@include file="init.jsp"%>

<portlet:renderURL var="generalSettingsURL">
	<portlet:param name="render" value="generalsetting" />
</portlet:renderURL>

<portlet:renderURL var="investorSettingsURL">
</portlet:renderURL>

<portlet:renderURL var="sellerSetingsURL">
	<portlet:param name="render" value="sellerSetings" />
</portlet:renderURL>

<portlet:renderURL var="scfSettingsURL">
	<portlet:param name="render" value="scfSettings" />
</portlet:renderURL>

<form id="tabviewform">
	<input type="hidden" value="${activetab}" name="currentTab" id="currentTab">
</form>


<ul class="nav nav-tabs">	
	<li class="tab" id="investorSettings"><a	href="${investorSettingsURL}"><liferay-ui:message key='investor' /> <liferay-ui:message key='settings' /></a></li>
	<li class="tab" id="sellerSetings"><a	href="${sellerSetingsURL}"><liferay-ui:message key='seller' /> <liferay-ui:message key='settings' /> </a></li>
	<li class="tab" id="scfSettings"><a	href="${scfSettingsURL}"><liferay-ui:message key='scf.company' /> <liferay-ui:message key='settings' /></a></li>
	<li class="tab" id="generalSettings"><a href="${generalSettingsURL}"><liferay-ui:message key='general' /> <liferay-ui:message key='settings' /></a></li>
</ul>