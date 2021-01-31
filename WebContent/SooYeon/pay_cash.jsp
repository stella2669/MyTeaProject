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
		<h2>무통장 입금</h2>
		<div class="con">
			<table class="option">
				<colgroup>
					<col style="width: 111px">
					<col>
				</colgroup>
				<tr>
					<th><label for="list1">입금은행</label></th>
					<td id="list1"><select>
							<option>선택해주세요</option>
							<option value="농협은행">농협</option>
							<option value="국민은행">국민은행</option>
							<option value="우리은행">우리은행</option>
							<option value="신한은행">신한은행</option>
							<option value="기업은행">기업은행</option>
							<option value="하나은행">하나은행</option>
							<option value="대구은행">대구은행</option>
							<option value="부산은행">부산은행</option>
							<option value="우체국">우체국</option>
							<option value="제일은행">SC제일은행</option>
							<option value="광주은행">광주은행</option>
							<option value="경남은행">경남은행</option>
							<option value="수협은행">수협</option>
							<option value="케이뱅크">케이뱅크</option>
					</select>
					<br><span class="notice"><em>농협, 국민, 부산, SC, 우체국</em>은 ATM 현금 입급 불가 (은행 창구, 인터넷 뱅킹 이용 가능)</span>
					</td>
				</tr>
				<tr>
					<th><label for="list2">환불방법</label></th>
					<td id="list2"><ul>
							<li><input type="radio" id="ra_1"><label for="ra_1">환불정산액 적립</label></li>
							<li><input type="radio" id="ra_1"><label for="ra_1">본인계좌환불</label></li>
							<li><a href="#a" class="account_list">내 계좌목록</a></li></ul></td>
				</tr>

				<tr>
					<th><label for="list3">현금영수증</label></th>
					<td id="list3"><input type="text" class="form-control"
						name="po_num" id="po_num" maxlength="15"
						placeholder="하이픈(-) 없이 입력"></td>
				</tr>			
			</table>
			<div class="agree">
				<input type="checkbox" id=chk_1><label for="chk_1"><span>[필수]
				</span>전체 약관 및 결제동의</label> <a href="#a" class="view">전문보기</a>
			</div>
		</div>
		<div class="txt_center">
			<a href="#" class="submit">주문하기</a> <a href="#" class="reset">취소</a>
		</div>

	</div>

	<div class="dim"></div>






</body>
</html>