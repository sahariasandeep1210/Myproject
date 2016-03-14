
$(document).ready(function() {
	
	  investorIndex = 0;
	  $("#pageSize").val($("#currPageSize").val());
	  $("#saveProtfolios").hide(); 
	  $(".historyRow").hide();
	  $("#errorMsg").hide(); 
	  enableTab();
	  $('table').tablesorter();
	  
	  $("#pageSize").change(function (){
			var noOfRecords=parseInt($("#noOfRecords").val());
			var pageSize=parseInt($("#currPageSize").val());
			var newPageSize=parseInt($(this).val());
			$("#currentPage").val(1);
			if(noOfRecords<pageSize && newPageSize>pageSize){
				return;
			}else{
				var actionUrl=$("#defaultCashURL").val();
				var actionUrl=$("#getCashs").val();
				document.forms["cashReportForm"].action = actionUrl;
				document.forms["cashReportForm"].submit();	
			}
		});
	  
	  $("#exportBalances").click(function(){
			
			$('#balanceListTable').tableExport({
				type : 'excel',
				escape : 'false',
				fileName: 'balanceList',
				worksheetName: 'BalanceList'
			});
			
		});
		
	  $("#exportReceivable").click(function(){
			
		$('#receivableReportTable').tableExport({
				type : 'excel',
				escape : 'false',
				fileName: 'ReceivableReport',
				worksheetName: 'ReceivableReport'
			});
			
		});
		
	  
	  $('#investorModel').on('keypress', '.addprotfolio input', function(e) {
		  
		  //if the letter is not digit then display error and don't type anything
		     if (e.which != 8 && e.which != 0 && (e.which < 48 || e.which > 57)) {
		        //display error message
		        //$("#errmsg").html("Digits Only").show().fadeOut("slow");
		               return false;
		    }
		  
	  }); 
	  
	  $('#investorModel').on('keypress', '#editTemplate input', function(e) {
		  
		  //if the letter is not digit then display error and don't type anything
		     if (e.which != 8 && e.which != 0 && (e.which < 48 || e.which > 57)) {
		        //display error message
		        //$("#errmsg").html("Digits Only").show().fadeOut("slow");
		               return false;
		    }
		  
	  });
	  
	  // Add button click handler
      $('#investorModel').on('click', '.addButton', function() {
    	  investorIndex++;
    	  var allSelectedvalues = [];
    	  //this code snippet with add all selected dropdown values to array
    	  $('.scfDropDown').each(function() {
    		  var currentValue=$(this).val();
    		  if(currentValue!="" || currentValue!=null){
    			  allSelectedvalues.push($(this).val());    		  
    			}    		 
    		});
    	  
    	 
          var $template = $('#protfolioTemplate'),
              $clone    = $template
                              .clone()
                              .removeClass('hide')
                              .addClass('addprotfolio')
                              .removeAttr('id')
                              .attr('data-investor-index', investorIndex)
                              .insertBefore($template);
          
          var dropwDownEle=$clone.find('.scfDropDown');
          
          //update DropDown values based on user selection
          $.each(allSelectedvalues, function( index, value ) {
        	  dropwDownEle.find('[value="'+value+'"]').remove();
        	 
    		});
          

          // Update the name attributes
          $clone
              .find('[name="investorModel.company.id"]').attr('name', 'investorModel[' + investorIndex + '].company.id').end()
              .find('[name="investorModel.currentCreditLine"]').attr('name', 'investorModel[' + investorIndex + '].currentCreditLine').end()
              .find('[name="investorModel.myCreditLine"]').attr('name', 'investorModel[' + investorIndex + '].myCreditLine').end()
              .find('[name="investorModel.discountRate"]').attr('name', 'investorModel[' + investorIndex + '].discountRate').end()
              .find('[name="investorModel.amountInvested"]').attr('name', 'investorModel[' + investorIndex + '].amountInvested').end()
              .find('[name="investorModel.availToInvest"]').attr('name', 'investorModel[' + investorIndex + '].availToInvest').end();
          
          if( $(".parentclass").length>1){
        	  $("#saveProtfolios").show();
        	  $("#butonClass" ).show(); 
          }else{
        	  $("#saveProtfolios").hide();
        	  $("#butonClass" ).hide(); 
          }
             
         
      })
        // Remove button click handler
      .on('click', '.removeButton', function() {
            var $row  = $(this).parents('.parentclass'),
                index = $row.attr('data-investor-index');

     

            // Remove element containing the fields
            $row.remove();
            if( $(".parentclass").length>1){
          	  $("#saveProtfolios").show();
          	  $("#butonClass" ).show(); 
            }else{
          	  $("#saveProtfolios").hide();
          	 $("#butonClass" ).hide(); 
            }
        });
      
      $('#investorModel').on('click', '.editInvestor', function() {
    	  $('#editTemplate :input').not(':button, :submit, :reset, :hidden').each(function() {          		 
	        	$(this).removeClass("error_show");         	   
	     });
    	  var currentValue;
    	  var showModel=false;
    	  $('.parentclass :input').each(function() {
    		   currentValue=$(this).val();
    	        if(currentValue!='' &&  currentValue!=null && currentValue!='null'){
    	        	showModel=true;
    	        	return false;
    	        }
    	    });
    	  
    	  if(showModel){
    		 
    		  var currentID=$(this).attr('id');
    		  $("#invProtID").val(currentID);
    		  $("#editConfirmationModel").modal('show');
    	  }else{
    		  $(".addprotfolio").remove();
    		  var currentID=$(this).attr('id');
    		  triggerEdit(currentID);
    	
    	  }  	  
    	  
      });
      
    
        $("#balanceDate").datepicker({
  		changeMonth : true,
  		changeYear : true,
  		showOn : "button",
  		maxDate : '0',
  		buttonImage : "/tf-theme/images/calendar.jpg",
  		buttonImageOnly : true,
  		buttonText : "Select date"
  		
    });
  	
  	 
  });

