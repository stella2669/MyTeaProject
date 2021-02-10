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

#list{
	width: 100%;
 	border-radius: 20px;
 	margin : 40px;
	text-align: left;
	font-size: 25px;
}

#container{
	width: 250px;
	height: 350px;
	display: inline-block;
	border-radius: 20px;
	background-color: white;
 	border: 2px solid lightgray;
	padding: 5px;
	text-align: center;
 	margin : 40px auto;
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

li{
	list-style-type: none;
	display: inline-block;
}
</style>
</head>
<body>
	<jsp:include page="../HyoYeon/user_navbar.jsp" flush="true"/>
	<h1 style="text-align:center; color: green;">상품 목록</h1>

	<h2 style="text-align:center; color: green;">수량을 입력해주세요!</h2>
	<h2 style="text-align:center; color: green;"><input type="radio" name="amount" value="10">10 <input type="radio" name="amount" value="20">20 <input type="radio" name="amount" value="30">30 (ea)</h2>
	<div id="list">
			<form action="" method="post">
		<ul>
			<c:forEach var="dto" items="${products}">
				<li>
					<input type="checkbox" name="product">
					<div id="container">
						<p><img src="/MyTea/img/${dto.fileName}"></p>
						<p><a href="${contextPath}/modify/selected.do?name=${dto.name}">${dto.name}</a></p>
						<p>${dto.category}</p>
						<p>+${dto.price}원</p>
					</div>
				</li>
			</c:forEach>
			</ul>
		</form>
		
	</div>
	
	
	
	
	<input type="button" value="장바구니 "  onclick="javascript:window.location='/MyTea/JaeHee/cart.jsp'"> 
</body>
</html>