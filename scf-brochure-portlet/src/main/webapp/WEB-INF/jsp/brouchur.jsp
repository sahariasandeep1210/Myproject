<%@page import="com.liferay.portal.kernel.util.WebKeys"%>
<%@page import="com.liferay.portal.theme.ThemeDisplay"%>
<%@ include file="init.jsp"%>

<style type="text/css">

.btnBgBuSm {
    border: 0 none; color: white;background: #2a7bb2;padding: 8px 20px;font: normal 700 .85714em/1.33333em "Open Sans",sans-serif;
}
</style>

<portlet:resourceURL var="saveUserInfoUrl"
	id="saveInfo">
</portlet:resourceURL>

<portlet:resourceURL var="pdfBrochurDownloadUrl"
	id="pdfBrochurDownloadUrl">
	<portlet:param name="fileName" value="document.pdf" />
</portlet:resourceURL>
<%
ThemeDisplay themeDisplay = (ThemeDisplay) request.getAttribute(WebKeys.THEME_DISPLAY);
%>
<c:choose>
	<c:when test="<%=!(themeDisplay.isSignedIn())%>">
		<div class="tab-content" id="notDownload">
			<div class="row-fluid">
				<a id="broDownlodLink" href="#"
					style="position: fixed; top: 203px; z-index: 99999; right: 62px; color: whie; font-weight: 900; text-decoration: underline;">Download
					Brochure</a>
			</div>
		</div>
	</c:when>
	<c:otherwise>
		<div class="tab-content" id="notDownload">
			<div class="row-fluid">
				<a id="broDownlodLinkLogggedIn" href="${pdfBrochurDownloadUrl}"
					style="position: fixed; top: 203px; z-index: 99999; right: 62px; color: whie; font-weight: 900; text-decoration: underline;">Download
					Brochure</a>
			</div>
		</div>
	</c:otherwise>
</c:choose>

<input	type="hidden" name="currentPage"  id="pdfBrochurDownloadRes" value="${pdfBrochurDownloadUrl}" /> 
<input	type="hidden" name="currentPage"  id="savedInfo" value="0" />
<%-- <liferay-ui:success key="success" message="your information has been saved.please download now"></liferay-ui:success> --%>


<div id="brochurModal" style="z-index: 99999!important" class="modal  fade" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<form:form autocomplete="nope" id="saveBrouchurForm" type="GET" action="${saveUserInfoUrl}">
	<div id="popMessageDisplayId" style="margin-left:4px!important;color: green;font-weight: bold;top:10%!important" class="popMessageDisplay">Information has been saved,please click again to download</div>
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal"
				aria-hidden="true">×</button>
				<h4 id="myModalLabel">Please enter your information</h4>
		</div>
		<div class="modal-body">
		<div class="row-fluid">
			<div class="span4">
				<div class="control-group">
					<label class="control-label">First Name:<span class="requiredStar">*</span></label>
					<input type="text" autocomplete="nope"  name="fName" class="field" id="brFName"/>
				</div>

			</div>
			<div class="span4">
				<div class="control-group">
					<label class="control-label">Last Name:<span class="requiredStar">*</span></label>
					<input type="text" autocomplete="nope"  name="lName" class="field"  id="brLastName"/>
				</div>
			</div>
			<div class="span4">
				<div class="control-group">
					<label class="control-label">Email:<span class="requiredStar">*</span></label>
					<input type="text" autocomplete="nope"   name="email" class="field"  id="brEmail" />
				</div>
			</div>
		</div>
		<div class="row-fluid">
			<div class="span4">
				<div class="control-group">
					<label class="control-label">Phone Number:<span class="requiredStar">*</span></label>
					<input type="text" autocomplete="nope"  name="pNumber" class="field"  id="brPNumber" />
				</div>
			</div>
			<div class="span4">
				<div class="control-group">
					<label class="control-label">Company Name:<span class="requiredStar">*</span></label>
					<input type="text" autocomplete="nope"  name="cName" class="field"  id="brCName" />
				</div>
			</div>
		</div>
		
		</div>
		<div class="modal-footer">
			<button id="borucurSubmit" type="button" style="border: 0 none; color: white;background: #2a7bb2;padding: 8px 20px;font: normal 700 .85714em/1.33333em "Open Sans",sans-serif;" class="btn btnBgBuSm">Submit</button>
		</div>
	</form:form>
</div>
