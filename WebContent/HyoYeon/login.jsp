<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<title>로그인</title>

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

.button{
   width : 100%;
   height : 100px;
   text-align : center;
}


.btn{
   width : 300px;
   height: 100px;
   font-size : 200%;
   padding: 20px 20px;
   border-radius: 10px;
   background-color: #689f38;
}

#text{
	font-size: 25px;
}
#form {
	width: 450px;
	height: 350px;
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

input {
	font-size: 25px;
}
</style>
</head>
<body>

	<nav>
		<ul class="nav-container">
			<li class="nav-item" style="color:#345F53; font-weight:900; font-size:30px;">Tea Shop</li>
			<li class="nav-item"><a href="#">product</a></li>
			<li class="nav-item"><a href="#">cart</a></li>
<!-- 			<li class="nav-item"><a href="#">login</a></li> -->
			<li class="nav-item"><a href="#">logout</a></li>
		</ul>
	</nav>
    
	<div class="container-fluid text-center">
		<div class="row content">
			<div class="col-sm-12 text-center">
				<h1>로그인</h1>
				<hr>
				
				<h2>Login My Tea</h2>
				<form action="${contextPath}/login" method="post" id="form"> 
					<div id="id">
						ID:<br><input type="text" name="id" placeholder="id">
					</div>
					<div id="pw">
						PW:<br><input type="password" name="pw" placeholder="password">
					</div>
					
					
					<input type="submit" value="로그인" id="btn" size="50">
					<input type="button" value="회원가입 " id="btn" onClick="location.href='../SooYeon/join.jsp';">
					
				
				</form>
			</div>
		</div>
	</div>

	<footer class="container-fluid text-center">
		<p>Footer Text</p>
	</footer>
	
</body>
</html>