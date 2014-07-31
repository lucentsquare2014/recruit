<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="session.GetSession, java.util.ArrayList, java.util.HashMap" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<jsp:include page="./head.html" />
<title>会社説明会</title>
</head>
<body>
	<%
		GetSession gs = new GetSession();
		String today = gs.getToday();
		String sql = "SELECT id, area, to_char(date, 'YYYY/MM/DD') AS date, start_time, end_time," +
		" capacity, number FROM session WHERE date >= '" + today + "' ORDER BY date ASC";
		ArrayList<HashMap<String, String>> list = gs.getSessionList(sql);
	%>
	<div class="uk-width-medium-1-2 uk-container-center">
		<p class="uk-h1">会社説明会</p><hr>
		<p>会社説明会開催！ <br>たくさんのご応募をお待ちしております。</p>
		<p class="uk-text-bold"><i class="uk-icon-chevron-right uk-text-primary"></i> 会社説明会</p>
		<p>&nbsp;<i class="uk-icon-stop"></i> 以下より希望の日程をお選びください。</p>
		<table class="uk-table">
			<tr>
				<th>選択</th>
				<th>開催日時</th>
				<th>開催地</th>
				<th>受付状態</th>
			</tr>
			<% 
				for(int i = 0; i < list.size(); i++){ 
					HashMap<String, String> map = list.get(i);
					String status = "";
					if(map.get("date").equals(today)){
						status = "受付終了";
					}else if(map.get("number").equals(map.get("capacity"))){
						status = "満席";
					}else{
						status = "空席あり";
					}
			%>
			<tr>
				<td>
				<% if(status.equals("空席あり")){ %>
					<input type="radio" name="select">
				<% }else{ %>
					<input type="radio" name="select" disabled>
				<% } %>
				</td>
				<td><%= map.get("date") %>&nbsp;&nbsp;<%= map.get("start_time") %>~<%= map.get("end_time") %></td>
				<td><%= map.get("area") %></td>
				<td><%= status %></td>
			</tr>
			<% } %>
		</table>
		
		<p class="uk-text-bold"><i class="uk-icon-chevron-right uk-text-primary"></i> 持参する物</p>
		<p>&nbsp;<i class="uk-icon-stop"></i> 会社説明会参加時： 履歴書(写真貼付)、筆記用具</p>
		<p>&nbsp;<i class="uk-icon-stop"></i> 面接時： 卒業見込証明書、成績証明書、健康診断書</p>
		<p>&nbsp;なお、お預りいたしました資料につきましては、採用の目的以外に使用することはありません。</p>
		<p class="uk-text-bold"><i class="uk-icon-chevron-right uk-text-primary"></i> 会場・お問い合せ先</p>
		<p>
			&nbsp;&nbsp;&nbsp;【本社】<br>&nbsp;&nbsp;&nbsp;〒135-0042<br>
			&nbsp;&nbsp;&nbsp;東京都江東区木場5-11-17　商工中金深川ビル4F<br>
			&nbsp;&nbsp;&nbsp;TEL: 03-5620-1400
		</p>
		<p>
			&nbsp;&nbsp;&nbsp;【北海道支店】<br>&nbsp;&nbsp;&nbsp;〒060-0032<br>
			&nbsp;&nbsp;&nbsp;札幌市中央区北2条東4丁目 サッポロファクトリー3条館4F<br>
			&nbsp;&nbsp;&nbsp;TEL: 011-207-4300
		</p>
		<p>
			&nbsp;&nbsp;&nbsp;【富山営業所】<br>&nbsp;&nbsp;&nbsp;〒930-0005<br>
			&nbsp;&nbsp;&nbsp;富山県富山市新桜町2-24　トミ第一ビル7F<br>
			&nbsp;&nbsp;&nbsp;TEL: 076-444-5305
		</p>
		<p>
			&nbsp;&nbsp;&nbsp;【大阪営業所】<br>&nbsp;&nbsp;&nbsp;〒541-0042<br>
			&nbsp;&nbsp;&nbsp;大阪市中央区今橋2-2-17　今川ビルディング8F<br>
			&nbsp;&nbsp;&nbsp;TEL: 06-6209-7201
		</p>
		<p>&nbsp;&nbsp;&nbsp;採用担当：管理部 篠山</p>
		<p>&nbsp;<i class="uk-icon-stop"></i> 電話・メールでのお申込みも承っております</p>
		<p>&nbsp;&nbsp;&nbsp;email:
			<a href="mailto:recruit@lucentsquare.co.jp">recruit@lucentsquare.co.jp</a>
		</p>
		<p>&nbsp;<i class="uk-icon-stop"></i> リクナビでのエントリーはこちらから</p>
		<p>&nbsp;&nbsp;&nbsp;
			<a href="http://job.rikunabi.com/2015/company/top/r123110008/">
				<img src="/recruit/images/rikunavi2015.gif">
			</a>
		</p>
	</div>
</body>
</html>