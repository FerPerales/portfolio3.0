var projects = $('.thumbnails');
var language = "all";
var prev = language;
var prevOption = $('li[data-language*="all"]');
$('.breadcrumb').on('click', 'li', function(){	
	language = $(this).data("language");
	if (language == 'all') {
		projects.find('li').show(1000);
	}	else {					
		language = $(this).data("language");	
		projects.find('li[data-language*="' + language + '"]').show(1000);
		projects.find('li:not([data-language*="' + language + '"])').hide(1000);
	}
	prevOption.removeClass('active');				
	prevOption = $(this);
	prevOption.addClass('active');
})