$("#fromDate").datepicker({
		changeMonth : true,
		changeYear : true,
		showOn : "button",
		
		buttonImage : "/tf-theme/images/calendar.jpg",
		buttonImageOnly : true,
		buttonText : "Select date",
	    onSelect: function(selected) {
  				$("#toDate").datepicker("option","minDate", selected)
  				  
  		   }
			
	});
	
$("#toDate").datepicker({
		changeMonth : true,
		changeYear : true,
		showOn : "button",
		buttonImage : "/tf-theme/images/calendar.jpg",
		buttonImageOnly : true,
		buttonText : "Select date",
		onSelect: function(selected) {
  				$("#fromDate").datepicker("option","maxDate", selected)
  				  
  		   }
	});
	
	 
      $('#investorModel').on('click', '#editCancel', function() {
    	    $("#errorMsg").hide(); 
    	   
    		$("#butonClass" ).hide(); 
    		$("#addProtfolioBtn" ).show();
    		
    		  $('#editTemplate :input').not(':button, :submit, :reset, :hidden').each(function() {          		 
         	        	$(this).removeClass("error_show");         	   
         	    });
    		  $("#editTemplate").addClass("hide");
    		//$("#saveProtfolios").hide();
    	  
      });
      
      $('#investorModel').on('click', '.historybtn', function() {
  	   var historyURL=$(this).attr('data-url'); 
  	   var protfolioID=$(this).attr('protID');
  	   //hiding all other history rows
  	   $(".historyRow").hide();
  	   if($(this).parent().parent().hasClass("highlightedClass")){
  		 $(this).parent().parent().toggleClass('highlightedClass');
  		   return ;
  	   }else{
  		 $('#companyListTable tr').removeClass("highlightedClass");
  		 $(this).parent().parent().toggleClass('highlightedClass');
  	   }
  	   
  	   
  	   
  	   if($("#"+protfolioID+"_table").length){
  		   $("#"+protfolioID+"_row").slideToggle();
  	   }else{
  			$.ajax({ 
				url: historyURL, 
				type: 'POST', 
				cache: false,
				data: { 
					protfolioID: protfolioID 					
					  }, 
				success: function(data){
					$("#"+protfolioID+"_row > td").html(data);
					$("#"+protfolioID+"_row").slideToggle();
							
				} ,
				error: function(jqXHR, textStatus, errorThrown) {
					ajaxindicatorstop();
					
				}
				});	
  	   }
  	  
    });
      
      $('#investorModel').on('click', '.breakdown', function() {
    	  var breakdownURL=$(this).attr('data-url'); 
     	   var scfcompany=$(this).attr('scfcompany'); 
     	  var investorID=$(this).attr('investorID');
     	   
     		$.ajax({ 
				url: breakdownURL, 
				type: 'POST', 
				cache: false,
				data: { 
					scfcompany: scfcompany,
					investorID: investorID 
					  }, 
				success: function(data){
					$("#breakdownBody").html(data);
					 $("#breakdownModel").modal('show');
							
				} ,
				error: function(jqXHR, textStatus, errorThrown) {
					ajaxindicatorstop();
					
				}
				});	
    	  
      });
    
  

 $("#updatebalance").click(function() {

	var error_free = true;
	error_free = validateInvestorInfo(error_free);
	if (error_free) {
		var url = $("#getInvBalanceDetails").val();
		submitInvestorBalanceForm(url);
	}

});
      
  function submitInvestorBalanceForm(url) {
		document.forms["investorBalanceForm"].action = url;
		document.forms["investorBalanceForm"].submit();
	}
  
  $("#cashReport").click(function (){
		var updateURL=$("#getCashReports").val();
		document.forms["cashReportForm"].action = updateURL;
      document.forms["cashReportForm"].submit();
});
  $("#casReport").click(function (){
		var updateURL=$("#getCasReport").val();
		document.forms["casReportForm"].action = updateURL;
        document.forms["casReportForm"].submit();
});
      $("#cancelSetting").click(function (){
    		document.forms["investorBalanceForm"].reset();
    	});
      
      
      
      $('#investorModel').on('click', '#updatebtn', function() {
    	  $("#errorMsg").hide(); 
    	  	var errorFree=true;
    	  	var editutilisedVal= $("#editutilised").val();
    	  	var editmyCreditLneVal=$("#editmyCreditLne").val();
    	  	if(editutilisedVal!=null ){
    	  		editutilisedVal=editutilisedVal.replaceAll(',','');
    	  	}
    	  	if(editmyCreditLneVal!=null){
    	  		editmyCreditLneVal=editmyCreditLneVal.replaceAll(',','');
    	  	}
    	  	
    	  	
    	  	var editutilised= parseInt(editutilisedVal);
    	  	var editmyCreditLne= parseInt(editmyCreditLneVal);
    	  	var url = $(this).attr('data-url');
    	 
    	    $('#editTemplate :input').not(':button, :submit, :reset, :hidden').each(function() {
      		  currentValue=$(this).val();
     	        if(currentValue=='' ||  currentValue==null){
     	        	errorFree=false;
     	        	$(this).addClass("error_show");
     	        }else{
     	        	$(this).removeClass("error_show");
     	        }
     	    });
    	    if(editmyCreditLne < editutilised){
    	    	$("#errorMsg").show(); 
    	    	$("#errorMsg").text("My Credit line can't be less than utilized amount");
    	    	$("#editmyCreditLne").addClass("error_show");
    	    	errorFree=false;
    	    }
    	    
    	  	
    	  	 if(errorFree){
    	  	 	document.forms["investorModel"].action = url;	  	  	
      			document.forms["investorModel"].submit();
        	  }
    	  
      }); 
      
      $('#investorModel').on('click', '#saveProtfolios', function() {
    	  var errorFree=true;
    	  $('.addprotfolio :input').not(':button, :submit, :reset, :hidden').each(function() {
    		  currentValue=$(this).val();
   	        if(currentValue=='' ||  currentValue==null){
   	        	errorFree=false;
   	        	$(this).addClass("error_show");
   	        }else{
   	        	$(this).removeClass("error_show");
   	        }
   	    });
    	  
    	  if(errorFree){
    		 console.log("Validation pass>>");   	  	  	
  			document.forms["investorModel"].submit();
    	  }
    	  
    	 
  	  
    });
      
      $('.filterable .btn-filter').click(function(){
          var $panel = $(this).parents('.filterable'),
          $filters = $panel.find('.filters input'),
          $tbody = $panel.find('.table tbody');
          if ($filters.prop('disabled') == true) {
              $filters.prop('disabled', false);
              $filters.first().focus();
          } else {
              $filters.val('').prop('disabled', true);
              $tbody.find('.no-result').remove();
              $tbody.find('tr').show();
          }
      });
      
      $('.filterable .filters input').keyup(function(e){
          /* Ignore tab key */
          var code = e.keyCode || e.which;
          if (code == '9') return;
         //console.log("input  hhh value >>>:::"+$(this).val().toLowerCase());
          /* Useful DOM data and selectors */
          var $input = $(this),
          inputContent = $input.val().toLowerCase(),
          //inputContent=inputContent.replaceAll(",",""),
          $panel = $input.parents('.filterable'),
          column = $panel.find('.filters th').index($input.parents('th')),
          $table = $panel.find('.table'),
          $rows = $table.find('tbody tr');
          /* Dirtiest filter function ever ;) */
          var $filteredRows = $rows.filter(function(){
              var value = $(this).find('td').eq(column).text().toLowerCase();
              return value.indexOf(inputContent) === -1;
          });
          /* Clean previous no-result if exist */
          $table.find('tbody .no-result').remove();
          /* Show all rows, hide filtered ones (never do that outside of a demo ! xD) */
          $rows.show();
          $filteredRows.hide();
          /* Prepend no-result row if all rows are filtered */
          if ($filteredRows.length === $rows.length) {
              $table.find('tbody').prepend($('<tr class="no-result text-center"><td colspan="'+ $table.find('.filters th').length +'">No result found</td></tr>'));
          }
      });
	
