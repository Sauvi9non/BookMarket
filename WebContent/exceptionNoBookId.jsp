<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href = "https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<meta charset="UTF-8">
<title>ISBN번호 오류</title>
</head>
<body>
	<jsp:include page="menubar.jsp" />
	<div class="jumbotron">
		<div class="container">
			<h2 class="alert alert-danger">아직 입고되지 않은 도서입니다.</h2>
		</div>
	</div>
	
	<div class="container">
		<p><%= request.getRequestURL()%>?<%= request.getQueryString() %>
		<p><a href="books.jsp" class="btn btn-secondary"> 도서 목록 &raquo;</a>
	</div>
</body>
</html>