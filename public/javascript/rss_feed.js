$(document).ready(function() {
	$('a.personal-feed').gFeed( {
  	target: '#personal-feeds',
    tabs: false,
    max: 1
	});

	$('a.crowdint-feed').gFeed( {
  	target: '#crowdint-feeds',
    tabs: false,
    max: 1
	});

});



