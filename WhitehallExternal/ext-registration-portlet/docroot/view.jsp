<%@page import="com.liferay.portal.theme.ThemeDisplay"%>
<%
/**
 * Copyright (c) 2000-present Liferay, Inc. All rights reserved.
 *
 * This library is free software; you can redistribute it and/or modify it under
 * the terms of the GNU Lesser General Public License as published by the Free
 * Software Foundation; either version 2.1 of the License, or (at your option)
 * any later version.
 *
 * This library is distributed in the hope that it will be useful, but WITHOUTt
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
 * FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more
 * details.
 */
%>

<%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="portlet" %>
<%@ taglib prefix="liferay-theme" uri="http://liferay.com/tld/theme" %>

<portlet:defineObjects />
<liferay-theme:defineObjects />




<!-- START: Company information -->
<section class="home-section bussiness-application high-padding">
    <h2 class="text-center main-header blue full-visible" data-animation="flipInX">Bussiness application</h2>

    <div class="panel panel-default">
        <div class="panel-heading">
        	<div class="clearfix bs-wizard">      
			     <div class="bs-wizard-step active">
			       <div class="text-center bs-wizard-stepnum">1</div>
			       <div class="progress"><div class="progress-bar"></div></div>
			       <a href="#" class="bs-wizard-dot"></a>
			       <div class="bs-wizard-info text-center">Company Information</div>
			     </div>
			     
			     <div class="bs-wizard-step disabled">
			       <div class="text-center bs-wizard-stepnum">2</div>
			       <div class="progress"><div class="progress-bar"></div></div>
			       <a href="#" class="bs-wizard-dot"></a>
			       <div class="bs-wizard-info text-center">User Information</div>
			     </div>
			     
			     <div class="bs-wizard-step disabled">
			       <div class="text-center bs-wizard-stepnum">3</div>
			       <div class="progress"><div class="progress-bar"></div></div>
			       <a href="#" class="bs-wizard-dot"></a>
			       <div class="bs-wizard-info text-center">Confirmation</div>
			     </div>
			 </div>
        </div>

        <div class="panel-body common">
            <h4>Company Information</h4>

            <hr />
            <div class="row-fluid">
                <div class="span3 spanSm6">
                
                	<div class="control-group">
						<label class="control-label" for="comNo"> Company Number *</label>
						<input class="field " id="comNo" name="comNo" type="text" value="">
					</div>
                    
                </div>

                <div class="span6 spanSm6">
                    <div class="btncont"><a class="customButtonMedium btnBgGray btnsmall mb10" href="#">Find Company Detail</a></div>
                </div>
            </div>

            <div class="row-fluid">
                <div class="span3 spanSm6">
                    <div class="control-group">
						<label class="control-label" for="name"> Name *</label>
						<input class="field " id="name" placeholder="" name="name" type="text" value="">
					</div>
                </div>

                <div class="span3 spanSm6">
                	<div class="control-group">
						<label class="control-label" for="alName">Alternate Name *</label>
						<input class="field " id="alName" placeholder="" name="alName" type="text" value="">
					</div>
                </div>

                <div class="span3 spanSm6">
                    <div class="control-group">
						<label class="control-label" for="regNo">Registration Number *</label>
						<input class="field " id="regNo" placeholder="" name="regNo" type="text" value="">
					</div>
                </div>

                <div class="span3 spanSm6">
                    <div class="control-group">
						<label class="control-label" for="dateEst">Date Established *</label>
						<input class="field " id="dateEst" placeholder="" name="dateEst" type="text" value="">
					</div>
                </div>
            </div>


			<label class="labelfont">Address Information *</label>
            <div class="row-fluid">
                <div class="span3 spanSm6">
                    <div class="control-group">
						<input class="field " id="addLine1" placeholder="Address Line 1" name="addLine1" type="text" value="">
					</div>
                </div>

                <div class="span3 spanSm6">
                    <div class="control-group">
						<input class="field " id="addLine2" placeholder="Address Line 2" name="addLine2" type="text" value="">
					</div>
                </div>

                <div class="span3 spanSm6">
                	<div class="control-group">
						<input class="field " id="locality" placeholder="Locality" name="locality" type="text" value="">
					</div>
                </div>

                <div class="span3 spanSm6">
                	<div class="control-group">
						<input class="field " id="region" placeholder="Region" name="region" type="text" value="">
					</div>
                </div>
            </div>

            <div class="row-fluid">
                <div class="span3 spanSm6">
                    <div class="control-group">
						<input class="field " id="country" placeholder="Country" name="country" type="text" value="">
					</div>
                </div>

                <div class="span3 spanSm6">
                    <div class="control-group">
						<input class="field " id="postalCode" placeholder="Postal Code" name="postalCode" type="text" value="">
					</div>
                </div>
            </div>

            <div class="row-fluid">
                <div class="span3 spanSm6">
                    <div class="control-group">
						<label class="control-label" for="teleNo">Telephone No *</label>
						<input class="field " id="teleNo" placeholder="" name="teleNo" type="text" value="">
					</div>
                </div>

                <div class="span3 spanSm6">
                    <div class="control-group">
						<label class="control-label" for="url">URL *</label>
						<input class="field " id="url" placeholder="" name="url" type="text" value="">
					</div>
                </div>

                <div class="span3 spanSm6">
                	<div class="control-group">
                		<label class="control-label" for="selectionStyle">Organisation Type *</label>
						<select class="aui-field-select" id="organisationType" name="organisationType">
							<option class="" value="">Select</option>
							<option class="" value="op1">Option1</option>
							<option class="" value="op2">Option2</option>
						</select>
					</div>
                </div>

                <div class="span3 spanSm6">
                	<div class="control-group">
						<label class="control-label" for="comType">Company Type *</label>
						<input class="field " id="comType" placeholder="" name="comType" type="text" value="">
					</div>
                </div>
            </div>

            <hr />
            <div class="row-fluid">
                <div class="span3 spanSm6">
                    <div class="control-group">
						<label class="control-label" for="directors">Directors</label>
						<input class="field " id="directors" placeholder="" name="directors" type="text" value="">
					</div>
                </div>

                <div class="span3 spanSm6">
                    <div class="control-group">
						<label class="control-label" for="shareholders">Shareholders</label>
						<input class="field " id="shareholders" placeholder="" name="shareholders" type="text" value="">
					</div>
                </div>

                <div class="span3 spanSm6">
                    <div class="control-group">
						<label class="control-label" for="customers">Customers</label>
						<input class="field " id="customers" placeholder="" name="customers" type="text" value="">
					</div>
                </div>

                <div class="span3 spanSm6">
                    <div class="control-group">
						<label class="control-label" for="jurisdiction">Jurisdiction</label>
						<input class="field " id="jurisdiction" placeholder="" name="jurisdiction" type="text" value="">
					</div>
                </div>
            </div>

            <div class="row-fluid">
                <div class="span3 spanSm6">
                    <div class="control-group">
						<label class="control-label" for="bussType">Bussiness Type</label>
						<input class="field " id="bussType" placeholder="" name="bussType" type="text" value="">
					</div>
                </div>

                <div class="span3 spanSm6">
                    <div class="control-group">
						<label class="control-label" for="comRef">Company Reference</label>
						<input class="field " id="comRef" placeholder="" name="comRef" type="text" value="">
					</div>
                </div>
            </div>

            <div class="button-container">
            	<a class="customButtonMedium btnBgGreen btnfont" href="#">Continue</a>
            	<a class="customButtonMedium btnBgGray btnfont mlxxs0 mtXxs10" href="#">Go Back</a>
            </div>
        </div>
    </div>
