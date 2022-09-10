<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="book.Book" %>
<%@ page import="book.BookRepository" %>
<jsp:useBean id="bookVOK" class="book.BookRepository" scope="session" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href = "https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<title>도서 목록</title>
</head>
<body>
<%--
<%@ include file="menubar.jsp" %> 이거 안쓰는 이유는?
 --%>
	<jsp:include page="menubar.jsp" />
	<div class="jumbotron">
		<div class="container">
			<h3 class="display-5">도서 목록</h3>
		</div>
	</div>
	
	<%-- 도서 상품 목록 --%>
	<%
		BookRepository vok = BookRepository.getInstance();
		ArrayList<Book> listOfBooks = vok.getAllBooks();
	%>
	
	<div class="container">
		<div class="row" align="center">
			<%
				for(int i=0;i<listOfBooks.size();i++){
					Book book = listOfBooks.get(i);
			%>
			<div class = "col-md-4">
				<img src="C:\upload\<%=book.getFilename() %>" style="width: 100%">
				<h3><%=book.getName() %></h3>
				<p><%=book.getDescription() %></p>
				<p>정가:<%=book.getUnitPrice() %>원</p>
				<p> <a href="./book.jsp?id=<%=book.getBookId() %>" class="btn btn-secondary" role="button"> 상세 정보 &raquo;></a> </p>
			</div>
			<% } %>
		</div>
		<hr>
	</div>
	<jsp:include page="footer.jsp" />
</body>
</html>