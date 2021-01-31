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
			$(".popup_1").show();
			$(".dim").show();

		});
	});
	/* $(document).ready(function() {

		$(".open").on('click', function() {
			$("popup").show();
			$(".dim").show();

		});
	}); */
</script>
<script type="text/javascript">
	var cardNumber = document.getElementById('card_number');
	cardNumber.onkeyup = function(event) {
		event = event || window.event;
		var _val = this.value.trim();
		this.value = autoHypenCard(_val);
	};
</script>
<script type="text/javascript">
	function autoHypenCard(str) {
		str = str.replace(/[^0-9]/g, '');
		var tmp = '';
		if (str.length < 4) {
			return str;
		} else if (str.length < 8) {
			tmp += str.substr(0, 4);
			tmp += '-';
			tmp += str.substr(4, 4);
			return tmp;
		} else if (str.length < 12) {
			tmp += str.substr(0, 4);
			tmp += '-';
			tmp += str.substr(4, 4);
			tmp += '-';
			tmp += str.substr(8, 4);
			return tmp;
		} else if (str.length < 17) {

			tmp += str.substr(0, 4);
			tmp += '-';
			tmp += str.substr(4, 4);
			tmp += '-';
			tmp += str.substr(8, 4);
			tmp += '-';
			tmp += str.substr(12, 4);
			return tmp;
		}
		return str;
	}
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
								src="../img/credit-card(2).png" height="200px" width="200px"></a>
							<h2>신용카드</h2></td>
						<td><img id="credit" src="../img/phone(2).png"  height="200px" width="200px"
							onclick="location:'#'">
							<h2>휴대폰결제</h2></td>
						<td><img id="credit" src="../img/money(2).png" height="200px" width="200px"
							onclick="location:'#'">
							<h2>무통장입금</h2></td>
					</tr>
				</table>
			</div>
		</div>
	</div>
	<div class="popup_1">
		<h2>카드정보</h2>
		<div class="con">
			<table class="option">
				<colgroup>
					<col style="width: 111px">
					<col>
				</colgroup>
				<tr>
					<th><label for="list1">카드구분</label></th>
					<td id="list1">
						<ul>
							<li><input type="radio" id="ra_1"><label for="ra_1">개인카드</label></li>
							<li><input type="radio" id="ra_2"><label for="ra_2">법인카드</label></li>
						</ul>
					</td>
				</tr>
				<tr>
					<th><label for="list2">카드선택</label></th>
					<td id="list2"><select name="card_select">
							<option value="국민">국민</option>
							<option value="비씨">비씨</option>
							<option value="신한">신한</option>
							<option value="현대">현대</option>
							<option value="삼성">삼성</option>
							<option value="롯데">롯데</option>
							<option value="외환">외환</option>
							<option value="농협">농협</option>
							<option value="하나">하나</option>
							<option value="우리">우리</option>
							<option value="광주">광주</option>
							<option value="수협">수협</option>
							<option value="씨티">씨티</option>
							<option value="전북">전북</option>
							<option value="제주">제주</option>
							<option value="카카오뱅크">카카오뱅크</option>
							<option value="케이뱅크">케이뱅크</option>
							<option value="UnionPay">UnionPay/해외발급</option>
					</select></td>
				</tr>

				<tr>
					<th><label for="list3">카드번호</label></th>
					<td id="list3"><input type="text" class="form-control"
						name="card_number" id="card_number" maxlength="19"
						placeholder="하이픈(-) 없이 입력"></td>
				</tr>
				<tr>
					<th><label for="list4">유효기간</label></th>
					<td id="list4"><input type="text" id="validation_date"
						placeholder="MM/YY"></td>
					<th><label for="list4_1">CVC&nbsp;&nbsp;&nbsp;&nbsp;</label></th>
					<td id="list4_1"><input type="text" id="cvc"
						placeholder="카드 뒷면 3자리 숫자"></td>
				</tr>
				<tr>
					<th><label for="list5">카드비밀번호</label></th>
					<td id="list5"><input type="text" id="card_pwd"
						placeholder="비밀번호 앞 2자리 숫자"></td>
				</tr>
				<tr>
					<th><label for="list6">할부기간</label></th>
					<td id="list6"><select>
							<option>일시불</option>
							<option>3개월</option>
							<option>6개월</option>
							<option>10개월</option>
					</select></td>

				</tr>
			</table>
			<div class="agree">
				<input type="checkbox" id=chk_1><label for="chk_1"><span>[필수]
				</span>전체 약관 및 결제동의</label> <a href="#a" class="view">전문보기</a>
			</div>
		</div>
		<div class="txt_center">
			<a href="#" class="submit">확인</a>
			<a href="#" class="reset">취소</a>
		</div>
	</div>
	<div class="dim"></div>






</body>
</html>