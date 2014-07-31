<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="session.GetSession, java.util.HashMap" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<jsp:include page="./head.html" />
<script src="/recruit/script/entry_check.js"></script>
<style type="text/css">
label {
	text-align: center;
}
</style>
<title>会社説明会の予約</title>
</head>
<body>
	<%
		String session_id = request.getParameter("select");
		GetSession gs = new GetSession();
		HashMap<String, String> map = gs.getSession(session_id);
	%>
	<div class="uk-width-medium-1-2 uk-container-center">
		<p class="uk-h1">個人情報の入力</p><hr>
		<div class="uk-panel uk-panel-box uk-width-2-3 uk-container-center">
			<h5 class="uk-panel-title uk-text-bold">予約情報</h5>
			<p>開催地：<%= map.get("area") %></p>
			<p>
				開催日時：<%= map.get("date") %>&nbsp;
				<%= map.get("start_time") %>~<%= map.get("end_time") %>
			</p>
		</div><br>
		<p class="uk-h4 uk-text-danger uk-text-center" id="alert"></p>
		<form action="Entry" class="uk-form uk-form-horizontal uk-width-2-3 uk-container-center" method="post">
			<div class="uk-form-row">
				<label class="uk-form-label uk-text-bold uk-text-large">名前</label>
				<input type="text" name="name">＊
			</div>
			<div class="uk-form-row">
				<label class="uk-form-label uk-text-bold uk-text-large">学校</label>
				<input type="text" name="university">＊
			</div>
			<div class="uk-form-row">
				<label class="uk-form-label uk-text-bold uk-text-large">メール</label>
				<input type="text" name="mail">＊
			</div>
			<div class="uk-form-row">
				<label class="uk-form-label uk-text-bold uk-text-large">電話番号</label>
				<input type="text" name="tel">
			</div>
			<div class="uk-form-row">
				<label class="uk-form-label"></label>
				<input type="submit" value="送信" class="uk-button uk-button-primary">
			</div>
			<input type="hidden" name="session_id" value="<%= session_id %>">
			<a href="/recruit/session.jsp" class="uk-align-right">一覧へ</a>
		</form>
	</div>
</body>
</html>