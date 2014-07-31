<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="session.GetSession, java.util.ArrayList, java.util.HashMap" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<jsp:include page="./head.html" />
<style type="text/css">
#edit:hover {
	cursor: pointer;
}
#edit_form {
	display: none;
}
</style>
<title>会社説明会管理画面</title>
</head>
<body>
	<%
		GetSession gs = new GetSession();
		ArrayList<HashMap<String, String>> list = gs.getSessionList();
	%>
	<div class="uk-width-medium-3-5 uk-container-center">
		<p class="uk-h1 uk-text-center">会社説明会の管理</p><br>
		<div class="uk-width-3-4 uk-container-center">
			<a href="/recruit/create.jsp" class="uk-button uk-button-primary">
				<i class="uk-icon-pencil uk-icon-small"></i>　新規作成
			</a>
		</div>
		<ul class="uk-width-2-3 uk-list uk-container-center">
		<% 
			for(int i = 0; i < list.size(); i++){ 
			HashMap<String, String> map = list.get(i);
		%>
			<li>
				<div class="uk-panel uk-panel-box uk-grid">
					<span class="uk-width-1-4"><%= map.get("area") %></span>
					<span class="uk-width-1-4"><%= map.get("date") %></span>
					<span class="uk-width-1-4"><%= map.get("start_time") %>~<%= map.get("end_time") %></span>
					<span class="uk-width-1-4"><%= map.get("number") %>/<%= map.get("capacity") %>
						<a href="/recruit/update.jsp?id=<%=  map.get("id") %>" class="uk-align-right">
							<i class="uk-icon-edit" data-uk-tooltip title="編集"></i>
						</a>
					</span>
				</div>
			</li>
		<% } %>
		</ul>
		
	</div>
	
</body>
</html>