<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="session.GetSession, java.util.HashMap" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<jsp:include page="./head.html" />
<script src="/recruit/script/form-select.js"></script>
<script src="/recruit/script/datepicker.js"></script>
<script src="/recruit/script/check.js"></script>
<title>説明会の編集</title>
</head>
<body>
	<%
		String id = request.getParameter("id");
		GetSession gs = new GetSession();
		HashMap<String, String> map = gs.getSession(id);
		String[] area = {"東京", "北海道", "大阪", "富山", "福岡", "仙台"};
		String sh = map.get("start_time").split(":")[0];
		String sm = map.get("start_time").split(":")[1];
		String eh = map.get("end_time").split(":")[0];
		String em = map.get("end_time").split(":")[1];
	%>
	<div class="uk-width-medium-3-5 uk-container-center">
		<p class="uk-h1 uk-text-center">会社説明会の編集・更新</p>
		<p class="uk-h4 uk-text-danger uk-text-center" id="alert"></p>
		<form action="UpdateSession" class="uk-form uk-form-horizontal uk-width-2-3 uk-container-center" method="post">
			<div class="uk-form-row">
				<label class="uk-form-label uk-text-bold uk-text-large">開催地域</label>
				<select name="area">
					<%
						for(int i = 0; i < area.length; i++){
							if(area[i].equals(map.get("area"))){
					%>
					<option value="<%= area[i] %>" selected><%= area[i] %></option>
					<% } else {%>
					<option value="<%= area[i] %>"><%= area[i] %></option>		
					<% }} %>
				</select>
			</div>
			<div class="uk-form-row">
				<label class="uk-form-label uk-text-bold uk-text-large">開催日時</label>
				<input type="text" name="date" value="<%= map.get("date") %>" data-uk-datepicker="{format:'YYYY/MM/DD'}">
			</div>
			<div class="uk-form-row">
				<label class="uk-form-label"></label>
				<select name="start_h">
					<% 
						for(int i = 0; i < 24; i++){ 
							if(String.format("%02d", i).equals(sh)){
					%>
						<option value="<%= sh %>" selected><%= sh %></option>
					<% } else { %>
						<option value="<%= String.format("%02d", i) %>"><%= String.format("%02d", i) %></option>
					<% }} %>
				</select>
				:
				<select name="start_m">
					<% 
						for(int i = 0; i <= 50; i += 10){ 
							if(String.format("%02d", i).equals(sm)){
					%>
						<option value="<%= sm %>" selected><%= sm %></option>
					<% } else { %>
						<option value="<%= String.format("%02d", i) %>"><%= String.format("%02d", i) %></option>
					<% }} %>
				</select>
				~
				<select name="end_h">
					<% 
						for(int i = 0; i < 24; i++){ 
							if(String.format("%02d", i).equals(eh)){
					%>
						<option value="<%= eh %>" selected><%= eh %></option>
					<% } else { %>
						<option value="<%= String.format("%02d", i) %>"><%= String.format("%02d", i) %></option>
					<% }} %>
				</select>
				:
				<select name="end_m">
					<% 
						for(int i = 0; i <= 50; i += 10){ 
							if(String.format("%02d", i).equals(em)){
					%>
						<option value="<%= em %>" selected><%= em %></option>
					<% } else { %>
						<option value="<%= String.format("%02d", i) %>"><%= String.format("%02d", i) %></option>
					<% }} %>
				</select>
			</div>
			<div class="uk-form-row">
				<label class="uk-form-label uk-text-bold uk-text-large">定員</label>
				<input type="text" name="capacity" class="uk-form-width-mini" value="<%= map.get("capacity") %>" maxlength="2">
				&nbsp;人
			</div>
			<div class="uk-form-row">
				<label class="uk-form-label uk-text-bold uk-text-large">参加人数</label>
				<label class="uk-form-label" id="join"><%= map.get("number") %>&nbsp;人</label>
			</div>
			<div class="uk-form-row">
				<label class="uk-form-label"></label>
				<input type="submit" class="uk-button uk-button-large uk-button-primary" value="更新">
			</div>
			<input type="hidden" name="id" value="<%= id %>">
		</form>
	</div>
</body>
</html>