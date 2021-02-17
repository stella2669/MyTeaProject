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
@font-face {
	font-family: HoonSinamonR;
	src: url("../font/HoonSinamonR.ttf");
}

* {
	font-family: HoonSinamonR;
}

/* input[type=radio] { */
/* 	font-size: 25px; */
/* } */

#list {
	width: 100%;
	border-radius: 20px;
	margin: 40px;
	text-align: left;
	font-size: 25px;

}

#container {
	width: 250px;
/* 	height: 370px; */
	display: inline-block;
	border-radius: 20px;
	background-color: white;
	border: 2px solid lightgray;
	padding: 5px;
	text-align: center;
	margin: 20px 10px 0px 10px;
}

select {
	width: 300px;
	font-size: 20px;
}

img {
	border-radius: 20px;
	width: 150px;
	height: 130px;
	border: 1px solid lightgray
}


li {
	list-style-type: none;
	display: inline-block;
}


</style>
</head>
<body>
	<jsp:include page="../HyoYeon/user_navbar.jsp" flush="true"/>
	<h1 style="font-size: 40px; text-align:center; color: green; margin-top:40px;">상품 목록</h1>
		<h1 style="text-align:center; color: green; margin: 40px 0;">수량을 입력해주세요!</h1>
		
		<form action="${contextPath}/cart/addCart.do" method="post" style="margin-bottom:40px;">
		<h1 style="text-align:center; color: green;"><input type="radio" name="amount" value="10" required>10 <input type="radio" name="amount" value="20">20 <input type="radio" name="amount" value="30">30 (ea)</h1>
		<div id="list">	
			<ul>
				<c:forEach var="dto" items="${products}">
					<li>
						<div id="container">
							<div style="margin:15px;">
								<label for="${dto.name}"><img src="/MyTea/img/${dto.fileName}"></label>
	<%-- 							<p><a href="${contextPath}/modify/selected.do?name=${dto.name}">${dto.name}</a></p> --%>
								<p>${dto.name}</p>
								<p>${dto.category}</p>
								<input style="zoom: 1.5;" type="checkbox" id="${dto.name}" name="product" value="${dto.name}">
								<p>+${dto.price}원</p>
							</div>
						</div>
					</li>
				</c:forEach>
			</ul>
		</div>
		<div style="text-align: center;">
			<input style="zoom:1.5;"type="submit" value="장바구니 넣기"> 
		</div>

		</form>
</body>
</html>