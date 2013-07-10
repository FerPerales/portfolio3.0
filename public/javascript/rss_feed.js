if (window.google) {  
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
} else {
  $(document).ready(function() {
    $('a.personal-feed').html(
      "Could not retrieve the information from the specified blog"
    );

    $('a.crowdint-feed').html( 
      "Could not retrieve the information from the specified blog"
    );
  });
}