function enableTab(){
	var curentTab=$("#currentTab").val();
	if(curentTab=='allinvestorprotfolios'){
		$("#investorProtfoliosList").addClass("active");
	}else if(curentTab=='investorbalance'){
		$("#invbalList").addClass("active");
	}else if (curentTab=='casReport') {
		$("#casList").addClass("active");
	}
	else if (curentTab=='investorprotfolio') {
		$("#invesProtList").addClass("active");
	}
	else{
		$("#investorProtfoliosList").addClass("active");
		$("#invesProtList").addClass("active");
	}
	 
}	

function confirmEdit(){
	 $(".addprotfolio").remove();
	var currentId=$("#invProtID").val();
	triggerEdit(currentId);
	$("#editConfirmationModel").modal('hide');
}

String.prototype.replaceAll = function(search, replace)
{
    //if replace is not sent, return original string otherwise it will
    //replace search string with 'undefined'.
    if (replace === undefined) {
        return this.toString();
    }

    return this.replace(new RegExp('[' + search + ']', 'g'), replace);
};

function triggerEdit(currentId){
	var cmpName=$("#"+currentId+"cmpname").text();
	var currcreditLine=$("#"+currentId+"currcreditLine").text();
	var mycreditLine=$("#"+currentId+"mycreditLine").text();
	if(mycreditLine!=null){
		mycreditLine=mycreditLine.replaceAll(',','');
	}
	
	var dicountRate=$("#"+currentId+"dicountRate").text();
	var utilised=$("#"+currentId+"utilised").text();
	$("#scfCompantName").text(cmpName);
	$("#editcurrCreditLine").val(currcreditLine);
	$("#editmyCreditLne").val(mycreditLine);
	$("#editDiscountRate").val(dicountRate);
	$("#editutilised").val(utilised);
	$("#editTemplate").removeClass("hide");
	currentId=currentId.replace("_","");
	$("#profolioId").val(currentId);
	//$("#editTemplate").slideToggle();
	$("#butonClass" ).hide(); 
	$("#addProtfolioBtn" ).hide();
}

