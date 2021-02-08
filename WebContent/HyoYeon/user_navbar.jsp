<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Navigation Bar</title>
<style>
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
#welcome{
	text-align: center;
}
</style>
</head>
<body>
	<nav>
		<ul class="nav-container">
<!-- 		<li><img src="../img/logo.png" height="90" width="90"></li> -->
			<li class="nav-item" style="color:#345F53; font-weight:900; font-size:30px;">Tea Shop</li>
			<li class="nav-item"><a href="admin_Insert.jsp">product</a></li>
			<li class="nav-item"><a href="admin_Modify.jsp">cart</a></li>
			<li class="nav-item"><a href="admin_Delete.jsp">login</a></li>
			<li class="nav-item"><a href="admin_Member.jsp">logout</a></li>
			<li id="welcome"><%=session.getAttribute("id") %>님 환영합니다. </li>
		</ul>
	</nav>
</body>
</html>