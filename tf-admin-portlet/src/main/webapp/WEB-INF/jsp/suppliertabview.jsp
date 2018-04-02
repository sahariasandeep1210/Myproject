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

<c:if test="${userType != 'Admin'}"> 
  <c:set var = "myVisible" scope = "session" value = "My"/>
  </c:if>
<ul class="nav nav-tabs">
	<li class="tab" id="companyList"><a href="${defaultRenderURL}">${myVisible } Company
	</a></li>
	<c:if test="${userType eq 'SCF Company Admin' || userType eq 'Admin'}">
		<li class="tab" id="supplierdocList"><a
			href="${supplierDocumentsURL}">Supplier Documents </a></li>
	</c:if>
</ul>


