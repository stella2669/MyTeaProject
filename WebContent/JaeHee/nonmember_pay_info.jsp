<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

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

.pay{
	margin-left : 0px;
	margin-top : 100px;
	margin-right : 0px;
	margin-bottom : 0px;
}

h2{
	font-size: 35px;
	color : green;
}

fieldset{
	width : 800px;
	border-radius : 10px;
	text-align : center;
	margin : 0 auto;
}

legend{
	font-size : 70px;

}

form{
	font-size : 25px;
}

.btn{
	width : 100px;
	height: 50px;
	font-size : 100%;
	border-radius: 10px;
	background-color: #689f38;
}
</style>
</head>
<body>
	
	<jsp:include page="../HyoYeon/user_navbar.jsp"></jsp:include>
	
		<div class="pay">
			<fieldset>
				<legend>결제 하기</legend><br>
				
				 <form action="${contextPath}/pay/mem" method="post">
					<h2>주문인 정보</h2>
					이름: <input type="text" style="font-size:25px;"><br><br>
					전화번호: <input type="tel" style="font-size:25px;"><br><br>
					이메일 : <input type="text" style="font-size:25px;">
						  - <input type="text" style="font-size:25px;"><br><br>
					<h2>배송지 입력</h2>
					우편번호 : <input type="text" style="font-size:25px;"><br><br>
					상세 주소 : <input type="text" style="font-size:25px;">
						 - <input type="text" style="font-size:25px;"><br><br>
						 
					<h2>배송시 요청사항</h2>
					<p><textarea cols="100" rows="10"></textarea></p><br><br>
				</form>
				<form action="${contextPath}/pay/payment.do" method="post">
					<input type="submit" class="btn" value="다음" ><br><br>
				</form>
			</fieldset>
		</div>
			
</body>
</html>