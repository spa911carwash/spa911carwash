$(document).ready(function(){
	$("span.menu").click(function(){
		alert('I am in here');
		$(".to p-nav ul").slideToggle(1000);
	});
});