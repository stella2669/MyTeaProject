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
	top: 44%;
}
h3{
	position: absolute;
	top: 44%;
	left: 41%;
}

#text a{
	text-decoration: none;
	color: #2e7d32;
	border: 3px solid #2e7d32;
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
	<h3><a href="../EunJi/selectMenu.jsp">만들러가기</a></h3>
</div>

</body>
</html>








