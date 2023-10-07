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
	
	//mypage 선택된 메뉴 active처리
	var currUrl = window.location.pathname;
	if ($("#mypageMenus")) {
		$("#mypageMenus").find("a").removeClass("list-group-item-primary");
		$("#mypageMenus").find("a").each(function(index, item) {
			if (currUrl == $(item).attr("href")) {
				$(item).addClass("list-group-item-primary");
			}
		});
	}
});
