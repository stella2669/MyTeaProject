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
	padding: 0;
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
#text{
	font-size: 25px;
}
</style>
</head>
<body>
	<nav>
		<ul class="nav-container">
			<li class="nav-item" style="color:#345F53; font-weight:900; font-size:30px;">ADMIN</li>
			<li class="nav-item"><a href="${contextPath}/EunJi/admin_Insert.jsp">Insert</a></li>
			<li class="nav-item"><a href="${contextPath}/modify">Modify</a></li>
			<li class="nav-item"><a href="${contextPath}/delete">Delete</a></li>
			<li class="nav-item"><a href="${contextPath}/EunJi/admin_Member.jsp">Member</a></li>
			<li class="nav-item" id="text"> <%=session.getAttribute("id") %>님 환영합니다. </li>
			<li class="nav-item" id="text">logout </li>
		</ul>
	</nav>
</body>
</html>