<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="session.GetSession, java.util.HashMap" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<jsp:include page="./head.html" />
<script src="/recruit/script/confirm.js"></script>
<title>確認画面</title>
</head>
<body>
	<%
		String id = session.getAttribute("session_id").toString();
		GetSession gs = new GetSession();
		HashMap<String, String> map = gs.getSession(id);
	%>
	<div class="uk-width-medium-1-2 uk-container-center">
		<p class="uk-h1">予約の確認</p><hr>
		<div class="uk-panel uk-panel-box uk-width-2-3 uk-container-center">
			<h5 class="uk-panel-title uk-text-bold">予約情報</h5>
			<p>開催地：<%= map.get("area") %></p>
			<p>
				開催日時：<%= map.get("date") %>&nbsp;
				<%= map.get("start_time") %>~<%= map.get("end_time") %>
			</p>
		</div><br>
		<form action="Cancel" method="post" class="uk-form uk-width-2-3 uk-container-center">
			<div class="uk-form-row">
				<input type="submit" value="キャンセル" id="cancel" class="uk-button uk-button-danger uk-align-center">
			</div>
			<a href="/recruit/session.jsp" class="uk-align-right">一覧へ</a>
			<input type="hidden" name="name" value="<%= session.getAttribute("name") %>">
			<input type="hidden" name="mail" value="<%= session.getAttribute("mail") %>">
			<input type="hidden" name="session_id" value="<%= id %>">
		</form>
		
	</div>
</body>
</html>