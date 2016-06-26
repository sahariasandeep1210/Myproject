<%@include file="init.jsp"%>
<%@ taglib uri="http://whitehall.com/jsp/tld/p" prefix="p"%>
<portlet:actionURL var="taskApproveRejectURL">
	<portlet:param name="action" value="taskApproveReject" />
</portlet:actionURL>


 <script src="https://code.jquery.com/jquery-1.9.1.min.js"></script>
 
 	<form:form commandName="invoiceModel" method="post"	id="createInvoiceForm" name="createInvoiceForm"	 action="${taskApproveRejectURL}">
	<li class="dropdown notification-dropdown" id="testID">
					  <a href="#" class="dropdown-toggle-" data-toggle="dropdown">
						<span class="notification-img-container">
							<i class="icomoon-notification bigIcon notification-img" alt=""></i>
							<c:if test="${not empty count && count gt 0}">
							  <span class="badge notification-badge">${count}</span>
							</c:if>
						</span>
					  </a>
					  <ul class="dropdown-menu">
						<li>
							<div class="custom-dropdown-wrapper notification">
								<div class="custom-dropdown-container">
									<div class="custom-dropdown-header-container">
										<div class="clearfix">
											<a class="pull-left" href="#">Notifications</a>
											<!-- <a class="pull-right" href="#">Mark as read</a> -->
										</div>
									</div>
								</div>
								<div class="custom-dropdown-container">
								  <ul class="notification-list">
								<c:choose>
								  <c:when test="${not empty count && count gt 0}">
								  <c:forEach var="object" items="${sellerScfMappings}">
								  <%-- <form method="post" action="<%=taskApproveRejectURL%>"> --%>
								    <li class="notification-item">
										<div class="img-container">
											<img class="dropdown-img" src="$images_folder/dummy-prof-img.jpg" alt="" title="notification image">
										</div>
										<div class="info-container">
											<div class="notification-link-container">
												<a href="#" class="no-padding">Membership Requested.</a>
												<p class="time-info">${object.sellerCompany.name}</p>
												<p class="time-info">
													<input type="button" value="Approve" class="btn btn-primary approve_reject"	id="createTrade" data-id="${object.id}" />
													<input type="button" value="Reject" class="btn btn-primary approve_reject"	id="createTrade" data-id="${object.id}" />
												</p>
											</div>
										</div>
									</li>
									<!-- </form> -->
								  </c:forEach>
								  </c:when>
								  <c:otherwise>
								     <li class="notification-item">
										No Notification
									</li>
								  </c:otherwise>
								</c:choose>
								</ul>
								</div>
							</div>
						</li>
					  </ul>
					</li>
					
					</form:form>
<script>
$(document).ready(function() {
    $(".approve_reject").on("click",function(){
	   alert("came");
	  if($(this).val()=="Approve"){
		  taskApproveReject(true,$(this).data("id"));
	  }else{
		  taskApproveReject(false,$(this).data("id"));
	  }
   }); 
});

 function taskApproveReject(flag,id){
	alert("${taskApproveRejectURL}&id="+id+"&status="+flag);
	document.forms["createInvoiceForm"].submit();
	
} 
</script>
