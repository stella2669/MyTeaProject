<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
#text{
	font-size: 25px;
}
</style>
</head>

<body>
	<nav>
		<ul class="nav-container">
			<li class="nav-item" style="color:#345F53; font-weight:900; font-size:30px;">Tea Shop</li>
			<li class="nav-item"><a href="../EunJi/productList.jsp">product</a></li>
			<li class="nav-item"><a href="../JaeHee/cart.jsp">cart</a></li>
			<li class="nav-item"><a href="login.jsp">login</a></li>
			<li class="nav-item"><a href="update.jsp">update</a></li>
			<li class="nav-item" id="text"><%=session.getAttribute("id") %>님 환영합니다. </li>
			<li class="nav-item" id="text"> logout <% session.invalidate();%></li>  <!--클릭시에 세션 정리하고픔 . -->
		</ul>
	</nav>
</body>
</html>



