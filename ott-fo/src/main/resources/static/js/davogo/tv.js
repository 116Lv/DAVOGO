

$(document).ready(function() {
	$(".genre").on("click", function(){
		var target = $(this);
		var genre = target.attr("genre");
		
		location.href="/tv/category.do?genre=" + genre;
	});
});