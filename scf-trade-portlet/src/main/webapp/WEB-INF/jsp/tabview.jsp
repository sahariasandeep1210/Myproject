<%@include file="init.jsp"%>

<portlet:renderURL var="tradeHistoryURL">
	<portlet:param name="render" value="tradeHistory" />
</portlet:renderURL>

<portlet:renderURL var="tradesURL">
</portlet:renderURL>

<form id="tabviewform">
<input type="hidden" value="${activetab}" name="currentTab" id="currentTab">
</form>


<ul class="nav nav-tabs">
	<li class="tab" id="scftradesTab"><a href="${tradesURL}">SCF TRADE
	</a></li>
	<c:if test="${userType eq 'Admin'}">
		<li class="tab" id="tradehis"><a
			href="${tradeHistoryURL}">TRADE HISTORY </a></li>
	</c:if>
</ul>