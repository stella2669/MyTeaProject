<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
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

#form{
	width: 500px;
 	border: 3px solid lightgray;
 	border-radius: 20px;
 	margin : 40px auto;
}

#container{
	border-radius: 20px;
	background-color: white;
	margin: 0 auto;
	padding: 20px;
	text-align: center;
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

button	{
	font-size: 25px;
}

select {
	width: 300px;
	font-size: 25px;
}

.input-file-button{
	width: 250px;
	height: 300px;
  	border-radius: 4px;
  	border: 1px solid lightgray;
  	background-color: lightgray;
  	cursor: pointer;
}
img{
	border-radius : 20px;
}
</style>
</head>
<body>
<jsp:include page="navigationBar.jsp"/>
	<div>
		<h1>상품 수정</h1>
		<form action="${contextPath}/modify/modifySelected.do" id="form">
			<div id="container" >
				<p><img src="../img/${dto.fileName}" id="loadImg" width="300px" style="margin-top: 20px;"></p>
<%-- 				<p><input type="file" name="product_fileName" value="../img/${dto.product_fileName}" id="imgAttach" name="imgAttach" onchange="LoadImg()" style="margin-left: 40px;"/></p> --%>
				<p><input type="text" value="${dto.fileName}" disabled></p>
				<p>
					<select name="category" id="category" required="required">
						<option value="category">Select Category</option>
						<option value="Flower" ${dto.category == 'Flower' ? 'selected="selected"' : '' }>Flower</option>
						<option value="Fruit" ${dto.category == 'Fruit' ? 'selected="selected"' : '' }>Fruit</option>
						<option value="Leaf" ${dto.category == 'Leaf' ? 'selected="selected"' : '' }>Leaf</option>
						<option value="etc." ${dto.category == 'etc.' ? 'selected="selected"' : '' }>etc.</option>
					</select>
				</p>
						
				<p><input type="text" name="name" value="${dto.name}" disabled>
				<input type="hidden" name="name" value="${dto.name}"></p>
				<p><input type="text" name="price" placeholder="price" value="${dto.price}" autocomplete="off"></p>
				<p><textarea name="content" cols="30" rows="4"placeholder="content" wrap="hard" style="resize: none; font-size:25px;">${dto.content}</textarea>
				<p><input style="width:100px;" type="submit" value="수정하기">&nbsp;&nbsp;&nbsp;<button type="button" style="width:100px;" onclick="history.back()">뒤로가기</button></p>
			</div>
		</form> 
	</div>
</body>
</html>