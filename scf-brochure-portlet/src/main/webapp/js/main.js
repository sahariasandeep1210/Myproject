
$(document).ready(function() {
	  $("#broDownlodLink").click(function(){
		  if($("#savedInfo").val()=="0"){
			  $("#brochurModal").modal("show");
		  }
	  });
	
	  $("#borucurSubmit").click(function(){
		  $("#saveBrouchurForm").find(".error_show").removeClass("error_show");
		  var frm = $('#saveBrouchurForm');
		  var isValid=true;
		  if($("#brFName").val().trim().length==0){
			  $("#brFName").addClass("error_show");
			  isValid=false;
		  }
		  if($("#brLastName").val().trim().length==0){
			  $("#brLastName").addClass("error_show");
			  isValid=false;
		  }
		  if($("#brEmail").val().trim().length==0){
			  $("#brEmail").addClass("error_show");
			  isValid=false;
		  }
		  if($("#brPNumber").val().trim().length==0){
			  $("#brPNumber").addClass("error_show");
			  isValid=false;
		  }
		  if($("#brCName").val().trim().length==0){
			  $("#brCName").addClass("error_show");
			  isValid=false;
		  }
		  if(isValid){
			  $.ajax({
		            type: frm.attr('method'),
		            url: frm.attr('action'),
		            data: frm.serialize(),
		            success: function (data) {
		              $("#popMessageDisplayId").removeClass("popMessageDisplay");
		              $("#broDownlodLink").attr("href",$("#pdfBrochurDownloadRes").val());
		              $("#broDownlodLink").attr("target","_blank");
		              $("#savedInfo").val("a");
		              $("#borucurSubmit").attr("disabled","true");
		              $("#saveBrouchurForm").find("input").prop("readonly",true);
		            },
		            error: function (data) {
		                console.log('An error occurred.');
		            },
		        });
		  }
		 
	  });
	  
	  $('#brochurModal').on('hidden.bs.modal', function() {
		    $(this).find("input").val("");
		    $("#saveBrouchurForm").find(".error_show").removeClass("error_show");
		    $("#borucurSubmit").removeAttr("disabled");
		    $("#saveBrouchurForm").find("input").removeAttr("readonly");
	  });
	  
	 
});
