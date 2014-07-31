$(function(){
	$("#cancel").click(function(){
		if (!confirm('本当にこの説明会をキャンセルしますか?')){
			return false;
		}
	});
});