function ajaxindicatorstart(text)
{
	if($('body').find('#resultLoading').attr('id') != 'resultLoading'){
	$('body').append('<div id="resultLoading" style="display:none"><div><img src="/tf-admin-portlet/images/ajax-loader.gif"><div>'+text+'</div></div><div class="bg"></div></div>');
	}
	
	$('#resultLoading').css({
		'width':'100%',
		'height':'100%',
		'position':'fixed',
		'z-index':'10000000',
		'top':'0',
		'left':'0',
		'right':'0',
		'bottom':'0',
		'margin':'auto'
	});	
	
	$('#resultLoading .bg').css({
		'background':'#000000',
		'opacity':'0.7',
		'width':'100%',
		'height':'100%',
		'position':'absolute',
		'top':'0'
	});
	
	$('#resultLoading>div:first').css({
		'width': '250px',
		'height':'75px',
		'text-align': 'center',
		'position': 'fixed',
		'top':'0',
		'left':'0',
		'right':'0',
		'bottom':'0',
		'margin':'auto',
		'font-size':'16px',
		'z-index':'10',
		'color':'#ffffff'
		
	});

    $('#resultLoading .bg').height('100%');
    $('#resultLoading').fadeIn(300);
    $('body').css('cursor', 'wait');
}

function ajaxindicatorstop()
{
    $('#resultLoading .bg').height('100%');
    $('#resultLoading').fadeOut(300);
    $('body').css('cursor', 'default');
}


