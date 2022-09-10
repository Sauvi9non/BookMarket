<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="book.Book" %>
<%@ page import="book.BookRepository" %>
<%@ page errorPage="exceptionNoBookId.jsp" %>
<jsp:useBean id="bookVOK" class="book.BookRepository" scope="session" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href = "https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<title>상세 정보</title>
<script type="text/javascript">
	function addToCart(){
		if (confirm("상품을 장바구니에 추가하시겠습니까? ")) {
			document.addForm.submit();
		}
		else {
			document.addForm.reset();
		}
	}
</script>
</head>
<body>
<jsp:include page="menubar.jsp" />
<div class = "jumbotron">
	<div class="container">
		<h3 class="display-3">도서 정보</h3>
	</div>
</div>

<%
	String id = request.getParameter("id");
	BookRepository vok = BookRepository.getInstance();
	Book book = vok.getBookById(id);
%>

<div class = "container">
	<div class="row">
		<div class="col-md-5">
			<img src="C:\upload\<%=book.getFilename() %>" style="width: 100%" > <%--image 파일로했을때는 괜찮았는데 왜 이것만 하면 오류가...?books로 들어가면 괜찮은데 --%>
		</div>
	
		<div class="col-md-6">
			<h3><%=book.getName() %></h3>
			<p><%=book.getDescription() %></p>
			<p><b>상품코드 : </b><span class="badge badge-danger">
				<%=book.getBookId() %></span>
			<p><b>출판사</b> : <%=book.getPublisher() %></p>
			<p><b>분류</b> : <%=book.getCategory() %></p>
			<p><b>재고 수</b> : <%=book.getUnitsInStock() %></p>
			<p><b>페이지 수</b> : <%=book.getTotalPages() %></p>
			<p><b>출판일</b> : <%=book.getReleaseDate() %></p>
			<p><b>상태</b> : <%=book.getCondition() %></p>
			<h4><%=book.getUnitPrice() %>원</h4>
			<p><form name="addForm" action ="./addCart.jsp?id=<%=book.getBookId() %>" method="post">
			
			<a href="#" class="btn btn-info" onclick="addToCart()">상품 주문 &raquo;</a>
			<a href="./cart.jsp" class="btn btn-warning">장바구니 &raquo;</a>
			<a href="./books.jsp" class="btn btn-secondary">도서 목록 &raquo;</a>
			</form>
		</div>
	</div>
	<hr>
</div>
<jsp:include page="footer.jsp" />
</body>
</html>