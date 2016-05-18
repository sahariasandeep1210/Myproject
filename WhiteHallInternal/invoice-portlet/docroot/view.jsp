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

<div id="invoiceTab">
	<ul class="nav nav-tabs">
		<li class="active"><a href="#invoice-tab">INVOICES</a></li>
		<li><a href="#invoice-doc-tab">INVOICE DOCUMENTS</a></li>
	</ul>
	<div class="tab-content">
		<div id="invoice-tab" class="tab-pane"></div>
		<div id="invoice-doc-tab" class="tab-pane">
		
			<div class="title-container clearfix">
		  	
		  		<div class="main-title">MANAGE INVOICE DOCUMENTS</div>
		  		
			</div>
			
			<div class="customTableContainer">
			  	<table id="tablesorter-demo" class="tablesorter table">
					<thead>
						<tr>
							<th>Name</th>
							<th>Uploaded By</th>
							<th>Upload Date</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><a class="normal-link" href="#">WhiteHallDec(1).xlsx</a></td>
							<td>gautamsec</td>
							<td>13-04-2016</td>
						</tr>
						<tr>
							<td><a class="normal-link" href="#">WhiteHallDec(1).xlsx</a></td>
							<td>gautamsec</td>
							<td>13-04-2016</td>
						</tr>
						<tr>
							<td><a class="normal-link" href="#">WhiteHallDec(1).xlsx</a></td>
							<td>gautamsec</td>
							<td>13-04-2016</td>
						</tr>
					</tbody>
				</table>
			  </div>
			  <div class="actionContainer pb0 text-left">
			  	<a href="#myModal" class="btn btnBgGreenSm"  data-toggle="modal" type="button" > UPLOAD INVOICE </a>
			  </div>
			  
		</div>
	</div>
	  
</div>

<div id="myModal" class="modal  fade customModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" style="display:none" aria-hidden="true">
  <div class="modal-header">
    <button type="button" class=" icomoon-close close" data-dismiss="modal" aria-hidden="true"></button>
    UPLOAD INVOICE
  </div>
  <div class="modal-body">
  	 <div class="row-fluid">
		<div class="span12">
			<div class="control-group">
				<label class="control-label" for="selectionStyle"> Select SCF Company *</label>
				<select class="aui-field-select" id="selectionStyle" name="selectionStyle">
					<option class="" selected="" value=""> Select</option>
					<option class="" value=""> Option1</option>
					<option class="" value=""> Option2</option>
				</select>
			</div>
		</div>
	</div>
	
	<div class="row-fluid">
		<div class="span12">	
			<div class="control-group">
				<label class="control-label" for="selectionStyle"> Select File Type *</label>
				<select class="aui-field-select" id="selectionStyle" name="selectionStyle">
					<option class="" selected="" value=""> Select</option>
					<option class="" value=""> Option1</option>
					<option class="" value=""> Option2</option>
				</select>
			</div>
		</div>
	</div>
	
	<div class="row-fluid">
		<div class="span12">
			<div id="sampleFileUpload" class="customFileUpload">
				<div class="control-group">
					<label class="control-label" for="fileUploadBtn"></label>
					<input class="field fileUploadManager" id="fileUploadBtn" name="fileUploadBtn" type="file" value="">
				</div>
				<div class="control-group">
					<div class="input-append">
						<input class="field disabled fakeFileUploader" disabled="" id="fileUploadFakeBtn1" name="fileUploadFakeBtn1" placeholder="Upload File" type="text" value="">
						<span class="add-on">BROWSE</span> 
					</div>
				</div>
			</div>
		</div>
	</div>
  </div>
  <div class="modal-footer">
    <button class="btn btnBrGrSm" data-dismiss="modal" aria-hidden="true">Close</button>
    <button class="btn btnBgGreenSm">UPLOAD INVOICE</button>
  </div>
</div>

<aui:script>
AUI().ready(function() {
	AUI().use('aui-tabview',function(A) {
		new A.TabView({
			srcNode: '#invoiceTab'
		  }
		).render();
	});
	
	fileUploadmanagerObj1 = new fileUploadmanager("#sampleFileUpload",function(obj){
		//file upload change event
	});
});

$(function() {
	$("#tablesorter-demo").tablesorter();
});
</aui:script>