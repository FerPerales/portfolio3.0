$(document).ready(function(){
	$('#downloads-counter').click(function(){
		var countSpan = $('span.download-count');
		countSpan.html( parseInt(countSpan.text())+1);
	});
});