<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href = "https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<script type="text/javascript" src="./resource/jvscrpt/validationTest.js"></script>
<title>신규 등록</title>
</head>
<body>
	
	<fmt:setLocale value='<%= request.getParameter("language") %>' />
	<fmt:bundle basename="bundle.message">

	<jsp:include page="menubar.jsp" />
	<div class="jumbotron">
		<div class="container">
			<h3 class="display-3"><fmt:message key= "title" /></h3>
		</div>
	</div>
	
	<div class="container">
		<div class="text-right">
			<a href="?language=ko" >한국어</a>|<a href="?language=en">ENGLISH	</a>
			
			<a href="logout.jsp" class="btn btn-sm btn-success pull-right">logout</a>
		</div>
	
		<form name="newBook" action="./processAddBook.jsp" class="form-horizontal" method="post" enctype="multipart/form-data">
		
			<div class="form-group row">
				<label class="col-sm-2"><fmt:message key="bookId" /></label>
				<div class="col-sm-3">
					<input type="text" name="bookId" id="bookId" class="form-control">
 				</div>
			</div>
			
			<div class="form-group row">
				<label class="col-sm-2"><fmt:message key="name" /></label>
				<div class="col-sm-3">
					<input type="text" name="name" id="name" class="form-control">
 				</div>
			</div>
			
			<div class="form-group row">
				<label class="col-sm-2"><fmt:message key="unitPrice" /></label>
				<div class="col-sm-3">
					<input type="text" name="unitPrice" id="unitPrice" class="form-control">
 				</div>
			</div>
			
			<div class="form-group row">
				<label class="col-sm-2"><fmt:message key="description" /></label>
				<div class="col-sm-5">
					<textarea name="description" cols="50" rows="3" class="form-control">10자 이상 적어주세요.</textarea>
 				</div>
			</div>
			
			<div class="form-group row">
				<label class="col-sm-2"><fmt:message key="publisher" /></label>
				<div class="col-sm-3">
					<input type="text" name="publisher" class="form-control">
 				</div>
			</div>
			
			<div class="form-group row">
				<label class="col-sm-2"><fmt:message key= "category"/></label>
				<div class="col-sm-3">
					<input type="text" name="category" class="form-control">
 				</div>
			</div>
			
			<div class="form-group row">
				<label class="col-sm-2"><fmt:message key="unitsInStock" /></label>
				<div class="col-sm-3">
					<input type="text" name="unitsInStock" id="unitsInStock" class="form-control">
 				</div>
			</div>
			
			<div class="form-group row">
				<label class="col-sm-2"><fmt:message key="totalPages" /></label>
				<div class="col-sm-3">
					<input type="text" name="totalPages" class="form-control">
 				</div>
			</div>
			
			<div class="form-group row">
				<label class="col-sm-2"><fmt:message key="releaseDate" /></label>
				<div class="col-sm-3">
					<input type="text" name="releaseDate" id="releaseDate" class="form-control">
 				</div>
			</div>
			
			<div class="form-group row">
				<label class="col-sm-2"><fmt:message key= "condition"/></label>
				<div class="col-sm-5">
					<input type="radio" name="condition"  value="New"> <fmt:message key= "condition_New"/>
					<input type="radio" name="condition" value="Use"> <fmt:message key= "condition_Used"/>
					<input type="radio" name="condition" value="Ebook"> <fmt:message key= "condition_Ebook"/>
 				</div>
			</div>
			
			<div class="form-group row">
				<label class="col-sm-2"><fmt:message key= "bookImage"/></label>
				<div class="col-sm-5">
					<input type="file" name="bookImage" class="form-control">
				</div>
			</div>
			
			<div class="form-group row">
				<div class="col-sm-offset-2 col-sm-10">
					<input type="button" class="btn btn-primary" value="<fmt:message key= "button"/>" onclick="CheckAddBook()">
 				</div>
			</div>
		</form>
	</div>
</fmt:bundle>
</body>
</html>