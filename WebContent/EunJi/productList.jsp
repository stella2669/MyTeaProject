<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
#list{
	width: 100%;
 	border-radius: 20px;
 	margin : 40px;
	text-align: left;
}

#container{
	width: 250px;
	height: 300px;
	display: inline-block;
	border-radius: 20px;
	background-color: white;
 	border: 2px solid lightgray;
	padding: 5px;
	text-align: center;
 	margin : 40px auto;
}

input {
  width: 300px;
  font-size: 20px;
} 

select {
	width: 300px;
	font-size: 20px;
}

img{
	border-radius : 20px;
	width: 150px;
	height: 130px;
}
</style>
</head>
<body>
	<jsp:include page="navigationBar.jsp" flush="true"/>
	<h1 style="text-align:center; color: green;">메뉴 수정</h1>
	<div id="list">
		<c:forEach var="dto" items="${products}">
				<div id="container">
					<p><img src="/MyTea/img/${dto.product_fileName}"></p>
					<p><a href="${contextPath}/modify/selected.do?name=${dto.name}">${dto.name}</a></p>
					<p>${dto.category}</p>
					<p>+${dto.price}원</p>
				</div>
		</c:forEach>
	</div>
	
</body>
</head>
<body>
	<jsp:include page="navigationBar.jsp" flush="true"/>
	<h1 style="text-align:center; color: green;">상품 목록</h1>
	<div id="list">
		<h3>입수량을 입력해주세요! <input type="radio" name="amount" value="10">10 <input type="radio" name="amount" value="20">20 <input type="radio" name="amount" value="30">30</h3>
		<c:forEach var="dto" items="${products}">
			<input type="checkbox" name="product">
				<div id="container">
					<p><img src="/MyTea/img/${dto.product_fileName}"></p>
					<p><a href="${contextPath}/modify/selected.do?name=${dto.name}">${dto.name}</a></p>
					<p>${dto.category}</p>
					<p>+${dto.price}원</p>
				</div>
		</c:forEach>
	</div>
</body>
</html>