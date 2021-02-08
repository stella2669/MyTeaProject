<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 | 메뉴 추가</title>
<script type="text/javascript">
/* 파일 삽입 시 이미지 미리보기 */
	function LoadImg(){
		var load = document.querySelector('img');
		var file = document.querySelector('input[type=file]').files[0];
		var reader = new FileReader();
		
		reader.addEventListener("load",function(){
			load.src = reader.result;
		}, false);
		
		if(file){
			reader.readAsDataURL(file);
		}
	}
</script>
<style>
@font-face {
	font-family: HoonSinamonR;
	src: url("../font/HoonSinamonR.ttf"); 
}

* {
	font-family: HoonSinamonR;
}

#list{
	width: 100%;
 	border-radius: 20px;
 	margin : 40px;
	text-align: left;
	font-size: 30px;
}

#container{
	width: 250px;
	height: 370px;
	display: inline-block;
	border-radius: 20px;
	background-color: white;
 	border: 2px solid lightgray;
	padding: 5px;
	text-align: center;
 	margin : 19px;

}

h1 {
	text-align: center;
	color: green;
	font-size: 40px;
}

input {
  width: 300px;
  font-size: 25px;
} 

select {
	width: 300px;
	font-size: 30px;
}

img{
	border-radius : 20px;
	width: 150px;
	height: 130px;
}
</style>
</head>
<body>
	<jsp:include page="navigationBar.jsp" flush="true"/>
	<h1>메뉴 수정</h1>
	<div id="list">
		<c:forEach var="dto" items="${products}">
				<div id="container">
					<p><img src="/MyTea/img/${dto.fileName}"></p>
					<p><a href="${contextPath}/modify/selected.do?name=${dto.name}">${dto.name}</a></p>
					<p>${dto.category}</p>
					<p>+${dto.price}원</p>
				</div>
		</c:forEach>
	</div>
	
</body>
</html>