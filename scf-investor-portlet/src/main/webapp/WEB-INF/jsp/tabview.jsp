<%@include file="init.jsp"%>

<portlet:renderURL var="investorProtfoliosURL">
	<portlet:param name="render" value="investorProtfolios" />
</portlet:renderURL>

<portlet:renderURL var="investorbalanceURL">
	<portlet:param name="render" value="investorBalance" />
</portlet:renderURL>

<form id="tabviewform">
	<input type="hidden" value="${activetab}" name="currentTab" id="currentTab">
</form>

<ul class="nav nav-tabs">
	
<li class="tab" id="investorProtfoliosList"><a href="${investorProtfoliosURL}">Investor Protfolios </a></li>
<li class="tab" id="invbalList"><a
			href="${investorbalanceURL}">Investor Balance Sheet</a></li>
			
</ul>