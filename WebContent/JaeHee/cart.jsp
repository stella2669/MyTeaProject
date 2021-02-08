<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>cart</title>
<style>
@font-face {
	font-family: HoonSinamonR;
	src: url("../font/HoonSinamonR.ttf"); 
}

* {
	font-family: HoonSinamonR;
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

	<jsp:include page="../HyoYeon/user_navbar.jsp"></jsp:include>
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
			<input type="button" class="btn" value="더 추가하기" onclick=>
			<input type="button" class="btn" value="결제 하기">
			<input type="button" class="btn" value="비회원 결제하기">
		</div>
</body>
</html>