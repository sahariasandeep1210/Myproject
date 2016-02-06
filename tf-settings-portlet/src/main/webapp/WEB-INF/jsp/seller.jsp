<%@include file="init.jsp"%>
<%@include file="tabview.jsp"%>
<portlet:actionURL var="saveSellerSettings">
	<portlet:param name="action" value="saveSellerSettings" />
</portlet:actionURL>
<div class="container-fluid">
	<div class="row-fluid">
		<div class="span12">
			<div class="span4">
				<h4>
					<liferay-ui:message key='manage.seller.information' />
				</h4>
			</div>

		</div>
	</div>

	<form:form method="post" commandName="sellerDTO"
		class="form-horizontal" name="settingForm">
		<input type="hidden" value="${saveSellerSettings}" id="saveURL" />
		<input type="hidden" value="${sellerDTO.id}" name="id" />
	
	
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
				<form:input path="sellerTransFee" name="" cssClass="span6"  />
			</div>
		</div>
		<div class="row-fluid">
			<div class="span6">
				<label class="span6">Seller Finance Fee</label>
				<form:input path="sellerFinFee" name="" cssClass="span6"  />
			</div>
		</div>
		
		
		<div class="row-fluid">
			<div class="span6">
				<input type="button" value="Update Settings" id="updateSettings" class="btn btn-primary" />
			</div>
		</div>
		
		
		<br>
		
			
		<div class="table-responsive">
			<table class="table  tablesorter table-bordered" id="tradeListTable">
				<thead>
					<tr>
					    <th>Seller Name</th>
						<th>Opening Date</th>
						<th>Modify Date</th>
						<th>Seller Transaction Fee</th>
						<th>Seller Finance Fee</th>	
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${sellerSettings}" var="sellerSetting">
						<tr>
							<td>${sellerSetting.company.name} </td>
							<td><fmt:formatDate pattern="dd-MM-yyyy" value="${sellerSetting.createDate}" /></td>
							<td><fmt:formatDate pattern="dd-MM-yyyy" value="${sellerSetting.updateDate}" /></td>
							<td>${sellerSetting.sellerTransFee}</td>
							<td>${company.sellerFinFee}</td>
						</tr>
					</c:forEach>
				</tbody>
		  </table>
	    </div>
	</form:form>
</div>