<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Bootstrap Example</title>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<style>
@font-face {
	font-family: HoonSinamonR;
	src: url("../font/HoonSinamonR.ttf"); 
}

* {
	font-family: HoonSinamonR;
}

.row.content {
	height: 1119px;
	text-align: center;
	vertical-align: middle;
}

footer {
	background-color: #555;
	color: white;
	padding: 15px;
}
/* @media screen and (max-width: 767px) { */
/* 	.sidenav { */
/* 		height: auto; */
/* 		padding: 15px; */
/* 	} */
/* 	.row.content { */
/* 		height: auto; */
/* 	} */
/* } */
#form {
	width: 450px;
	height: 300px;
	border: 3px solid lightgray;
	border-radius: 20px;
	margin: 80px auto;
	font-size: 24px;
}
#id {
	margin: 30px 80px;
	font-size: 30px;
}
#pw {
	margin: 0px 80px;
	font-size: 30px;
}
#btn {
	margin-top: 50px;
	padding: 20px 20px;
	border-radius: 10px;
	background-color: #689f38;
	font-size: 30px;
}
</style>
</head>
<body>

	<!-- Navigation -->
    <jsp:include page="../EunJi/navigationBar.jsp"/>
    
	<div class="container-fluid text-center">
		<div class="row content">
			<div class="col-sm-12 text-center">
				<h1>로그인</h1>
				<hr>

				<h2>Login My Tea</h2>
				<form action="${pageContext.request.contextPath}/login" method="post" id="form"> 
					<div id="id">
						ID: <input type="text" name="id" placeholder="id">
					</div>
					<div id="pw">
						PW: <input type="password" name="pw" placeholder="password">
					</div>
					<input type="submit" value="로그인" id="btn" size="50">
				</form>
			</div>
		</div>
	</div>

	<footer class="container-fluid text-center">
		<p>Footer Text</p>
	</footer>
	
</body>
</html>