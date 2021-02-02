<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core" prefix="c" %>
<%@page import="java.util.ArrayList" %>
<%@page import="com.mytea.dto.ProductDto" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String id = (String)session.getAttribute("id");
		ArrayList<ProductDto> products = (ArrayList<ProductDto>)session.getAttribute("products");
	%>
	<h2>상품 목록</h2>
	<form action="" method="post">
		<div id="container">
			<a href='productList.jsp?name=${name}'><img src='../img/${product_fileName}'/></a>
			<p>${product.name}</p>
		</div>
	</form>
<%-- 	<c:set  --%>
<%-- 	<h2>상품 목록</h2> --%>
<%-- 	<c:forEach var="row" items=""> --%>
		
<%-- 	</c:forEach> --%>
</body>
</html>