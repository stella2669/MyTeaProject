<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="popup">
		<h2>카드정보</h2>
		<div class="con">
			<table class="option_1">
				<colgroup>
					<col style="width: 111px">
					<col>
				</colgroup>
				<tr>
					<th><label for="list1">카드구분</label></th>
					<td id="list1">
						<ul>
							<li class="#"><input type="radio">개인카드</li>
							<li class="#"><input type="radio">법인카드</li>
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
						placeholder="000000000000"></td>
				</tr>
				<tr>
					<th><label for="list4">유효기간</label></th>
					<td id="list4"><input type="text" id="validation_date"
						placeholder="****"></td>
					<th><label for="list4_1">CVC</label></th>
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
				<input type="checkbox" id=chk_1><label for="chk_1">전체
					약관 동의</label>

			</div>
		</div>
		<div class="txt_center">
			<a href="#" class="btn_finish">완료</a>
		</div>
		<a href="#" class="close">닫기</a>
	</div>
	<div class="dim"></div>
	</td>

</body>
</html>