</section>
<!-- END: Company information -->

<!-- START: User information -->
<section class="home-section bussiness-application high-padding">
    <h2 class="text-center main-header blue full-visible" data-animation="flipInX">Bussiness application</h2>

    <div class="panel panel-default">
        <div class="panel-heading">
                  <div class="clearfix bs-wizard">      
			     <div class="bs-wizard-step complete">
			       <div class="text-center bs-wizard-stepnum">1</div>
			       <div class="progress"><div class="progress-bar"></div></div>
			       <a href="#" class="bs-wizard-dot"></a>
			       <div class="bs-wizard-info text-center">Company Information</div>
			     </div>
			     
			     <div class="bs-wizard-step active">
			       <div class="text-center bs-wizard-stepnum">2</div>
			       <div class="progress"><div class="progress-bar"></div></div>
			       <a href="#" class="bs-wizard-dot"></a>
			       <div class="bs-wizard-info text-center">User Information</div>
			     </div>
			     
			     <div class="bs-wizard-step disabled">
			       <div class="text-center bs-wizard-stepnum">3</div>
			       <div class="progress"><div class="progress-bar"></div></div>
			       <a href="#" class="bs-wizard-dot"></a>
			       <div class="bs-wizard-info text-center">Confirmation</div>
			     </div>
			 </div>
        </div>

        <div class="panel-body common">
            <h4>User Information</h4>

            <hr />
            <div class="row-fluid">
                <div class="span3 spanSm6">
                    <div class="control-group">
						<label class="control-label" for="title">Title *</label>
						<input class="field " id="title" placeholder="" name="title" type="text" value="">
					</div>
                </div>

                <div class="span3 spanSm6">
                    <div class="control-group">
						<label class="control-label" for="username">Username *</label>
						<input class="field " id="username" placeholder="" name="username" type="text" value="">
					</div>
                </div>
            </div>

            <div class="row-fluid">
                <div class="span3 spanSm6">
                    <div class="control-group">
						<label class="control-label" for="fname">First Name *</label>
						<input class="field " id="fname" placeholder="" name="fname" type="text" value="">
					</div>
                </div>

                <div class="span3 spanSm6">
                    <div class="control-group">
						<label class="control-label" for="mname">Middle Name *</label>
						<input class="field " id="mname" placeholder="" name="mname" type="text" value="">
					</div>
                </div>

                <div class="span3 spanSm6">
                    <div class="control-group">
						<label class="control-label" for="lname">Last Name *</label>
						<input class="field " id="lname" placeholder="" name="lname" type="text" value="">
					</div>
                </div>

                <div class="span3 spanSm6">
                    <div class="control-group">
						<label class="control-label" for="lname">Email *</label>
						<input class="field " id="email" placeholder="" name="email" type="text" value="">
					</div>
                </div>
            </div>

            <div class="row-fluid">
                <div class="span3 spanSm6">
                    <div class="control-group">
						<label class="control-label" for="bussTeleNo">Telephone No *</label>
						<input class="field " id="bussTeleNo" placeholder="" name="bussTeleNo" type="text" value="">
					</div>
                </div>

                <div class="span3 spanSm6">
                    <div class="control-group">
						<label class="control-label" for="level">Level</label>
						<input class="field " id="level" placeholder="" name="level" type="text" value="">
					</div>
                </div>
            </div>

            <div class="row-fluid">
                <div class="span3 spanSm6">
                    <label class="labelfont mb0">Directors</label>
                    <label class="radio inline pt0">
                        <input checked="checked" id="optionsRadios1" name="optionsRadios" type="radio" value="option1" /> Yes </label>
                    <label class="radio inline pt0">
                        <input id="optionsRadios2" name="optionsRadios" type="radio" value="option2" /> No </label>
                </div>
            </div>

            <div class="button-container">
            	<a class="customButtonMedium btnBgGreen btnfont" href="#">Register</a>
            	<a class="customButtonMedium btnBgGray btnfont mlxxs0 mtXxs10" href="#">Go Back</a>
            </div>
        </div>
    </div>
