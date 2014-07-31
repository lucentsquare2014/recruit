<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<jsp:include page="./head.html" />
<script src="/recruit/script/form-select.js"></script>
<script src="/recruit/script/datepicker.js"></script>
<script src="/recruit/script/session_check.js"></script>
<style type="text/css">
label {
	text-align: center;
}
</style>
<title>会社説明会を作成</title>
</head>
<body>
	<div class="uk-width-medium-3-5 uk-container-center">
		<p class="uk-h1 uk-text-center">会社説明会の新規作成</p>
		<p class="uk-h4 uk-text-danger uk-text-center" id="alert"></p>
		<form action="CreateSession" class="uk-form uk-form-horizontal uk-width-2-3 uk-container-center" method="post">
			<div class="uk-form-row">
				<label class="uk-form-label uk-text-bold uk-text-large">開催地域</label>
				<select name="area">
					<option value="東京">東京</option>
					<option value="北海道">北海道</option>
					<option value="大阪">大阪</option>
					<option value="富山">富山</option>
					<option value="福岡">福岡</option>
					<option value="仙台">仙台</option>
				</select>
			</div>
			<div class="uk-form-row">
				<label class="uk-form-label uk-text-bold uk-text-large">開催日時</label>
				<input type="text" name="date" data-uk-datepicker="{format:'YYYY/MM/DD'}">
			</div>
			<div class="uk-form-row">
				<label class="uk-form-label"></label>
				<select name="start_h">
					<% for(int i = 0; i < 24; i++){ %>
						<option value="<%= String.format("%02d", i) %>"><%= String.format("%02d", i) %></option>
					<% } %>
				</select>
				:
				<select name="start_m">
					<% for(int i = 0; i <= 50; i += 10){ %>
						<option value="<%= String.format("%02d", i) %>"><%= String.format("%02d", i) %></option>
					<% } %>
				</select>
				~
				<select name="end_h">
					<% for(int i = 0; i < 24; i++){ %>
						<option value="<%= String.format("%02d", i) %>"><%= String.format("%02d", i) %></option>
					<% } %>
				</select>
				:
				<select name="end_m">
					<% for(int i = 0; i <= 50; i += 10){ %>
						<option value="<%= String.format("%02d", i) %>"><%= String.format("%02d", i) %></option>
					<% } %>
				</select>
			</div>
			<div class="uk-form-row">
				<label class="uk-form-label uk-text-bold uk-text-large">定員</label>
				<input type="text" name="capacity" class="uk-form-width-mini" maxlength="2">
				&nbsp;人
			</div>
			<div class="uk-form-row">
				<label class="uk-form-label"></label>
				<input type="submit" class="uk-button uk-button-large uk-button-primary" value="決定">
			</div>
		</form>
	</div>
</body>
</html>