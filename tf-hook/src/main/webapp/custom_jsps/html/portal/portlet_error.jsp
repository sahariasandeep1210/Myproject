<%@ include file="/html/portal/init.jsp" %>

<portlet:defineObjects />


<div>
	<div class="container">
		<div class="row-fluid">
			<div class="span12">
				<div class="error-template">
					<h1><%= LanguageUtil.format(pageContext, "default.exception.message.part1",  false) %> </h1>
					<br>
					<h4><%= LanguageUtil.format(pageContext, "default.exception.message.part2",  false) %> </h4>
					<br>
					<br>
					<!-- <div class="error-details"></div> -->
					<div class="error-actions">
						<a href="/group/guest/dashboard"
							class="btn btn-primary btn-lg"><i class="fa fa-home"></i> Take Me Home </a><a
							href="#"
							class="btn btn-default btn-lg"><i class="fa fa-phone"></i> Contact Support </a>
					</div>
				</div>
			</div>
		</div>
	</div>

</div>