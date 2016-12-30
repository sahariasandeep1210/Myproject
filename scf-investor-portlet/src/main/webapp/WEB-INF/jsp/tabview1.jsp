<%@page import="com.tf.persistance.util.Constants"%>
<%@include file="init.jsp"%>

<portlet:renderURL var="cashReportURL">
	<portlet:param name="report" value="casReport" />
</portlet:renderURL>

<portlet:renderURL var="investorProtURL">
	<portlet:param name="Prot" value="invesProt" />
</portlet:renderURL>


<form id="tabviewform">
	<input type="hidden" value="${activetab}" name="currentTab" id="currentTab">
</form>

<ul class="nav nav-tabs">
 <li class="tab" id="invesProtList"><a href="${investorProtURL}">Investor Portfolios </a></li>
 <li class="tab" id="casList"><a href="${cashReportURL}">Cash Report</a></li>	
</ul>