$(function(){
	$("input[type='submit']").click(function(){
		var date = $.trim($("input[name='date']").val());
		var sh = $("select[name='start_h']").val();
		var sm = $("select[name='start_m']").val();
		var eh = $("select[name='end_h']").val();
		var em = $("select[name='end_m']").val();
		var capacity = $("input[name='capacity']").val();
		if(date == ""){
			$("#alert").text("開催日時を入力してください！");
			return false;
		}
		var dc = date.split('-');
		if(dc.length != 3){
			$("#alert").text("正しい日付を入力してください！");
			return false;
		}else{
			var di = new Date(dc[0], dc[1] - 1, dc[2]);
			if(!(di.getFullYear() == dc[0] && di.getMonth() == dc[1] - 1 && di.getDate() == dc[2])){
				$("#alert").text("正しい日付を入力してください！");
				return false;
			}
		}
		if(sh > eh){
			$("#alert").text("正しい時間帯を入力してください！");
			return false;
		}
		if(sh == eh && !(sm < em)){
			$("#alert").text("正しい時間帯を入力してください！");
			return false;
		}
		if(capacity == ""){
			$("#alert").text("定員を入力してください！");
			return false;
		}
		if(document.getElementById("join") != null){
			var number = $("#join").text().replace("&nbsp;人", "");
			if(capacity < number){
				$("#alert").text("参加人数は定員人数を超えています！");
				return false;
			}
		}
	});
});