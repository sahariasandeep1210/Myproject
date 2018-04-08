<%@include file="init.jsp"%>
<%@ taglib uri="http://whitehall.com/jsp/tld/p" prefix="p"%>

<portlet:renderURL var="createURL">
	<portlet:param name="render" value="createCompany" />
</portlet:renderURL>

<portlet:renderURL var="defaultRenderURL" />


<%@include file="suppliertabview.jsp"%>

<div class="tab-content">
		<div id="scf-tab" class="tab-pane">
					 <div class="title-container clearfix">
					 	<div class="main-title">Seller Information</div>
					 </div>
		</div>
		<div id="myTogglerd" class="customToggler">
				  <c:if test="${userType eq 'SCF Company Admin'  && cmpType ne 'Seller'}">
									<%@include file="sellerlist.jsp"%>	
				   </c:if>
			</div>

</div>
