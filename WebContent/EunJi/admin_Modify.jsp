<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
#form{
	width: 500px;
   	height: 700px;
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

input {
  width: 300px;
  font-size: 20px;
} 

select {
	width: 300px;
	font-size: 20px;
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
		<h1 style="text-align:center; color: green;">메뉴 추가</h1>
		<form action="" id="form" method="post">
			<div id="container" >
			<p><img src="<%=  %>" id="loadImg" width="300px" onerror="this.src='../img/default.png'" style="margin-top: 20px;"></p>
			<p><input type="file" id="imgAttach" name="imgAttach" onchange="LoadImg()" style="margin-left: 40px;"/></p>
			<p>
						<select name="category" required="required">
							<option value="category">select category</option>
							<option value="coffee">Coffee</option>
							<option value="nonCoffee">NonCoffee</option>
							<option value="tea">Tea</option>
							<option value="blended">Blended</option>
							<option value="etc">etc.</option>
						</select>
						</p>
						
						<p><input type="text" name="name" placeholder="name" autocomplete="off" value="<%= %>"></p>
						<p><input type="text" name="price" placeholder="price" autocomplete="off" value="<%= %>"></p>
						<p><textarea name="content" cols="40" rows="4" wrap="hard" style="resize: none;"><%= %></textarea>
						<p><input style="width:100px;" type="submit" value="수정"></p>
					</div>

				</form> 
			</div>
	
</body>
</html>