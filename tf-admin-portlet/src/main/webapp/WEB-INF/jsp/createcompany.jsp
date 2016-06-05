<%@include file="init.jsp"%>
<portlet:actionURL var="createCompanyURL">
	<portlet:param name="action" value="createCompany" />
</portlet:actionURL>
<portlet:renderURL var="createURL">
	<portlet:param name="render" value="createCompany" />
</portlet:renderURL>
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
	<c:choose>

		<c:when test="${companyModel.id !=null && companyModel.id !=0}">
			<div id="myToggler" class="customToggler">
				<div class="toggleHeader toggler-header-collapsed">
					<div class="toggle-title pull-left">Company Information</div>
					<div class="toggle-icon-container text-right">
						<i class="icomoon-accordian-arrow-down"></i>
					</div>
				</div>
				<div class="toggleContent toggler-content-collapsed">
							<%@include file="createcompanyform.jsp"%>
				</div>
					<div class="toggleHeader toggler-header-collapsed">
					  	<div class="toggle-title pull-left">User Information</div>
					  	<div class="toggle-icon-container text-right">
					  		<i class="icomoon-accordian-arrow-down"></i>
					  	</div>
	  				</div>
						<div class="toggleContent toggler-content-collapsed">
							<%@include file="userlist.jsp"%>
						</div>
						<div class="toggleHeader toggler-header-collapsed">
						  	<div class="toggle-title pull-left">Offer Information</div>
						  	<div class="toggle-icon-container text-right">
						  		<i class="icomoon-accordian-arrow-down"></i>
						  	</div>
					  	</div>
						<div class="toggleContent toggler-content-collapsed" id="officersDiv">
							<%@include file="officerslist.jsp"%>						
						</div>
				<c:if test="${userType eq 'SCF Company Admin'  && cmpType ne 'Seller'}">
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
				<c:if test="${userType eq 'Seller Admin'}">
				     <div class="accordion-group">
					<div class="accordion-heading">
						<a class="accordion-toggle" data-toggle="collapse"
							data-parent="#accordion2" href="#collapseFour"> SCF Company
							Information </a>
					</div>
					<div id="collapseFour" class="accordion-body collapse">
						<div class="accordion-inner">
							<%@include file="scfcompanylist.jsp"%>						
						</div>
					</div>
				</div>
				</c:if>
			</div>
		<c:choose>
			<c:when test="${cmpType eq 'Seller' && userType eq 'SCF Company Admin' }">
			<div class="row-fluid">
				<div class="span6">
					<input type="button" value="Back" class="btn btn-primary"  data-url="${createURL}&companyID=${companyId}"	id="backBtn"  />

				</div>
			</div>
			</c:when>
			<c:otherwise>
					
			<div class="actionContainer text-left">
					<input type="button" value="Go Back" class="btn btnBgBuSm"
						data-url="${companyListURL}" id="cmpback" />
			</div>
			</c:otherwise>
		</c:choose>
		</c:when>
		<c:otherwise>  
			<div  class="customToggler">
				<div class="toggleContent toggler-content">
						<%@include file="createcompanyform.jsp"%>
				</div>
			</div>
		</c:otherwise>
	</c:choose>



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

<aui:script>
AUI().use('aui-toggler', function(A) {
    new A.TogglerDelegate({
        animated: true,
        closeAllOnExpand: true,
        container: '#myToggler',
        content: '.toggleContent',
        expanded: false,
        header: '.toggleHeader',
        transition: {
          duration: 0.2,
          easing: 'cubic-bezier(0, 0.1, 0, 1)'
        }
      });
});

</aui:script>

