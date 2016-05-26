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
  		
		<div class="row-fluid">
			<div class="span3">
				<div class="control-group">
					<div class="input-append">
						<input class="field" id="search" name="search" placeholder="Search" type="text" value="">
						<span class="add-on"><i class="icomoon-search"></i></span>
					</div>
				</div>
			</div>
		</div>
		
		<div class="customTableContainer mb15">
			<table class="table label-value">
				<tr>
					<td><b>Supplier Name</b></td>
					<td></td>
					<td><b>SCF Company Name</b></td>
					<td>MORRISON LIMITED</td>
				</tr>
				<tr>
					<td><b>TRADE VALUE</b></td>
					<td>80000</td>
					<td><b>Opening Date</b></td>
					<td>28-04-2016</td>
				</tr>
				<tr>
					<td><b>Seller Fixed Charges</b></td>
					<td>25.00</td>
					<td><b>Maturity Date</b></td>
					<td>14-06-2016</td>
				</tr>
				<tr>
					<td><b>Seller Variable Charges</b></td>
					<td>984.00</td>
					<td><b>Supplier Payment Date</b></td>
					<td>29-04-2016</td>
				</tr>
			</table>
		</div>
		
  		<div class="customTableContainer">
		  	<table id="tablesorter-demo" class="tablesorter table">
				<thead>
					<tr>
						<th>Allotments</th>
						<th>BPS (Per Year)</th>
						<th>Duration</th>
						<th>Whitehall Profit Share</th>
						<th>Investor Fees (TOTAL)</th>
						<th>Allotment Date</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td class="blue_normal">80000.00</td>
						<td>400</td>
						<td>41</td>
						<td class="green_normal">28.75</td>
						<td class="blue_normal">330.70</td>
						<td>29-04-2016</td>
					</tr>
				</tbody>
			</table>
		  </div>
		   
		  
		  <div class="title-container noBorder clearfix mt20">
			<div class="main-title">INVOICES WITHIN TRADE</div>
			<div class="btn-wrapper">
				<button class="btn btnBgGreenSm" type="button"> Export </button>
			</div>
		  </div>
		 
		  <div class="customTableContainer">
		  	<table id="tablesorter-demo2" class="tablesorter table">
				<thead>
					<tr>
						<th>Invoice Number</th>
						<th>Seller Company</th>
						<th>Date</th>
						<th>Amount</th>
						<th>Duration</th>
						<th>Invoice Company</th>
						<th>Finance Date</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>1001</td>
						<td>TROPICANA CARE LTD.</td>
						<td>01-01-2016</td>
						<td class="blue_normal">80000</td>
						<td>41</td>
						<td>MORRISON LIMITED</td>
						<td>29-04-2016</td>
					</tr>
				</tbody>
			</table>
		  </div>
		   
		  
		  <div class="actionContainer noBorder text-left">
			<button class="btn btnBgBuSm" type="button"> GO BACK </button>
		  </div>
  	</div>
</div>

<aui:script>
$(function() {		
	$("#tablesorter-demo").tablesorter();
	$("#tablesorter-demo2").tablesorter();
});	
</aui:script>