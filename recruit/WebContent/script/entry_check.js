$(function(){
	$("input[type='submit']").click(function(){
		var name = $.trim($("input[name='name']").val());
		var university = $.trim($("input[name='university']").val());
		var mail = $.trim($("input[name='mail']").val());
		var tel = $.trim($("input[name='tel']").val());
		if(name == "" || university == "" || mail == ""){
			$("#alert").text("必須項目を入力してください！");
			return false;
		}
		if(!mail.match(/^([a-zA-Z0-9])+([a-zA-Z0-9\._-])*@([a-zA-Z0-9_-])+([a-zA-Z0-9\._-]+)+$/)){
			$("#alert").text("正しいメールアドレスを入力してください！");
			return false;
		}
		if(tel != ""){
			if(!tel.match(/^[0-9\-]+$/)){
				$("#alert").text("正しい電話番号を入力してください！");
				return false;
			}
		}
	});
});