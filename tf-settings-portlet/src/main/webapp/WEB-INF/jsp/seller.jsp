<%@include file="init.jsp"%>
<%@include file="tabview.jsp"%>
<portlet:actionURL var="saveSellerSettings">
	<portlet:param name="action" value="saveSellerSettings" />
</portlet:actionURL>

<portlet:resourceURL  var="settingURL"></portlet:resourceURL>

<div class="tab-content">
	
	<form:form method="post" commandName="sellerDTO"
		class="" name="settingForm" id="sellerSetting">
		<input type="hidden" value="${saveSellerSettings}" id="saveURL" />
		<input type="hidden" value="${sellerDTO.id}" name="id" />
 		
     <input type="hidden" id="settingURL" name="settingURL" value="${settingURL}"/>
     
     <div class="customWell filter-container">
		  	<div class="row-fluid">
				<div class="span3 spanSm6">
					<div class="control-group">
						<label class="control-label">Supplier</label>
						<select id="sellerCompany" name="sellerCompany"  class="aui-field-select">
							<option value="">---Select---</option>
							<c:forEach var="company" items="${companyList}" >
								<option value="${company.id}"  <c:if test="${ company.id eq sellerCompany}">selected="selected" </c:if>>${company.name}</option>
							</c:forEach>			
						</select>
					</div>
				</div>

				<div class="span3 spanSm6 mtXs10">
		  			<div class="control-group">
		  				<label class="control-label">Seller Transaction Fee</label>
		  				<form:input path="sellerTransFee" cssClass="field" id="transaction" />
					</div>
		  		</div>
		  		
		  		<div class="span3 spanSm6 mtSm10 mtXs10">
				  	<div class="control-group">
							<label class="control-label">Seller Finance Fee</label>
							 <form:input path="sellerFinFee" cssClass="field" id="finance"/>
					</div>
		  		</div>
		  		
		  		<div class="span3 spanSm6 mtSm10 mtXs10">
		  				<div class="actionContainer noBorder text-left">
						<input type="button" value="Update Settings" id="updateSettings" class="btnBgBuSm" />
					</div>
		  		</div>
		  	</div>		 
	</div>

       <%-- <div class="row-fluid">
          <div class="span6">
              <label class="span6">Seller Company:</label>
			<select id="sellerCompany" name="sellerCompany"  placeholder="Seller Company">
				<option value="">---Select---</option>
				<c:forEach var="company" items="${companyList}">
					<option value="${company.id}"  <c:if test="${ company.id eq sellerCompany}">selected="selected" </c:if>>${company.name}</option>
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
		
		<br> --%>
		
		<%-- <div class="row-fluid">
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
						<a href="javascript:;" style="color: #295780; font-weight: bold;" id="exportSellers"> Export</a>
					</h5>
				</div>
			</div>
	</div> --%>
		
			
		<div class="customTableContainer">
			<table class="table  tablesorter table-bordered" id="settingListTable">
				<thead>
					<tr>
					    <th>Seller Name</th>
					    <th>SCF Company</th>
						<th>Opening Date</th>
						<th>Modify Date</th>
						<th>Seller Transaction Fee</th>
						<th>Seller Finance Fee</th>	
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${sellerSettings}" var="sellerSetting">
						<tr>
							<td>${sellerSetting.company} </td>
							<td>${sellerSetting.investorCompany} </td>
							<td class="text-center"><fmt:formatDate pattern="dd-MM-yyyy" value="${sellerSetting.createDate}" /></td>
							<td class="text-center"><fmt:formatDate pattern="dd-MM-yyyy" value="${sellerSetting.updateDate}" /></td>
							<td class="text-right"><fmt:formatNumber pattern="#,###.00" value="${sellerSetting.sellerTransFee}" /></td>
							<td class="text-right"><fmt:formatNumber pattern="#,###.00" value="${sellerSetting.sellerFinFee}" /></td>
						</tr>
					</c:forEach>
				</tbody>
		  </table>
	    </div>
	</form:form>
</div>