<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.*" %>
<%@ page import="com.oreilly.servlet.multipart.*" %>        
<%@ page import="java.util.*" %>
<%@ page import="book.Book" %>
<%@ page import="book.BookRepository" %>

<%
	request.setCharacterEncoding("utf-8");

	String filename = "";
	String realFolder = "C:\\upload"; //절대 경로
	int maxSize = 5 * 1024 * 1024; //업로드 파일의 최대 크기
	String encType = "utf-8"; //인코딩 유형

	MultipartRequest multi = new MultipartRequest(request, realFolder,
			maxSize, encType,new DefaultFileRenamePolicy()); //Default...는 파일 이름 중복 시 정책

			//request.getParameter에서 multi.getParameter로
	String bookId = multi.getParameter("bookId"); //책 아이디
	String name = multi.getParameter("name"); //책 이름
	String unitPrice = multi.getParameter("unitPrice"); //Integer
	String author = multi.getParameter("author"); //작가
	String description = multi.getParameter("description"); //설명
	String publisher = multi.getParameter("publisher"); //출판사
	String category = multi.getParameter("category"); //분류
	String unitsInStock = multi.getParameter("unitsInStock"); //long재고
	String totalPages = multi.getParameter("totalPages"); // long페이지 수
	String releaseDate = multi.getParameter("releaseDate"); //발간일
	String condition = multi.getParameter("condition"); //신규 도서,중고 도서, 전자책

	Integer price;
	if (unitPrice.isEmpty()) {
		price = 0;
	}
	else {
		price = Integer.valueOf(unitPrice);
	}
	
	long stock;
	if (unitsInStock.isEmpty()){
		stock = 0;
	}
	else {
		stock = Long.valueOf(unitsInStock);
	}
	
	long pages;
	if (totalPages.isEmpty()){
		pages = 0;
	}
	else {
		pages = Long.valueOf(totalPages);
	}
	
	Enumeration files = multi.getFileNames();
	String fname = (String) files.nextElement();
	String fileName = multi.getFilesystemName(fname);
	
	BookRepository vok = BookRepository.getInstance();
	
	Book newBook = new Book();
	newBook.setBookId(bookId);
	newBook.setName(name);
	newBook.setUnitPrice(price);
	newBook.setDescription(description);
	newBook.setAuthor(author);
	newBook.setPublisher(publisher);
	newBook.setCategory(category);
	newBook.setUnitsInStock(stock);
	newBook.setTotalPages(pages);
	newBook.setReleaseDate(releaseDate);
	newBook.setCondition(condition);
	newBook.setFilename(fileName);
	
	vok.addBook(newBook);
	
	response.sendRedirect("books.jsp");

%>