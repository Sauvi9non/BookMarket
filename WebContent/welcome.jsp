<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href = "https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<title>Welcome</title>

</head>
<body>

<%-- 상단의 Home --%>
<%@ include file="menubar.jsp" %>

<%-- 방문 시각 --%>
<div class="container">
	<div class="text-right">
	<b>
		<%
		response.setIntHeader("Refresh", 1); //1초마다 시간 바뀌도록,
		Date visitTime = new Date();
		int visitHour = visitTime.getHours(); //시간: 0~24시 0~11시 AM, 12~23시 PM
		int visitMinute = visitTime.getMinutes();
		int visitSecond = visitTime.getSeconds();
		
		if(visitHour >= 0 && visitHour <=11) { //오전
			out.println("방문 시각: " + visitHour +":"+visitMinute+":"+visitSecond+" AM ");
		}
		else if(visitHour >= 12 && visitHour <=23) { //오후
			out.println("방문 시각: " + (visitHour-12) +":"+visitMinute+":"+visitSecond+" AM ");
		}
		
		%>
		</b>
	</div>
</div>
		
<%
	String greeting = "Bayes24" ;
	String tagline = "당신 근처의 서점";
%>


<%-- 쇼핑몰 대문 --%>
<div class = "jumbotron">
	<div class="container">
		<h1 class = "display-3">
			<a href="./books.jsp"> <%= greeting %> </a>
		</h1>
	</div>
</div>
	
<%-- 환영문구 --%>	
<div class = "container">
	<div class = "text-center">
		<h3> <%= tagline %></h3>		
	</div>
</div>


<%@ include file="footer.jsp" %>

</body>
</html>