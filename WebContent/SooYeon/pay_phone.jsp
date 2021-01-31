<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {

		$(".open").on('click', function() {
			$(".popup_2").show();
			$(".dim").show();

		});
	});
</script>

<style>
.payment_select {
	text-align: center;
}

.popup_1, .popup_2, .popup_3, .popup_4 {
	display: none;
	position: fixed;
	left: 50%;
	top: 50%;
	z-index: 100;
	padding: 52px 60px 60px;
	width: 720px;
	height: 783px;
	transform: translate(-50%, -50%);
	box-sizing: border-box;
	background: #fff;
	position: fixed;
	border: 1px solid red;

	/* box-shadow: 0 0 10px rgba(0, 0, 0, 0.5);
	
	border-radius: 5px;
	text-align: right;
	opacity: 0;
	transition: all 0.5s; */
}

.popup_2 h2 {
	padding: 0 0 42px;
	border-bottom: 3px solid #444;
	font-weight: normal;
	font-size: 36px;
	color: #222;
	text-align: center;
	line-height: 100%;
	color: #222;
}

.popup_2 close {
	position: absolute;
	right: 40;
	top: 40;
	width: 41px;
	height: 41px;
	background: url(../img/btn-close.png) no-repeat;
	color: transparent;
}

.popup_2 .con {
	padding: 40 78px; /* 체크: 좌우여백 */
	border-bottom: 1px solid #e8e8e8;
}

.agree {
	position: relative;
	margin: 28px 0 0;
	border: 1px solid #e8e8e8;
	padding: 0 30px;
	height: 60px;
	line-height: 60px;
	border: 1px solid #e8e8e8;
}

.agree label span {
	color: #de4f41;
}

.agree a.view {
	position: absolute;
	right: 30px;
	top: 15px;
	width: 93px;
	height: 30px;
	border: 1px solid #ddd;
	text-align: center;
	line-height: 30px;
	border-radius: 3px;
	font-size: 14px;
}

.dim {
	display: none;
	position: fixed;
	left: 0;
	top: 0;
	z-index: 99;
	width: 100%;
	height: 100%;
	background: rgba(0, 0, 0, 0.5);
	opacity: 0;
	transition: all 0.5s;
}

table.option {
	border-bottom: 1px solid #e8e8e8;
}

table.option th, table.option td {
	padding: 0 0 10px; /* 체크: 줄간격 /원래는 20px*/
	text-align: left; /*체크*/
}

table.option th {
	padding-top: 15px;
	vertical-align: top;
	font-size: 14px;
	color: #222;
	text-align: left;
	font-weight: normal;
}

table.option tr:last-child th, table.option tr:last-child td {
	padding: 0 0 30px;
}

select {
	height: 32px;
	font-size: 14px;
	color: #373737;
	border: 1px solid #e8e8e8;
	background: #fff;
}

.id_2 {
	width: 5%;
}

input /* [type="date"] */ {
	/* width: 50%; */
	height: 32px;
	font-size: 14px;
	color: #373737;
	border: 1px solid #e8e8e8;
	background: #fff;
	text-decoration: none;
	text-indent: 20px; /* 들여쓰기 */
	transition: all 0.5s;
	vertical-align: middle;
	border-radius: 3px;
}

/* input:placeholder {color: #999; font-size: 14px;} 26:42 */
/* select:focus,
input:focus {border: 1px solid red} ?? */
input[type="checkbox"], input[type="radio"] {
	position: absolute;
	left: -3000%;
}

input[type="checkbox"]+label, input[type="radio"]+label {
	font-size: 14px;
	color: #666;
}

input[type="checkbox"]+label:before, input[type="radio"]+label:before {
	content: "";
	display: inline-block;
	width: 20px;
	height: 20px;
	border: 1px solid #ddd;
	margin: 0 10px 0 0;
	background: #f4f4f4;
	vertical-align: middle;
	box-sizing: border-box;
	transition: all 0.3s;
}

