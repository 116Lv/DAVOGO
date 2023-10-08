$(document).ready(function() {
	
	//검색버튼 클릭시
	$(".search").on("click", function(event) {
		if ($(this).is(":visible")) {
			$("#searchInput").removeAttr("hidden");
			/*$("#searchInput").animate({
				opacity: 1,
				width: "100%"
			}, 1500);*/
			$("#searchInput").focus();
			$(this).hide();
		} else {
			$("#searchInput").attr("hidden");
			$(this).show();
		}
	});

	$("#searchInput").on("focusout", function(event) {
		console.log("focusout event called");
		$("#searchInput").attr("hidden", "hidden");
		$(".search").show();
	});
	
});