</section>
<!-- END: User information -->

<!-- START: Confirmation -->
<section class="home-section bussiness-application high-padding">
    <h2 class="text-center main-header blue full-visible" data-animation="flipInX">Bussiness application</h2>

    <div class="panel panel-default">
        <div class="panel-heading">
            <div class="clearfix bs-wizard">      
			     <div class=" bs-wizard-step complete">
			       <div class="text-center bs-wizard-stepnum">1</div>
			       <div class="progress"><div class="progress-bar"></div></div>
			       <a href="#" class="bs-wizard-dot"></a>
			       <div class="bs-wizard-info text-center">Company Information</div>
			     </div>
			     
			     <div class="bs-wizard-step complete">
			       <div class="text-center bs-wizard-stepnum">2</div>
			       <div class="progress"><div class="progress-bar"></div></div>
			       <a href="#" class="bs-wizard-dot"></a>
			       <div class="bs-wizard-info text-center">User Information</div>
			     </div>
			     
			     <div class="bs-wizard-step active">
			       <div class="text-center bs-wizard-stepnum">3</div>
			       <div class="progress"><div class="progress-bar"></div></div>
			       <a href="#" class="bs-wizard-dot"></a>
			       <div class="bs-wizard-info text-center">Confirmation</div>
			     </div>
			 </div>
        </div>

        <div class="panel-body">
            <div class="text-center img-w"><img alt="" src="${themeDisplay.getPathThemeImage() }/footer-bottom-w.png" /></div>

            <div class="sub-head text-center">
                <p>Thank you.</p>

                <p>You have been successfully Registered.</p>

                <hr class="maxWidth" />
            </div>

            <div class="text-center des-p">
                <p>Your Password and action link has been send to your registered E-mail ID.</p>

                <p>Please use the action link to activate your Account.</p>
            </div>
        </div>
    </div>
</section>
<!-- END: Confirmation -->

