<%@include file="init.jsp"%>

<portlet:actionURL var="taskApproveRejectURL">
	<portlet:param name="action" value="taskApproveReject" />
</portlet:actionURL>
<portlet:renderURL var="defaultRenderURL"></portlet:renderURL>

<div class="container-fluid">
<h4>My Task</h4>
	<form:form commandName="sellerListModel" method="post" action=""
		id="sellerList" autocomplete="off" name="sellerList">
        <br>
		<div class="table-responsive">
			<table class="table table-hover tablesorter table-bordered"
				id="reportListTable">
				<thead>
					<tr>
						<th>Name</th>
						<th>Registration No</th>
						<th>Established date</th>
						<th>Tel Number</th>
						<th>Action</th>
					</tr>
				</thead>
				<tbody>
					 <c:choose>
						<c:when test="${fn:length(sellerScfMappings) gt 0}">
							<c:forEach items="${sellerScfMappings}" var="seller"> 
					<tr>
						<td>${seller.sellerCompany.name}</td>
						<td>${seller.sellerCompany.regNumber}</td>
					   <td><fmt:formatDate pattern="dd-MM-yyyy" value="${seller.sellerCompany.dateestablished}"/></td>
					   <td>${seller.sellerCompany.telnumber}</td>
				       <td><input type="button" data-id="${seller.id}" data-toggle="modal" data-target="#myModal" value="Approve/Reject" id="approve-reject"
					           class="btn btn-primary" />
					   </td>
					</tr>
					 </c:forEach>
						 </c:when>
						 <c:otherwise> 
					<tr>
						<td colspan="7" align="center">There is no pending task!</td>
					</tr>
					 </c:otherwise>
				</c:choose> 
				</tbody>
			</table>
		</div>
	</form:form>
<div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
   <%--   onclick="window.location.href='${createURL}&companyID=${seller.sellerCompany.id}'" --%>
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Approve/Reject Comment</h4>
        </div>
        <div class="modal-body">
         <textarea class="commentBox" name="comment"  placeholder="Comment" ></textarea>
        </div>
        <div class="modal-footer" id="ApRjButton">
          <button type="button" class="btn btn-primary approve_reject" data-dismiss="modal">Approve</button>
          <button type="button" class="btn btn-primary approve_reject" data-dismiss="modal">Reject</button>
        </div>
      </div>
      
    </div>
  </div>
</div>
<script>

$(function() {
   $("#approve-reject").on("click",function(){
	   $("#ApRjButton").attr("data-id",$(this).data("id"));
   });
   $(".approve_reject").on("click",function(){
	  if($(this).text()=="Approve"){
		  taskApproveReject(true,$(this).parent().data("id"));
	  }else{
		  taskApproveReject(false,$(this).parent().data("id"));
	  }
   });
});

function taskApproveReject(flag,id){
	window.location.href="${taskApproveRejectURL}&id="+id+"&status="+flag+"&comment="+$(".commentBox").val();
}
</script>