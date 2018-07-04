<%@include file="init.jsp"%>

<portlet:renderURL var="invoiceDocumentsURL">
	<portlet:param name="render" value="invoiceDocuments" />
</portlet:renderURL>
<portlet:renderURL var="invoiceNotTradedURL">
	<portlet:param name="render" value="invoiceNotTraded" />
</portlet:renderURL>

<portlet:renderURL var="invoicesURL">
</portlet:renderURL>
<form id="tabviewform">
<input type="hidden" value="${activetab}" name="currentTab" id="currentTab">

</form>


<ul class="nav nav-tabs">
	<li class="tab" id="invoiceList"><a href="${invoicesURL}">Invoices
	</a></li>
	<c:if test="${userType eq 'SCF Company Admin' || userType eq 'Admin'}">
		<li class="tab" id="invoicedocList"><a href="${invoiceDocumentsURL}">Invoice Documents </a></li>
		
		
	</c:if>
	<c:if test="${userType eq 'Admin'}">
	<li class="tab" id="invoiceNotTradedList"><a href="${invoiceNotTradedURL}" >Invoice Not Traded  </a></li>
	</c:if>
</ul>


