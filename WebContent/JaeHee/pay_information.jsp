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

.pay{
	margin-left : 0px;
	margin-top : 100px;
	margin-right : 0px;
	margin-bottom : 0px;
}

h2{
	font-size: 30px;
	color : green;
}

fieldset{
	width : 500px;
	border-radius : 10px;
	text-align : center;
	margin : 0 auto;
	

}

legend{
	font-size : 50px;

}

form{
	font-size : 15px;
}

.btn{
	width : 100px;
	height: 30px;
	font-size : 100%;
	border-radius: 10px;
	background-color: #bcaaa4;
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
	<div class="pay">
	<fieldset>
		
		<legend>결제 하기</legend><br>
		
		<form>
			<h2>주문 정보</h2>
			<p>주문 정보 리스트 부분</p>
			<br><br>
			<h2>주문인 정보</h2>
			이름: <input type="text"><br>
			전화번호: <input type="tel" name="tel" required pattern="[0-9]{3}-[0-9]{4}-[0-9]{4}"
					title="***-****-****"><br><br>
			<h2>배송지 입력</h2>
			우편번호 : <input type="text">-<input type="text"><br>
			상세주소 : <input type="text"><br><br>
			<h2>결제 수단</h2>
			<button class = "btn" type="button">카드 결제</button><br><br>
		</form>
	
	</fieldset>
	</div>

</body>
</html>