<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>cart</title>
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
	padding: 0;
	background-color: ivory;	
	list-style-type: none;
}

.nav-item {
	padding: 20px;
	cursor: pointer;
}

.nav-item:nth-child(n+2):nth-child(-n+5):hover {
	background-color: blue;
}

.nav-item a {
	font-size: 30px;
	font-weight: 500;
	text-align: center;
	text-decoration: none;
	color: green;
}

.information{
	weight : 100%;
	height : 400px;
	margin : 100px;
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
	background-color: #bcaaa4;

	
}

.tea{
	width : 300px;
	height: 300px;
	display: inline-block;
	margin: 100px;

}

img.tea_img{

	width: 450px;
	height: 450px;
	float : left;
	margin-top : 0px;
	margin-right : 30px;
	margin-bottom : 30px;
	margin-left : 200px;
}

p{
	margin : 200px;
	font-size:300%;
	text-align : center;
}
</style>
</head>
<body>
	<nav>
		<ul class="nav-container">
			<li class="nav-item" style="color:#345F53; font-weight:900; font-size:30px;">Make Your Tea</li>
			<li class="nav-item"><a href="../HyoYeon/MainTea.jsp">Main</a></li>
			<li class="nav-item"><a href="../EunJi/selectMenu.jsp">Make Tea</a></li>
			<li class="nav-item"><a href="cart.jsp">Cart</a></li>
		</ul>
	</nav>
	<br>
		<div class="information">
			<img class="tea_img" src="../img/default.png"/>
			<p>
				티 기본 : 3000원<br>
				사과 10ea : +1000원<br>
				...
			</p>
		</div>
		<br>
		<div class="button">
			<button class="btn" type="button">더 추가하기</button>
			<button class="btn" type="button">결제 하기</button>
		</div>
</body>
</html>