
<%@ include file="/html/taglib/init.jsp" %>

<%
String key = (String)request.getAttribute("liferay-ui:error:key");
String message = (String)request.getAttribute("liferay-ui:error:message");
boolean translateMessage = GetterUtil.getBoolean((String)request.getAttribute("liferay-ui:error:translateMessage"));
String rowBreak = (String)request.getAttribute("liferay-ui:error:rowBreak");
%>

<c:choose>
	<c:when test="<%= (key != null) && Validator.isNull(message) %>">
		<c:if test="<%= SessionErrors.contains(portletRequest, key) %>">
			</div>

			<%= rowBreak %>
		</c:if>
	</c:when>
	<c:when test="<%= key == null %>">
		<c:if test="<%= !SessionErrors.isEmpty(portletRequest) %>">
			<!-- Commenting below code snippet to remove default error message from each portlet -->
			<!-- <div class="alert alert-error">
				<liferay-ui:message key="your-request-failed-to-complete" />
			</div> -->

			<%= rowBreak %>
		</c:if>
	</c:when>
	<c:otherwise>
		<c:if test="<%= SessionErrors.contains(portletRequest, key) %>">
			<div class="alert alert-error">

			<c:choose>
				<c:when test="<%= translateMessage %>">
					<%= LanguageUtil.get(pageContext, message) %>
				</c:when>
				<c:otherwise>
					<%= message %>
				</c:otherwise>
			</c:choose>

			</div>

			<%= rowBreak %>
		</c:if>
	</c:otherwise>
</c:choose>