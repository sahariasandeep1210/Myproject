<%@include file="init.jsp"%>
<portlet:renderURL var="investorProtfoliosURL">
	<portlet:param name="render" value="investorProtfolios" />
</portlet:renderURL>

<portlet:renderURL var="allInvestorListURL">
	<portlet:param name="render" value="allinvestorsbalance" />
</portlet:renderURL>

<portlet:renderURL var="investorbalanceURL">
	<portlet:param name="render" value="investorBalance" />
</portlet:renderURL>

<portlet:renderURL var="investorscfURL">
	<portlet:param name="render" value="investorSCFSummary" />
</portlet:renderURL> 

<portlet:renderURL var="investorShortfallURL">
	<portlet:param name="render" value="investorShortFall" />
</portlet:renderURL>



<form id="tabviewform">
	<input type="hidden" value="${activetab}" name = "currentTab"  id = "currentTab">
</form>
			
<ul class="nav nav-tabs">
	
<li class="tab" id="investorProtfoliosList"><a href="${investorProtfoliosURL}">Investor Portfolio </a></li>
<li class="tab" id="invbalList"><a href="${investorbalanceURL}">Investor Balance Sheet</a></li>
<c:if test="${userType eq 'Admin'}">
<li class="tab" id="investorshortfalltab"><a href="${investorShortfallURL}">SCF-Investor Shortfall</a></li>
 <li class="tab" id="allinvestorstab"><a href="${allInvestorListURL}">Investor-Cash Positions</a></li>
<li class="tab" id="investorscftab"><a href="${investorscfURL}">Investor-SCF Companies</a></li>
</c:if>
	 		
</ul>
