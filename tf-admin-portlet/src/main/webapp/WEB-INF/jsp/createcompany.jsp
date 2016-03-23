<%@include file="init.jsp"%>
<portlet:actionURL var="createCompanyURL">
	<portlet:param name="action" value="createCompany" />
</portlet:actionURL>

<portlet:actionURL var="regCompanyURL">
	<portlet:param name="action" value="registerCompany" />
</portlet:actionURL>

<portlet:renderURL var="createUserURL">
	<portlet:param name="render" value="createUser" />
</portlet:renderURL>

<portlet:actionURL var="deleteCompanyURL">
	<portlet:param name="action" value="deleteCompany" />
</portlet:actionURL>
<portlet:renderURL var="companyListURL">
</portlet:renderURL>

<portlet:renderURL var="defaultRender">
</portlet:renderURL>

<portlet:resourceURL id="fetchCompanyDetails" var="fetchCompanyDetails" ></portlet:resourceURL> 
<portlet:resourceURL id="fetchOfficers" var="fetchOfficers" ></portlet:resourceURL> 

<liferay-ui:error 	key="invoice.duplicate.error">
	<liferay-ui:message key="company.duplicate.registration.no"  arguments="${companyModel.regNumber}"></liferay-ui:message>
</liferay-ui:error> 

<liferay-ui:error key="default-error-message" 		message="default.error.message" /> 

<div class="alert alert-danger" id="errorMsg"><i class="icon-remove-sign icon-2"></i> </div>
<div class="container-fluid">
	<c:choose>

		<c:when test="${companyModel.id !=null && companyModel.id !=0}">
			<div class="accordion" id="accordion2">
				<div class="accordion-group">
					<div class="accordion-heading">
						<a class="accordion-toggle" data-toggle="collapse"
							data-parent="#accordion2" href="#collapseOne"> Company
							Information </a>
					</div>
					<div id="collapseOne" class="accordion-body collapse in">
						<div class="accordion-inner">
							<%@include file="createcompanyform.jsp"%>
						</div>
					</div>
				</div>
				<div class="accordion-group">
					<div class="accordion-heading">
						<a class="accordion-toggle" data-toggle="collapse"
							data-parent="#accordion2" href="#collapseTwo"> Users
							Information </a>
					</div>
					<div id="collapseTwo" class="accordion-body collapse">
						<div class="accordion-inner">
							<%@include file="userlist.jsp"%>
						</div>
					</div>
				</div>
				<div class="accordion-group">
					<div class="accordion-heading">
						<a class="accordion-toggle" data-toggle="collapse"
							data-parent="#accordion2" href="#collapseThree"> Officers
							Information </a>
					</div>
					<div id="collapseThree" class="accordion-body collapse">
						<div class="accordion-inner" id="officersDiv">
							<%@include file="officerslist.jsp"%>						
						</div>
					</div>
				</div>
				<c:if test="${userType eq 'SCF Company Admin'}">
				     <div class="accordion-group">
					<div class="accordion-heading">
						<a class="accordion-toggle" data-toggle="collapse"
							data-parent="#accordion2" href="#collapseFour"> Sellers
							Information </a>
					</div>
					<div id="collapseFour" class="accordion-body collapse">
						<div class="accordion-inner">
							<%@include file="sellerlist.jsp"%>						
						</div>
					</div>
				</div>
				</c:if>
			</div>
			
			<div class="row-fluid">
				<div class="span6">
					<input type="button" value="Go Back" class="btn btn-primary"
						data-url="${companyListURL}" id="cmpback" />
				</div>
			</div>
			
		</c:when>
		<c:otherwise>
			<%@include file="createcompanyform.jsp"%>
		</c:otherwise>
	</c:choose>


</div>

<div id="deleteCompany" title="Are you sure you want to delete?">
	<div class="message">
		Are you sure you want to delete this Company? 
		<br />
		Please remember all the information associated(Users,Trades,Invoices etc.) with company will also be deleted.
		<hr>Press 'Continue' to delete or 'Cancel' to go back
	</div>
</div>

<div id="myModal" class="modal  fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-header">
    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
    <h3 id="myModalLabel">Not Found!</h3>
  </div>
  <div class="modal-body">
    <p>Company details not found.Please enter manually.</p>
  </div>
  <div class="modal-footer">
    <button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
  </div>
</div>

