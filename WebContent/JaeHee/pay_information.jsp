<%@ page import="com.mytea.pay.PayinformationDao" %>
<%@ page import="com.mytea.pay.PayinformationDto" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
request.setCharacterEncoding("UTF-8");
String id = request.getParameter("id");
PayinformationDao dao = PayinformationDao.getInstance();
PayinformationDto dto = new PayinformationDto();
%>

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
	background-color: #689f38;
}

</style>
</head>
<body>
	
	<jsp:include page="../HyoYeon/user_navbar.jsp"></jsp:include>
	
	<%
		if(dao.confirmId(id)==1){
			dao.getinfo(id);
	%>
		<div class="pay">
			<fieldset>
				<legend>결제 하기</legend><br>
				
				<form>
					<h2>주문 정보</h2>
					<p>주문 정보 리스트 부분</p>
					<br><br>
					<h2>주문인 정보</h2>
					이름: <input type="text" value="<%=dto.getName()%>"><br>
					전화번호: <input type="tel" value="<%=dto.getPhone()%>"><br><br>
					<h2>배송지 입력</h2>
					우편번호 : <input type="text" value="<%=dto.getPost()%>"><br>
					상세주소 : <input type="text" value="<%=dto.getAddress()%>"><br><br>
					<h2>결제 수단</h2>
					<button class = "btn" type="button">카드 결제</button><br><br>
				</form>
			
			</fieldset>
			</div>
	<%
		}
	%>
	
	
	<%
		if(dao.confirmId(id)==0){ 
	%>
	
	<div class="pay">
		<fieldset>
		<legend>결제 하기</legend><br>
		
		<form>
			<h2>주문 정보</h2>
			<p>주문 정보 리스트 부</p>
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
	
	<%
		} 
	%>
</body>
</html>