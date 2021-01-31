<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style type="text/css">
img {
	margin: 100px auto;
	display: block; 
	position: relative;
}
h3{
	position: absolute;
	top: 44%;
	left: 42%;
}

#text a{
	text-decoration: none;
	color: green;
	border: 2px solid green;
	border-radius: 10px;
	padding: 10px;
	
}


</style>
</head>
<body>
<jsp:include page="../EunJi/navigationBar.jsp"></jsp:include> 
<div>
	<img src="../img/tea-bag.png">
</div>
<div id="text">
	<h3><a href="../EunJi/selectMenu">만들러가기</a></h3>
</div>

</body>
</html>








