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

.information{
	weight : 100%;
	height : 400px;
	margin : 100px;
}

form{
	display : inline;
}

.button{
	width : 100%;
	height : 100px;
	text-align : center;
}

.decide{
	width : 75%;
	height : 180px;
	text-align : right;
}

.btn{
	width : 300px;
	height: 100px;
	font-size : 200%;
	padding: 20px 20px;
	border-radius: 10px;
	background-color: #689f38;
}

.choose{
	width : 200px;
	height: 70px;
	font-size : 200%;
	padding: 20px 20px;
	border-radius: 10px;
	background-color: #689f38;
	
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
		
		<div class="decide">
			<form action="${contextPath}/pay/add.do" method="post">
				<div class="information">
				<img class="tea_img" src="../img/default.png"/>
				<p>
				
				<c:forEach var="dto" items="${item}">
					
					${dto.name}
					
				</c:forEach>
				총금액 : 
					<br>
					사과 10ea : +1000원<br>
					...
				</p>
				</div>
				<br>
				<input type="submit" class="choose" value="더 추가하기"> <!-- /pay/add.do -->
				<button type="button" class="choose" name="delete.do">삭제</button> <!-- /pay/delete.do -->
				<button type="button" class="btn" value="결제하기">결제하기</button> <!-- /pay/member.do -->
				<button type="button" class="btn" value="비회원 결제하기">비회원 결제하기</button> <!-- /pay/no_member.do -->
			</form>

		</div>
</body>
</html>