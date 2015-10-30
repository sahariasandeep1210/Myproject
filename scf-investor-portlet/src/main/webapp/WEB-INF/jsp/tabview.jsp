<%@include file="init.jsp"%>

<portlet:renderURL var="invoiceDocumentsURL">
	<portlet:param name="render" value="invoiceDocuments" />
</portlet:renderURL>

<portlet:renderURL var="invoicesURL">
</portlet:renderURL>
<form id="tabviewform">
<input type="hidden" value="${activetab}" name="currentTab" id="currentTab">

</form>
<%-- <div class="navbar" id="invoicenavbar">
	<div class="navitem">
		<div class="container">
			   <a class="btn btn-navbar" data-toggle="collapse" data-target=".unique">
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    
                  </a> 
			<!--  <a class="brand" href="#">Title</a>  -->
			 <div class="nav-collapse collapse navbar-responsive-collapse unique"> 
				<ul class="nav">
					<li id="invoiceList"><a href="${invoicesURL}" style="font-weight: bolder!important; text-shadow: none!important;color: #003d59!important;">Invoices</a></li>
					<li id="invoicedocList"><a href="${invoiceDocumentsURL}" style="font-weight: bolder!important; text-shadow: none!important;color: #003d59!important;">Invoice Documents</a></li>
				</ul>
			 </div> 
		</div>
	</div>
</div> --%>

<%-- <liferay-ui:tabs names="Invois1,Invoce1 Documets1" refresh="true"  url0="${invoicesURL}"  url1="${invoiceDocumentsURL}"> 	

</liferay-ui:tabs> --%>

<%-- <liferay-ui:tabs names="tab1,tab2,tab3" refresh="false" tabsValues="tab1,tab2,tab3">
    <liferay-ui:section>
        Text for Tab 1.
    </liferay-ui:section>
    <liferay-ui:section>
        Text for Tab 2.
    </liferay-ui:section>
    <liferay-ui:section>
        Text for Tab 3.
    </liferay-ui:section>
</liferay-ui:tabs> --%>

<ul class="nav nav-tabs">
	<li class="tab" id="invoiceList"><a href="${invoicesURL}">Invoices
	</a></li>
	<c:if test="${userType eq 'SCF Admin' || userType eq 'Admin'}">
		<li class="tab" id="invoicedocList"><a
			href="${invoiceDocumentsURL}">Invoice Documents </a></li>
	</c:if>
</ul>