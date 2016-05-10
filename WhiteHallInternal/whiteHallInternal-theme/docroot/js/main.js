AUI().ready(

	/*
	This function gets loaded when all the HTML, not including the portlets, is
	loaded.
	*/

	function() {
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
});