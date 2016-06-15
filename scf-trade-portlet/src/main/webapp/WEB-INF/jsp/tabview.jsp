<%@include file="init.jsp"%>

<portlet:renderURL var="tradeHistoryURL">
	<portlet:param name="render" value="tradeHistory" />
</portlet:renderURL>

<portlet:actionURL var="traHistoryURL">
	<portlet:param name="trade" value="getTradeHistory" />
</portlet:actionURL>

<portlet:renderURL var="tradesURL">
</portlet:renderURL>

<form id="tabviewform">
     <input type="hidden" value="${activetab}" name="currentTab" id="currentTab">
</form>


<ul class="nav nav-tabs">
	<li  id="scftradesTab"><a href="${tradesURL}">SCF TRADE </a></li>
	<c:if test="${userType eq 'Admin' || userType eq 'WhiteHall Admin'}">
		<li  id="tradehis"><a href="${tradeHistoryURL}">TRADE HISTORY </a></li>
	</c:if>
</ul>