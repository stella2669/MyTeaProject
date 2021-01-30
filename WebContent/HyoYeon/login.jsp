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
	/* font-family: hzStyleFont;
	src: url("../font/ImcreSoojin.ttf"); */
}
* {
	font-family: hzStyleFont;
}
/* Remove the navbar's default margin-bottom and rounded borders */
.navbar {
	margin-bottom: 0;
	border-radius: 0;
	border: none;
	background-color: #b1bfca;
}
/* Set height of the grid so .sidenav can be 100% (adjust as needed) */
.row.content {
	height: 1119px;
	text-align: center;
	vertical-align: middle;
}
/* Set gray background color and 100% height */
.sidenav {
	padding-top: 20px;
	background-color: #f1f1f1;
	height: 100%;
}
/* Set black background color, white text and some padding */
footer {
	background-color: #555;
	color: white;
	padding: 15px;
}
/* On small screens, set height to 'auto' for sidenav and grid */
@media screen and (max-width: 767px) {
	.sidenav {
		height: auto;
		padding: 15px;
	}
	.row.content {
		height: auto;
	}
}
#form {
	width: 450px;
	height: 400px;
	border: 3px solid lightgray;
	border-radius: 20px;
	margin: 80px auto;
	font-size: 24px;
}
#id {
	margin: 30px 80px;
}
#pw {
	margin: 0px 80px;
}
#btn {
	margin-top: 50px;
	padding: 20px 20px;
	border-radius: 10px;
	background-color: #bcaaa4;
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

				<h3>Login coffee shop</h3>
				<form action="" method="post" id="form"> 
					<div id="id">
						ID:<input type="text" placeholder="id" >
					</div>
					<div id="pw">
						PW:<input type="password" placeholder="password">
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