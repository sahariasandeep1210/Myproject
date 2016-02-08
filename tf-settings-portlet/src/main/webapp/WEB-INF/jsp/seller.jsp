<%@include file="init.jsp"%>
<%@include file="tabview.jsp"%>
<portlet:actionURL var="saveSellerSettings">
	<portlet:param name="action" value="saveSellerSettings" />
</portlet:actionURL>

<portlet:resourceURL  var="settingURL"></portlet:resourceURL>

<div class="container-fluid">
	<div class="row-fluid">
		<div class="span6">
			<div class="span12">
				<h4>
					<liferay-ui:message key='manage.seller.information' />
				</h4>
			</div>

		</div>
		<div class="span6">
				<div class="span12">
					<h5 style="float: right !important;">
						<a href="#" style="color: #295780; font-weight: bold;"> Export</a>
					</h5>
				</div>
			</div>
	</div>
	<%-- <div class="row-fluid">
		<div class="span12 borderdiv">
			<div class="span12">
				<h6>
					<liferay-ui:message key='manage.seller.message' />
				</h6>
			</div>

		</div>
	</div> --%>
	<form:form method="post" commandName="sellerDTO"
		class="form-horizontal" name="settingForm">
		<input type="hidden" value="${saveSellerSettings}" id="saveURL" />
		<input type="hidden" value="${sellerDTO.id}" name="id" />
		
		<div class="table-responsive">
			<table class="table  tablesorter table-bordered" id="tradeListTable">
				<thead>
					<tr>
					     <th>Seller Name</th>
						 <th>Seller Transaction Fee</th>
						<th>Seller Finance Fee</th>	
						<th>Opening Date</th>
						<th>Modify Date</th> 
					</tr>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${fn:length(sellerList) gt 0}">
			
			
			
							<c:forEach var="innerMap" items="${mainSellerList}">
							<li>{$innerMap}</li>
							<tr>
							    <c:forEach var="obj123" items="${innerMap}">
       								 <td> ${obj123.value}></td>
    							</c:forEach>
    						</tr>
						</c:forEach>
							
								
        							<td>${sellerListItem[0]}</td>
        							<td>${sellerListItem[1]}</td>
        							<td>${sellerListItem[2]}</td>
        							<td>${sellerListItem[3]}</td>
        							<td>${sellerListItem[4]}</td>
        
                                    <%-- <td>${name}</td>
 								     <td>${transFee}</td>
									<td>${finFee}</td>
									<td><fmt:formatDate pattern="dd-MM-yyyy"
											value="${seller.createDate}" /></td>
									<td><fmt:formatDate pattern="dd-MM-yyyy"
											value="${seller.updateDate}" /></td> --%>
					</c:when>
						<c:otherwise>
							<tr>
								<td colspan="9" align="center">No records found!</td>
							</tr>
						</c:otherwise>
					</c:choose>
				</tbody>
			
		  </table>
	    </div>
       <input type="hidden" id="settingURL" name="settingURL" value="${settingURL}"/>

       <div class="row-fluid">
          <div class="span6">
              <label class="span6">Seller Company:</label>
			<select id="sellerCompany" name="sellerCompany"  placeholder="Seller Company">
				<option value="">---Select---</option>
				<c:forEach var="company" items="${companyList}">
					<option value="${company.id}">${company.name}</option>
				</c:forEach>			
			</select>
           </div>
       </div>
       
		<div class="row-fluid">
			<div class="span6">
				<label class="span6">Seller Transaction Fee</label>
				   <form:input path="sellerTransFee" cssClass="span6" id="transaction" />
				
                   
			</div>
		</div>
		<div class="row-fluid">
			<div class="span6">
				<label class="span6">Seller Finance Fee</label>
				   <form:input path="sellerFinFee" cssClass="span6" id="finance"/>
			</div>
		</div>
		<div class="row-fluid">
			<div class="span6">
				<input type="button" value="Update Settings" id="updateSettings" class="btn btn-primary" />
			</div>
		</div>
	</form:form>
</div>