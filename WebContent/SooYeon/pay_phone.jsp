<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="style_pay.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {

		$(".open").on('click', function() {
			$(".popup_3").show();
			$(".dim").show();

		});
	});
</script>
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
	<div class="popup_3">
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