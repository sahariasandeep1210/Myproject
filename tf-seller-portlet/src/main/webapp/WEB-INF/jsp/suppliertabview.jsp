<%@include file="init.jsp"%>

<portlet:renderURL var="supplierDocumentsURL">
	<portlet:param name="render" value="supplierDocuments" />
</portlet:renderURL>

<portlet:renderURL var="defaultRenderURL" />

<portlet:renderURL var="supplierURL">
</portlet:renderURL>
<form id="tabviewform">
<input type="hidden" value="${activetab}" name="currentTab" id="currentTab">
<input type="hidden" name="defaultURL" 		id="defaultURL" 		value="${defaultRenderURL}" />
</form>


<ul class="nav nav-tabs">
	<li class="tab" id="companyList"><a href="${defaultRenderURL}">Company
	</a></li>
		<li class="tab" id="supplierdocList"><a
			href="${supplierDocumentsURL}">Supplier Documents </a></li>
</ul>


