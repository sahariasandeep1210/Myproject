<%@include file="init.jsp"%>
<%@ taglib uri="http://whitehall.com/jsp/tld/p" prefix="p"%>
	<li class="dropdown notification-dropdown" id="testID">
					  <a href="#" class="dropdown-toggle-" data-toggle="dropdown">
						<span class="notification-img-container">
							<i class="icomoon-notification bigIcon notification-img" alt=""></i>
							<span class="badge notification-badge">1</span>
						</span>
					  </a>
					  <ul class="dropdown-menu">
						<li>
							<div class="custom-dropdown-wrapper notification">
								<div class="custom-dropdown-container">
									<div class="custom-dropdown-header-container">
										<div class="clearfix">
											<a class="pull-left" href="#">Notifications</a>
											<!-- <a class="pull-right" href="#">Mark as read</a> -->
										</div>
									</div>
								</div>
								<div class="custom-dropdown-container">
								<ul class="notification-list">
									<li class="notification-item">
										<div class="img-container">
											<img class="dropdown-img" src="$images_folder/dummy-prof-img.jpg" alt="" title="notification image">
										</div>
										<div class="info-container">
											<div class="notification-link-container">
												<a href="#" class="no-padding">Membership Requested.</a>
												<p class="time-info">Supplier name</p>
												<p class="time-info">
													<input type="button" value="Approve" class="btn btn-primary"	id="createTrade" data-url="" />
													<input type="button" value="Reject" class="btn btn-primary"	id="createTrade" data-url="" />

												</p>
												
												
												
											</div>
										</div>
									</li>
									
									<li class="notification-item">
										<div class="img-container">
											<img class="dropdown-img" src="$images_folder/dummy-prof-img.jpg" alt="" title="notification image">
										</div>
										<div class="info-container">
											<div class="notification-link-container">
												<a href="#" class="no-padding">Dockbar custom notification.</a>
												<p class="time-info">3 minuates ago</p>
											</div>
										</div>
									</li>
									
								</ul>
								</div>
							</div>
						</li>
					  </ul>
					</li>
