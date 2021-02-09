<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Bootstrap Example</title>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<style>
@font-face {
	font-family: HoonSinamonR;
	src: url("../font/HoonSinamonR.ttf"); 
}

* {
	font-family: HoonSinamonR;
}

.row.content {
	height: 1119px;
	text-align: center;
	vertical-align: middle;
}

footer {
	background-color: #555;
	color: white;
	padding: 15px;
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
#form {
	width: 450px;
	height: 300px;
	border: 3px solid lightgray;
	border-radius: 20px;
	margin: 80px auto;
	font-size: 24px;
}
#id {
	margin: 30px 80px;
	font-size: 30px;
}
#pw {
	margin: 0px 80px;
	font-size: 30px;
}
#btn {
	margin-top: 50px;
	padding: 20px 20px;
	border-radius: 10px;
	background-color: #689f38;
	font-size: 30px;
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
			<li class="nav-item"><a href="admin_Member.jsp">logout</a></li>
<%-- 			<li class="nav-item" id="text"><%=session.getAttribute("id") %>님 환영합니다. </li> --%>
<!-- 			<li class="nav-item" id="text">logout</li> -->
		</ul>
	</nav>
    
	<div class="container-fluid text-center">
		<div class="row content">
			<div class="col-sm-12 text-center">
				<h1>로그인</h1>
				<hr>
				
				<h2>Login My Tea</h2>
				<form action="${pageContext.request.contextPath}/login" method="post" id="form"> 
					<div id="id">
						ID: <input type="text" name="id" placeholder="id">
					</div>
					<div id="pw">
						PW: <input type="password" name="pw" placeholder="password">
					</div>
					<input type="submit" value="로그인" id="btn" size="50">
				</form>
			</div>
		</div>
	</div>

	<footer class="container-fluid text-center">
		<p>Footer Text</p>
	</footer>
	
</body>
</html>