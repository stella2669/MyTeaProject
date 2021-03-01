<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Navigation Bar</title>
<style>
@font-face {
	font-family: HoonSinamonR;
	src: url("/MyTea/font/HoonSinamonR.ttf"); 
}

* {
	font-family: HoonSinamonR;
}
body {
	margin: 0;
	background-color: #f9f9f9;
}

.nav-container {
	display: flex;
	flex-direction: row;
	width: 100%;
	margin: 0;
/* 	padding: 0; */
	background-color: #94af76;	
	list-style-type: none;
}

.nav-item {
	padding: 20px;
	cursor: pointer;
}

.nav-item:nth-child(n+2):nth-child(-n+5):hover {
	background-color: #558b2f;
}

.nav-item a {
	font-size: 30px;
	font-weight: 500;
	text-align: center;
	text-decoration: none;
	color: #f8ffd7;
}
</style>
<script type="text/javascript">

	function logout(){
		alert('로그아웃 되었습니다.');	
// 	 	session.invalidate();
	 	location.href = "HyoYeon/login.jsp";
}

	
	</script>
</head>
<body>

	<nav>
		<ul class="nav-container">
			<c:choose>
				<c:when test="${not empty sessionScope.id }">
					<!-- if문, sessionScope영역에 id라는 값이 비어있지 않으면  -->
					<li class="nav-item"
						style="color: #345F53; font-weight: 900; font-size: 30px;">Tea
						Shop</li>
					<li class="nav-item"><a href="${contextPath}/product">product</a></li>
					<li class="nav-item"><a href="${contextPath}/cart">cart</a></li>
					<%-- 			<li class="nav-item"><a href="${contextPath}/login.jsp">login</a></li> --%>
					<li class="nav-item"><a
						href="${contextPath}/HyoYeon/update.jsp">update</a></li>
					<li class="nav-item" style="font-size: 25px">${sessionScope.id}
						님 환영합니다.</li>
					<li class="nav-item"><a
						href="${contextPath}/HyoYeon/logout.jsp"> 로그아웃 </a></li>
				</c:when>
				<c:otherwise>
					<li class="nav-item"
						style="color: #345F53; font-weight: 900; font-size: 30px;">Tea
						Shop</li>
					<li class="nav-item"><a href="${contextPath}/product">product</a></li>
					<li class="nav-item"><a href="${contextPath}/cart">cart</a></li>
					<li class="nav-item"><a href="${contextPath}/HyoYeon/update.jsp">update</a></li>
<!-- 					<li class="nav-item" style="font-size: 25px">로그아웃됨.</li> -->
				</c:otherwise>
			</c:choose>
		</ul>
	</nav>
</body>
</html>