<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 | 메뉴 삭제</title>
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
	font-size: 30px;
}

#container{
	width: 250px;
	height: 370px;
	display: inline-block;
	border-radius: 20px;
	background-color: white;
 	border: 2px solid lightgray;
	padding: 5px;
	text-align: center;
 	margin : 19px;

}

h1 {
	text-align: center;
	color: green;
	font-size: 40px;
}

input {
  width: 300px;
  font-size: 25px;
} 

select {
	width: 300px;
	font-size: 30px;
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
	<h1>메뉴 삭제</h1>
	<div id="list">
		<c:forEach var="dto" items="${products}">
				<div id="container">
					<p><img src="/MyTea/img/${dto.fileName}"></p>
					<p><a href="${contextPath}/delete/selected.do?name=${dto.name}">${dto.name}</a>
					<input type="hidden" name="name" value="${dto.name}"></p>
					<p>${dto.category}</p>
					<p>+${dto.price}원</p>
				</div>
		</c:forEach>
	</div>
</body>
</html>