input[type="checkbox"]:checked+label:before, input[type="radio"]:checked+label:before
	{
	border: :7px solid #666;
}

.txt_center {
	text-align: center;
	padding: 30px 0 0;
}

.submit, .reset {
	display: inline-block;
	width: 170px;
	height: 50px;
	background: #de4f41;
	line-height: 50px;
	color: #fff;
	text-align: center;
	border-radius: 3px;
}

ul, ol, li {
	font-size: 14px; 
	display: inline-block;
	list-style: none;
}

img {
	border: 0;
}

a {
	color: #000;
	text-decoration: none;
}

a:link, a:hover, a:active {
	text-decoration: none;
}
/* table{ border-spacing: 0; border-collapse: collapse;} */
</style>
</head>
<body>
	<!-- Navigation -->
	<jsp:include page="../EunJi/navigationBar.jsp" />

	<div class="container-fluid text-center">
		<div class="row content" style="text-align: center;">
			<h1>결제 방법 선택</h1>
			<hr>
			<div class="payment_select">
				<table style="text-align: center;">
					<tr>
						<td><a href="#" class="open"><img
								src="../img/btn-close.png" height="200px" width="200px"></a>
							<h2>신용카드</h2></td>
						<td><img id="credit" src="../img/credit-card.png"
							onclick="location:'#'">
							<h2>실시간 계좌이체</h2></td>
						<td><img id="credit" src="../img/credit-card.png"
							onclick="location:'#'">
							<h2>휴대폰</h2></td>
						<td><img id="credit" src="../img/credit-card.png"
							onclick="location:'#'">
							<h2>나중에 결제</h2></td>
					</tr>
				</table>
			</div>
		</div>
	</div>
	<div class="popup_2">
		<h2>휴대폰 결제</h2>
		<div class="con">
			<table class="option">
				<colgroup>
					<col style="width: 111px">
					<col>
				</colgroup>
				<tr>
					<th><label for="list1">상품명</label></th>
					<td id="list1"><%="#"%></td>
				</tr>
				<tr>
					<th><label for="list2">결제금액</label></th>
					<td id="list2"><%="#"%></td>
				</tr>

				<tr>
					<th><label for="list3">결제일</label></th>
					<td id="list3"><%="#"%></td>
				</tr>
				<tr>
					<th><label for="list4">통신사</label></th>
					<td id="list4"><ul>
							<li><input type="radio">SKT</li>
							<li><input type="radio">KT</li>
							<li><input type="radio">LG</li>
							<li><input type="radio">알뜰폰 <select>
									<option>선택해주세요</option>
									<option>KCT</option>
									<option>헬로모바일</option>
									<option>SK7Mobile</option>
							</select></li>
						</ul></td>
				</tr>
				<tr>
					<th><label for="list5">주민번호</label></th>
					<td id="list5"><input type="text" id="id">&nbsp;&nbsp;&nbsp;-&nbsp;&nbsp;&nbsp;<input
						type="text" id="id_2" class="id_2"> ******</td>
				</tr>
				<tr>
					<th><label for="list6">휴대폰결제 비밀번호</label></th>
					<td id="list6"><ul>
							<li><input type="radio">사용함&nbsp;&nbsp;&nbsp;</li>
							<li><input type="radio">사용안함(일반결제)</li>
						</ul></td>
				</tr>
				<tr>
					<th><label for="list7">인증번호</label></th>
					<td id="list7"><input type="text" id="인증번호"
						placeholder="인증번호 입력">&nbsp;&nbsp;
						<button type="button" id="certify" class="certify">요청</button></td>
				</tr>
			</table>
			<div class="agree">
				<input type="checkbox" id=chk_1><label for="chk_1"><span>[필수]
				</span>전체 약관 및 결제동의</label> <a href="#a" class="view">전문보기</a>
			</div>
		</div>
		<div class="txt_center">
			<a href="#" class="submit">확인</a> <a href="#" class="reset">취소</a>
		</div>

	</div>

	<div class="dim"></div>






</body>
</html>