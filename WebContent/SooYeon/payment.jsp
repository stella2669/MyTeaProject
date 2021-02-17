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

		$(".open_1").on('click', function() {
			$(".popup_1").show();
			$(".dim_1").show();

		});

		$(".reset_1").on('click', function() {
			$(".txt_center").parent().hide();
			$(".dim_1").hide();

		});

		$(".open_2").on('click', function() {
			$(".popup_2").show();
			$(".dim").show();

		});
		$(".reset_2").on('click', function() {
			$(".txt_center").parent().hide();
			$(".dim").hide();

		});

		$(".open_3").on('click', function() {
			$(".popup_3").show();
			$(".dim").show();

		});
		$(".reset_3").on('click', function() {
			$(".txt_center").parent().hide();
			$(".dim_1").hide();

		});
	});
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
				<table class="sel_pay">
					<tr>
						<td><a href="#" class="open_1"><img
								src="../img/credit-card.png" height="200px" width="200px"></a>
							<h2>신용카드</h2></td>
						<td><a href="#" class="open_2"><img
								src="../img/phone.png" height="200px" width="200px"></a>
							<h2>휴대폰결제</h2></td>
						<td><a href="#" class="open_3"><img
								src="../img/money.png" height="200px" width="200px"></a>
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
						placeholder="MM/YY">
					<th><label for="list4_1">CVC&nbsp;&nbsp;&nbsp;&nbsp;</label></th>
					<td id="list4_1"><input type="text" id="cvc"
						placeholder="카드 뒷면 3자리 숫자"></td>
				</tr>
				<tr>
					<th><label for="list5">카드비밀번호</label></th>
					<td id="list5"><input type="text" id="card_pw"
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
			<a href="#" class="submit">확인</a> <a href="#" class="reset_1">취소</a>
		</div>
	</div>
	<div class="dim_1"></div>
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
					<td id="list1"><%="#"%>&emsp;&emsp;&emsp;&emsp;&emsp;/&emsp;결제금액&emsp;&emsp;&emsp;&emsp;
						<%="#"%></td>
					<%-- 
					<th><label for="list3">결제일</label></th>
					<td id="list3"><%="#"%></td> --%>
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
					<td id="list5"><input type="text" id="iden_1">&nbsp;&nbsp;&nbsp;-&nbsp;&nbsp;&nbsp;<input
						type="text" id="iden_2" class="iden_2"> ******</td>
				</tr>
				<tr>
					<th><label for="list6">휴대폰결제<br>비밀번호
					</label></th>
					<td id="list6"><ul>
							<li><input type="radio">사용함&nbsp;&nbsp;&nbsp;</li>
							<li><input type="radio">사용안함(일반결제)</li>
						</ul></td>
				</tr>
				<tr>
					<th><label for="list7">인증번호</label></th>
					<td id="list7"><input type="text" id="인증번호"
						placeholder="인증번호 입력">&nbsp;&nbsp; <input type="button"
						id="certify" class="certify" value="인증번호 요청"></td>
				</tr>
			</table>
			<div class="agree">
				<input type="checkbox" id=chk_1><label for="chk_1"><span>[필수]
				</span>전체 약관 및 결제동의</label> <a href="#a" class="view">전문보기</a>
			</div>
		</div>
		<div class="txt_center">
			<a href="#" class="submit">확인</a> <a href="#" class="reset_2">취소</a>
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
					</select> <br> <span class="notice"><em>농협, 국민, 부산, SC, 우체국</em>은
							ATM 현금 입급 불가 (은행 창구, 인터넷 뱅킹 이용 가능)</span></td>
				</tr>
				<tr>
					<th><label for="list2">환불방법</label></th>
					<td id="list2"><ul>
							<li><input type="radio" id="ra_1"><label for="ra_1">환불정산액
									적립</label></li>
							<li><input type="radio" id="ra_1"><label for="ra_1">본인계좌환불</label></li>
							<li><a href="#a" class="account_list">내 계좌목록</a></li>
						</ul></td>
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
			<a href="#" class="submit">주문하기</a> <a href="#" class="reset_3">취소</a>
		</div>

	</div>

	<div class="dim"></div>





</body>
</html>