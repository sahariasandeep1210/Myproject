<%
/**
 * Copyright (c) 2000-present Liferay, Inc. All rights reserved.
 *
 * This library is free software; you can redistribute it and/or modify it under
 * the terms of the GNU Lesser General Public License as published by the Free
 * Software Foundation; either version 2.1 of the License, or (at your option)
 * any later version.
 *
 * This library is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
 * FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more
 * details.
 */
%>

<%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="portlet" %>
<%@ taglib uri="http://liferay.com/tld/aui"  prefix="aui"%>

<portlet:defineObjects />

<div class="panel panel-blue mt0">
  <div class="panel-heading">
    <h3 class="panel-title">TRADE INFORMATION</h3>
  </div>
  <div class="panel-body">
		<aui:form action="" method="post" name="fm" id="test" enctype="multipart/form-data">
			<div class="row-fluid">
				<div class="span12">
					<div class="title-container">
						<div class="main-title">
							MORRISON LIMITED
						</div>
					</div>
				</div>
			</div>
			<div class="row-fluid">
				<div class="span3 spanSm6">
					<aui:input name="" label="Duration" disabled="true" value="97" placeholder=""></aui:input>
				</div>
				<div class="span3 spanSm6">
					<aui:input name="" label="Closing Date" disabled="true" value="07/05/2016" placeholder=""></aui:input>
				</div>
				<div class="span3 spanSm6">
					<aui:input name="" label="Opening Date" disabled="true" value="03/24/2016" placeholder=""></aui:input>
				</div>
				<div class="span3 spanSm6">
					<aui:input name="" label="Investor Payment Date" disabled="true" value="03/24/2016" placeholder=""></aui:input>
				</div>
			</div>
			
			<div class="row-fluid">
				<div class="span3 spanSm6">
					<aui:input name="" label="Seller Payment Date" disabled="true" value="03/24/2016" placeholder=""></aui:input>
				</div>
				<div class="span3 spanSm6">
					<aui:input name="" label="Trade Amount" disabled="true" value="110000" placeholder=""></aui:input>
				</div>
				<div class="span3 spanSm6">
					<aui:input name="" label="Trade Notes" disabled="true" value="Finance requested by Supplier" placeholder=""></aui:input>
				</div>
				<div class="span3 spanSm6">
					<div id="sampleFileUpload" class="customFileUpload">
						<aui:input name="fileUploadBtn" cssClass="fileUploadManager" type="file"/>
						<aui:input disabled="true" cssClass="fakeFileUploader" name="fileUploadFakeBtn" label="Promisory Note" type="text" value="" placeholder="Upload File" suffix="BROWSE" ></aui:input>
					</div>
				</div>
			</div>
			
			<aui:field-wrapper name="roundingDetailsSection" label="Insurance Document"></aui:field-wrapper>
		        
		    
			<div class="row-fluid">
				<div class="span3">
					<aui:input name="Option-1" type="checkbox" label="Want to Insure?" checked="true"></aui:input>
				</div>
				<div class="span3">
					<div id="sampleFileUpload1" class="customFileUpload">
						<aui:input name="fileUploadBtn" cssClass="fileUploadManager" type="file"/>
						<aui:input disabled="true" cssClass="fakeFileUploader" name="fileUploadFakeBtn1" label="" type="text" value="" placeholder="Upload File" suffix="BROWSE" ></aui:input>
					</div>
				</div>
			</div>
			
		</aui:form> 
		
		<div id="myToggler" class="customToggler">
		  <div class="toggleHeader toggler-header-collapsed">
		  	<div class="toggle-title pull-left">Invoice within Trade</div>
		  	<div class="toggle-icon-container text-right">
		  		<i class="icomoon-accordian-arrow-down"></i>
		  	</div>
		  	
		  </div>
		  <div class="toggleContent toggler-content-collapsed">
		  	<div class="row-fluid">
		  		<div class="span12 text-right">
		  			<div class="actionContainer noBorder pt0">
		  				<aui:button cssClass="btnBgGreenSm" value="Export"></aui:button>
		  			</div>
		  			
		  		</div>
		  	</div>
		  	
		  	<div class="customTableContainer">
			  	<table id="tablesorter-demo" class="tablesorter table">
					<thead>
						<tr>
							<th>Trade#</th>
							<th>SCF Company</th>
							<th>Allotment</th>
							<th>BPS</th>
							<th>Profit</th>
							<th>Share</th>
							<th>Net Profit</th>
							<th>Fees</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>TES1603</td>
							<td><b>TESCO</b></td>
							<td class="blue_normal">110,000</td>
							<td>420</td>
							<td>1,277.78</td>
							<td>102.31</td>
							<td>1,125.46</td>
							<td><b>2,159</b></td>
						</tr>
						<tr>
							<td>TES1603</td>
							<td><b>TESCO</b></td>
							<td class="blue_normal">110,000</td>
							<td>420</td>
							<td>1,277.78</td>
							<td>102.31</td>
							<td>1,125.46</td>
							<td>2,159</td>
						</tr>
						<tr>
							<td>TES1603</td>
							<td><b>TESCO</b></td>
							<td class="blue_normal">110,000</td>
							<td>420</td>
							<td>1,277.78</td>
							<td>102.31</td>
							<td>1,125.46</td>
							<td>2,159</td>
						</tr>
					</tbody>
				</table>
			  </div>
		  </div>
		
		  
		
		</div>
		
		<div class="actionContainer noBorder text-left">
			<aui:button cssClass="btnBgBuSm" value="GO BACK"></aui:button>
		</div>

  </div>
</div>	

<aui:script>
AUI().ready(function() {
	fileUploadmanagerObj = new fileUploadmanager("#sampleFileUpload",function(obj){
		//file upload change event
	});
	
	fileUploadmanagerObj1 = new fileUploadmanager("#sampleFileUpload1",function(obj){
		//file upload change event
	});
	
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
});

$(function() {		
	$("#tablesorter-demo").tablesorter();
});	
</aui:script>