function setPage(pageNumber) {
	if ($("#balanceListTable").length) {
		$("#currentPage").val(pageNumber);
		var actionUrl = $("#defaultURL").val();
		document.forms["investorBalanceForm"].action = actionUrl;
		document.forms["investorBalanceForm"].submit();

	} else if ($("#cashReportTable").length) {
		$("#currentPage").val(pageNumber);
		var actionUrl = $("#defaultCashURL").val();
		document.forms["cashReportForm"].action = actionUrl;
		document.forms["cashReportForm"].submit();
		
	} else if ($("#cashReportTable").length) {
		$("#currentPage").val(pageNumber);
		var actionUrl = $("#getCashs").val();
		document.forms["cashReportForm"].action = actionUrl;
		document.forms["cashReportForm"].submit();

	} else if ($("#receivableReportTable").length) {
		$("#currentPage").val(pageNumber);
		var actionUrl = $("#defaultRenderURL").val();
		document.forms["receivableReportForm"].action = actionUrl;
		document.forms["receivableReportForm"].submit();

	}
}


function validateInvestorInfo(error_free) {
	var errormess="Please Fill Required Fields and try again.";

	var elements = [];
	   elements[0] = "transactionType";

	elements[1] = "transactionAmount";
	elements[2] = "balanceDate";

	$("#errorMsg").hide();
	$("#errorMsg").html();
	for (i = 0; i < elements.length; i++) {
		var element = $("#" + elements[i]);
		var eleValue = element.val();
		if (eleValue == '' || eleValue == null || (element.is('select') && element[0].selectedIndex == 0)) {
			element.addClass("error_show");
			error_free = false;
			$("#errorMsg").show();
			$("#errorMsg").html(errormess);
		} else {
			element.removeClass("error_show");
		}
	}
	return error_free;
}
