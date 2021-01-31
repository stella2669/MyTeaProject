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
			$(".popup").show();
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
<style>
.payment_select {
	text-align: center;
}

.popup {
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

.popup h2 {
	padding: 0 0 42px;
	border-bottom: 3px solid #444;
	font-weight: normal;
	font-size: 36px;
	color: #222;
	text-align: center;
	line-height: 100%;
	color: #222;
}

.popup close {
	position: absolute;
	right: 40;
	top: 40;
	width: 41px;
	height: 41px;
	background: url(../img/btn-close.png) no-repeat;
	color: transparent;
}

.popup .con {
	padding: 40 78px; /* 좌우여백 */
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
	padding: 0 0 20px;
	text-align: left;
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

input /* [type="date"] */ {
	width: 100%;
	height: 32px;
	font-size: 14px;
	color: #373737;
	border: 1px solid #e8e8e8;
	background: #fff;
	text-decoration: none;
	text-indent: 20px;
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
	border: :2px solid #666;
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
	<div class="popup">
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
					<th><label for="list4_1">&nbsp;&nbsp;&nbsp;CVC&nbsp;&nbsp;&nbsp;</label></th>
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
				<input type="checkbox" id=chk_1><label for="chk_1"><span>[필수]</span>전체
					약관 동의</label> <a href="#a" class="view">전문보기</a>
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