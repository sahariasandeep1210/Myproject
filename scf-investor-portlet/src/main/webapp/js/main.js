$(document).ready(function() {
	
	  investorIndex = 0;
	  
	  // Add button click handler
      $('#investorModel').on('click', '.addButton', function() {
    	  investorIndex++;
    	  var allSelectedvalues = [];
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
              .find('[name="investorModel.company.id"]').attr('name', 'investorDTO.investorModel[' + investorIndex + '].company.id').end()
              .find('[name="investorModel.currentCreditLine"]').attr('name', 'investorDTO.investorModel[' + investorIndex + '].currentCreditLine').end()
              .find('[name="investorModel.myCreditLine"]').attr('name', 'investorDTO.investorModel[' + investorIndex + '].myCreditLine').end()
              .find('[name="investorModel.discountRate"]').attr('name', 'investorDTO.investorModel[' + investorIndex + '].discountRate').end()
              .find('[name="investorModel.amountInvested"]').attr('name', 'investorDTO.investorModel[' + investorIndex + '].amountInvested').end()
              .find('[name="investorModel.availToInvest"]').attr('name', 'investorDTO.investorModel[' + investorIndex + '].availToInvest').end();
             
         
      })
        // Remove button click handler
      .on('click', '.removeButton', function() {
            var $row  = $(this).parents('.parentclass'),
                index = $row.attr('data-investor-index');

     

            // Remove element containing the fields
            $row.remove();
        });

	enableTab();
	$("#createTrade").hide(); 
	$("#requestFinance").hide();
	
	$('ul.nav-pills li a').click(function (e) {
		  $('ul.nav-pills li.active').removeClass('active')
		  $(this).parent('li').addClass('active')
		})
	$("#updateInvoice").click(function() {
		$('#wrapperfirst').removeClass('hideclass');
		$('#myModal').modal('show');
	});

	$(":checkbox").change(function() {		
		var chekedLen = $(":checkbox:checked").length;
		if (chekedLen > 0) {
			if($("#createTrade").length){
				$("#createTrade").show();
			}else if($("#requestFinance").length){
				$("#requestFinance").show();
			}
			
		} else {
			$("#createTrade").hide();
			$("#requestFinance").hide();
			$("#errormsg").text("");
			$("#errormsg").hide();		
		}

	});
	
	if ($('#confirmationModel').length > 0) {
		$('#wrappersecond').removeClass('hideclass');
		$('#confirmationModel').modal('show');
	}
	

	
	$("#createTrade").click(function() {	
		var invoices = [];  
		var invoiceDate = []; 
		var scfCompany = []; 
		 $("#errormsg").hide();
		 $("#errormsg").text("");
		
		 $("#invoicelist input:checkbox:checked").each(function () {
			 invoiceDate.push($(this).attr("date-attr"));
			 scfCompany.push($(this).attr("scfcompany-attr"));		       
		    });
		 
		 var uniquesDates = invoiceDate.unique();
		 var uniquescmp = scfCompany.unique();
		 if(uniquesDates.length==1  && uniquescmp.length==1 ){
			 var url = $(this).attr('data-url');
			$("#invoicelist input:checkbox:checked").each(function() {
				invoices.push($(this).val());
			});
			$("#invoices").val(invoices.toString()); 
			$("#companyId").val(scfCompany.toString());
			document.forms["invoicelist"].action = url;
			document.forms["invoicelist"].submit();
			 
		 }else{
			 if(uniquescmp.length>1){
				 $("#errormsg").text("All the invoices in a trade must be from same Invoice company");
				 $("#errormsg").show();				 
			 } if(uniquesDates.length>1){
				 $("#errormsg").text("All the invoices in a trade must be having same closing date");
				 $("#errormsg").show();
			 }
		 }
		
	});
	
	$("#requestFinance").click(function() {
		var invoices = []; 
		 var url = $(this).attr('data-url');
		 $("#invoicelist input:checkbox:checked").each(function() {
				invoices.push($(this).val());
			});
		 $("#invoices").val(invoices.toString()); 
		 document.forms["invoicelist"].action = url;
		document.forms["invoicelist"].submit();
		
	}); 
	$("#createInvoice").click(function() {
		 var url = $(this).attr('data-url');
		 document.forms["invoicelist"].action = url;
		document.forms["invoicelist"].submit();
		
	}); 
	$("#invoiceback").click(function() {
		 var url = $(this).attr('data-url');
		 document.forms["createInvoice"].action = url;
		document.forms["createInvoice"].submit();
		
	});
	
	$("#invoiceDate, #paymentDate,#dueDate").datepicker({
		changeMonth : true,
		changeYear : true,
		showOn : "button",	
		buttonImage : "/tf-theme/images/calendar.jpg",
		buttonImageOnly : true,
		buttonText : "Select date"
	});

});

Array.prototype.contains = function(v) {
    for(var i = 0; i < this.length; i++) {
        if(this[i] === v) return true;
    }
    return false;
};

Array.prototype.unique = function() {
    var arr = [];
    for(var i = 0; i < this.length; i++) {
        if(!arr.contains(this[i])) {
            arr.push(this[i]);
        }
    }
    return arr; 
}

function enableTab(){
	var curentTab=$("#currentTab").val();
	if(curentTab=='invoiceslist'){
		$("#invoiceList").addClass("active");
	}else if(curentTab=='invoiceDocuments'){
		$("#invoicedocList").addClass("active");
	}else{
		$("#invoiceList").addClass("active");
	}
	
	
}
