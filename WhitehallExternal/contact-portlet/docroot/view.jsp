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
<%@ taglib prefix="liferay-theme" uri="http://liferay.com/tld/theme" %>

<portlet:defineObjects />
<liferay-theme:defineObjects />

<section class="home-section contact-round-section normal-padding">
    <div class="container">
        <h2 class="text-center main-header full-visible blue" data-animation="flipInX">Get in touch</h2>

        <div class="row-fluid" data-animation="fadeInUp">
            <div class="span4">
                <div class="feature-img text-center">
					<img alt="" src="${themeDisplay.getPathThemeImage() }/contact-icon1.png" />
				</div>

                <div class="sub-head text-center">
                    <p>91 Henley Road,BOWCOMBE,PO30 7FB</p>
                </div>
            </div>

            <div class="span4">
                <div class="feature-img text-center yellow">
					<img alt="" src="${themeDisplay.getPathThemeImage() }/contact-icon2.png" />
				</div>

                <div class="sub-head text-center">
                    <p>+44 078 1344 2246</p>
                </div>
            </div>

            <div class="span4">
                <div class="feature-img text-center green">
                	<img alt="" src="${themeDisplay.getPathThemeImage() }/contact-icon3.png" />
                </div>

                <div class="sub-head text-center">
                    <p>hello@platformblack.com</p>
                </div>
            </div>
        </div>
    </div>
</section>

<section class="home-section contact-round-section form-margin">
    <div class="form-box">
        <div class="container">
            <div class="row-fluid">
                <div class="span2 spanSm6">
                    <div class="control-group">
						<label class="control-label" for="fName">First Name</label>
						<input class="field " id="fName" name="fName" type="text" value="">
					</div>
                </div>

                <div class="span2 spanSm6">
                    <div class="control-group">
						<label class="control-label" for="lName">Last Name</label>
						<input class="field " id="lName" name="lName" type="text" value="">
					</div>
                </div>

                <div class="span2 spanSm6">
                    <div class="control-group">
						<label class="control-label" for="cName">Company Name</label>
						<input class="field " id="cName" name="cName" type="text" value="">
					</div>
                </div>

                <div class="span2 spanSm6">
                	<div class="control-group">
						<label class="control-label" for="jobTitle">Job Title</label>
						<input class="field " id="jobTitle" name="jobTitle" type="text" value="">
					</div>
                </div>

                <div class="span2 spanSm6">
                	<div class="control-group">
						<label class="control-label" for="contactNo">Contact Number</label>
						<input class="field " id="contactNo" name="contactNo" type="text" value="">
					</div>
                </div>

                <div class="span2 spanSm6">
                	<div class="control-group">
						<label class="control-label" for="emailAddress">Email Address</label>
						<input class="field " id="emailAddress" name="emailAddress" type="text" value="">
					</div>
                </div>
            </div>

            <div class="row-fluid">
            	<div class="span12">
            		<div class="control-group">
						<label class="control-label" for="message">Your Message</label>
						<textarea id="message" name="message" rows="3"></textarea>
					</div>
            	</div>
            </div>

            <div class="row-fluid">
                <div class="button-container">
                	<a class="customButtonMedium btnBgGreen btnfont" href="#">Submit</a>
                </div>
            </div>
        </div>
    </div>
</section>

<section class="home-section contact-round-section map-section">
    <div class="map-body">
        <div class="map" id="map">&nbsp;</div>
    </div>
</section> 
