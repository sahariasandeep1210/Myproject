AUI().ready(
	'aui-carousel', 'liferay-hudcrumbs', 'liferay-navigation-interaction', 'event-outside', 'aui-sortable-layout', 'aui-toggler',
	function(A) {
		var navigation = A.one('#navigation');

		if (navigation) {
			navigation.plug(Liferay.NavigationInteraction);
		}

		
		
		var dockbar = A.one('.dockbar');

		if (dockbar) {
			A.all('#heading .notification-img-container .icomoon-setting').each(function(btnDockbarToggle) {
				new A.Toggler(
					{
						content: dockbar,
						header: btnDockbarToggle,
						expanded: false
					}
				);
			});
		}
		
		/** -- START: Handle aui validation error placement -- **/
		A.use('aui-form-validator', function (A) {
			SHOW_ALL_MESSAGES = 'showAllMessages';
			MESSAGE_CONTAINER = 'messageContainer';
			A.FormValidator.prototype.printStackError = function(field, container, errors){
				
				var instance = this;

	            if (!instance.get(SHOW_ALL_MESSAGES)) {
	                errors = errors.slice(0, 1);
	            }

	            container.empty();

	            A.Array.each(
	                errors,
	                function(error, index) {
	                    var message = instance.getFieldErrorMessage(field, error),
	                        messageEl = instance.get(MESSAGE_CONTAINER).addClass(error);

	                    container.append(
	                        messageEl.html(message)
	                    );
	                    
	                    if(!!field.ancestor(".input-append")){
	                    	field.ancestor().append(container);	
	                    }else if(!!field.ancestor(".control-group")){
	                    	field.ancestor(".control-group").append(container);	
	                    }
	                    
	                }
	            );
			} 
		});
		/** -- END: Handle aui validation error placement -- **/
		
		/* CheckBox button build */
		A.all("input[type='checkbox']").each(function (node) {
		    if (node) {
		    	node.placeAfter("<span class='checkBoxIcon'></span>");
		    }
		});
		
		/* Radio button build */
		A.all("input[type='radio']").each(function (node) {
		    if (node) {
		    	node.placeAfter("<span class='radioIcon'></span>");
		    }
		});
		
		




	}
);

Liferay.Portlet.ready(

	/*
	This function gets loaded after each and every portlet on the page.

	portletId: the current portlet's id
	node: the Alloy Node object of the current portlet
	*/

	function(portletId, node) {
	}
);

Liferay.on(
	'allPortletsReady',

	/*
	This function gets loaded when everything, including the portlets, is on
	the page.
	*/

	function() {
	}
);

$(function(){
	
	
	
	if ($("#portlet_new-password").length ) {
		 
	    $("#portlet_new-password").removeClass("customPortlet");
	 
	}
	
	
	/* Div Block In Center Of the Screen */
    $.fn.centerDiv = function ()
    {
        this.css("position","fixed");
        this.css("top", ($(window).height() / 2) - (this.outerHeight() / 2));
        this.css("left", ($(window).width() / 2) - (this.outerWidth() / 2));
        return this;
    }
    
    /* Login Block Center Of the Screen */
    if($("div.login")){$("div.login").centerDiv()};
	
	$( window ).resize(function() {
		if($("div.login")){$("div.login").centerDiv()};
	});
	
	if($('.label-required').length > 0){
	  $('.label-required').text('*');
	}
	
	
	/** -- START: Handle full height of sidebar -- **/
	// Full height of sidebar
	function fix_height() {
		var heightWithoutNavbar = $("body > #content").height() - 61;
		$(".sidebard-panel").css("min-height", heightWithoutNavbar + "px");

		var navbarHeigh = $('nav.navbar-default').height();
		var wrapperHeigh = $('.pageWrapper').height();

		if (navbarHeigh > wrapperHeigh) {
			$('.pageWrapper').css("min-height", navbarHeigh + "px");
		}

		if (navbarHeigh < wrapperHeigh) {
			$('.pageWrapper').css("min-height", $(window).height() + "px");
		}

		if ($('body').hasClass('fixed-nav')) {
			if (navbarHeigh > wrapperHeigh) {
				$('.pageWrapper').css("min-height", navbarHeigh - 60 + "px");
			} else {
				$('.pageWrapper').css("min-height", $(window).height() - 60 + "px");
			}
		}
	}
	
	fix_height();
	// Minimalize menu when screen is less than 768px
	$(window).bind("resize", function () {
	    if ($(this).width() < 769) {
	        $('body').addClass('body-small')
	    } else {
	        $('body').removeClass('body-small')
	    }
	});
	
	 $(window).bind("load resize scroll", function () {
        if (!$("body").hasClass('body-small')) {
            fix_height();
        }
    });
	/** -- END: Handle full height of sidebar -- **/
	 
	 
	 /** -- START: file upload manager -- **/
	 fileUploadmanager = function(fileUploadedId, _callbackFn){
		var _self = this;
		var _fileUploadContainer = $(fileUploadedId);
		var _actualFileUploader = $(_fileUploadContainer).find(".fileUploadManager");
		var _fakeFileUploader = $(_fileUploadContainer).find(".fakeFileUploader").parent(".input-append");
		
		if(!!_fakeFileUploader.length == false){
			_fakeFileUploader = $(_fileUploadContainer).find(".fakeFileUploader");
		}
		var _fakeFileUploaderInput = $(_fileUploadContainer).find(".fakeFileUploader");
		
		var bindEvent = function(){
		    $(_fakeFileUploader).on({
				click: function(){
					$(_actualFileUploader).trigger("click");
				}
			});
			
			$(_actualFileUploader).on({
				change: function(){
					var _fileValue = $(this).val();
					var _croppedValue = _fileValue.split("\\");
					var _fileName = _croppedValue[2] || _croppedValue[0];
					$(_fakeFileUploaderInput).val(_fileName);
					var htmlDom = document.getElementById($(this).attr("id"));
					if (typeof _callbackFn == 'function') {
						_callbackFn.call(this, htmlDom);
					}
				}
			});
		}
		
		this.init = function(){
			bindEvent();
		}
		this.init();
	}
	 
	 /** -- END: file upload manager -- **/
});