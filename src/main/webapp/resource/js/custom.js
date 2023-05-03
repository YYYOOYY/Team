//login popup

$(".login_ad").click(function(){
	console.log("1");
    $(".layer_bg").css("display","block");
});
$(".layer_close").click(function(){
    $(".layer_bg").css("display","none");
});
$("#mvJoin").click(function() {
    $(".layer_bg").css("display","none");
    $(".layer_bg_join").css("display","block");
});

//join popup
$(".join_ad").click(function(){
	console.log("1");
    $(".layer_bg_join").css("display","block");
});
$(".layer_close").click(function(){
    $(".layer_bg_join").css("display","none");
});
