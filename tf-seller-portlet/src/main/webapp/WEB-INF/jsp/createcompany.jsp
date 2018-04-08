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

<div class="" id="errorMsg"></div>

	<c:choose>
		<c:when test="${companyModel.id !=null && companyModel.id !=0}">
			<div id="myToggler" class="customToggler">
				  <c:if test="${userType eq 'SCF Company Admin'  && cmpType ne 'Seller'}">
				
							<div class="toggleHeader toggler-header-expanded">
							<div class="toggle-title pull-left">Seller Information</div>
							<div class="toggle-icon-container text-right">
								<i class="icomoon-accordian-arrow-down"></i>
							</div>
						</div>
						<div class="toggleContent toggler-header-expanded">
									<%@include file="sellerlist.jsp"%>	
						</div>
				 
				   </c:if>
			</div>
		</c:when>
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

