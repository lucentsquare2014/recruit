$(function(){
	$("table :radio").click(function(){
		if($("table :checked").length > 0){
			$("#entry").prop('disabled', false);
		}else{
			$("#entry").prop('disabled', true);
		}
	});
	
	$("#enter").click(function(){
		var name = $.trim($("input[name='name']").val());
		var mail = $.trim($("input[name='mail']").val());
		if(name == "" || mail == ""){
			$("#msg").text("名前とメール両方とも入力してください！").removeClass()
			 .addClass("uk-text-danger");
			return false;
		}
		if(!mail.match(/^([a-zA-Z0-9])+([a-zA-Z0-9\._-])*@([a-zA-Z0-9_-])+([a-zA-Z0-9\._-]+)+$/)){
			$("#msg").text("正しいメールアドレスを入力してください！").removeClass()
			 .addClass("uk-text-danger");
			return false;
		}
		$.ajax({
			type : "POST",
			url : "/recruit/Confirm",
			cache: false,
			data : {"name" : name,
					"mail" : mail},
			statusCode: {
				403: function() {
					$("#msg").text("存在しません。もう一度入力してください！").removeClass()
							 .addClass("uk-text-danger");
			    }
			}
		}).done(function(){
			location.href = "/recruit/confirm.jsp";
		});
	});
});