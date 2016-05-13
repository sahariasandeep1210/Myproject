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

<div id="tradeTab">
  <ul class="nav nav-tabs">
	<li class="active"><a href="#scf-tab">SCF TRADE</a></li>
	<li><a href="#history-tab">TRADE HISTORY</a></li>
  </ul>
	<div class="tab-content">
		<div id="scf-tab" class="tab-pane">
		  <div class="title-container clearfix">
		  	
		  		<div class="main-title">MANAGE TRADES</div>
		  	
		  	<div class="btn-wrapper">
		  			<aui:button cssClass="btnBrGrSm btnIconSm filter-btn" icon="icomoon-filter"></aui:button>
		  			<aui:button cssClass="btnBgGreenSm" value="Export"></aui:button>
		  	</div>
		  </div>
		  
		  
		  
		  <div class="customWell filter-container">
		  	<div class="row-fluid">
		  		<div class="span3 spanSm6">
		  			<aui:input name="search" label="" placeholder="Search" suffix="<i class='icomoon-search'></i>"></aui:input>
		  		</div>
		  		
		  		<div class="span3 spanSm6 mtXs10">
		  			<aui:select label="" name="selectionStyle">
						<aui:option selected="true" value="">Select Date</aui:option>
						<aui:option selected="" value="dynamic">Option1</aui:option>
						<aui:option selected="" value="manual">Option2</aui:option>
					</aui:select>
		  		</div>
		  		
		  		<div class="span3 spanSm6 mtSm10 mtXs10">
		  			<aui:input name="startDate" label="" placeholder="mm/dd/yyyy" suffix="<i class='icomoon-calendar'></i>"></aui:input>
		  		</div>
		  		
		  		<div class="span3 spanSm6 mtSm10 mtXs10">
		  			<aui:input name="endDate" label="" placeholder="mm/dd/yyyy" suffix="<i class='icomoon-calendar'></i>"></aui:input>
		  		</div>
		  	</div>
		  	<div class="row-fluid">
		  		<div class="span12">
		  			<div class="actionContainer noBorder text-left">
		  				<aui:button cssClass="btnBgBuSm" value="Search"></aui:button>
		  			</div>
		  			
		  		</div>
		  	</div>
		  </div>
		  <div class="customTableContainer">
		  	<table id="tablesorter-demo" class="tablesorter table">
				<thead>
					<tr>
						<th width="20px"></th>
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
					<tr class="highlight">
						<td><aui:input name="tableRadio" type="radio" value="test" label=""></aui:input></td>
						<td><a href="#">TES1603</a></td>
						<td><b>TESCO</b></td>
						<td class="blue_bold">110,000</td>
						<td class="green_bold">420</td>
						<td>1,277.78</td>
						<td>102.31</td>
						<td>1,125.46</td>
						<td><b>2,159</b></td>
					</tr>
					<tr>
						<td><aui:input name="tableRadio" type="radio" value="test" label=""></aui:input></td>
						<td><a href="#">TES1603</a></td>
						<td><b>TESCO</b></td>
						<td class="blue_normal">110,000</td>
						<td class="green_bold">420</td>
						<td>1,277.78</td>
						<td>102.31</td>
						<td>1,125.46</td>
						<td>2,159</td>
					</tr>
					<tr>
						<td><aui:input name="tableRadio" type="radio" value="test" label=""></aui:input></td>
						<td><a href="#">TES1603</a></td>
						<td><b>TESCO</b></td>
						<td class="blue_bold">110,000</td>
						<td class="green_normal">420</td>
						<td>1,277.78</td>
						<td>102.31</td>
						<td>1,125.46</td>
						<td><b>2,159</b></td>
					</tr>
				</tbody>
			</table>
		  </div>
		  
		  <div class="lfr-pagination">
			  	<div id="pagination" class="pagination pagination-centered">
				  <ul class="pagination-content">
				    <li><a href="#">&laquo;</a></li>
				    <li><a href="#">1</a></li>
				    <li><a href="#">2</a></li>
				    <li><a href="#">3</a></li>
				    <li><a href="#">&raquo;</a></li>
				  </ul>
				</div>
				
				<div class="lfr-pagination-controls">
					<div class="btn-group">
					  <a class="btn btn-default dropdown-toggle" role="button" data-toggle="dropdown" href="#">5 items per page <i class="caret"></i></a>
					  <ul id="menu1" class="dropdown-menu" role="menu" aria-labelledby="drop4">
		                  <li role="presentation"><a role="menuitem" href="#">5 items per page</a></li>
		                  <li role="presentation"><a role="menuitem" href="#">10 items per page</a></li>
		                  <li role="presentation"><a role="menuitem" href="#">15 items per page</a></li>
		                </ul>
					</div>
					
					<small class="search-results">Showing 1 - 20 of 22 Results.</small>
					
					
				</div>
		  </div>
		  
		</div>
		<div id="history-tab">
		  <p>Lorem ipsum dolor sit amet</p>
		</div>
	</div>
</div>

<aui:script>
AUI().ready(function() {
	AUI().use('aui-tabview',function(A) {
		new A.TabView({
			srcNode: '#tradeTab'
		  }
		).render();
	});
	
	AUI().use('aui-datepicker', function(A) {
		new A.DatePicker({
			trigger : 'input#<portlet:namespace/>startDate',
			mask: '%d/%m/%Y',
			popover : {
				zIndex : 1011,
				cssClass: 'popover-default datePicker-default'
			},
			on : {
				selectionChange : function(event) {
					console.log(event.newSelection)
				}
			}
		});
	});
	
	AUI().use('aui-datepicker', function(A) {
		new A.DatePicker({
			trigger : 'input#<portlet:namespace/>endDate',
			mask: '%d/%m/%Y',
			popover : {
				zIndex : 1011,
				cssClass: 'popover-default datePicker-default'
			},
			on : {
				selectionChange : function(event) {
					console.log(event.newSelection)
				}
			}
		});
	});
});

$(function() {		
	$("#tablesorter-demo").tablesorter({
		 headers: {
			 0:{
				 sorter: false
			 }
		 }
	});
});	
</aui:script>