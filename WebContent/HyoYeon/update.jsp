<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>My Tea > 회원가입</title>
<link rel="stylesheet" href="style_join.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- 우편번호 api script -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
	function execDaumPostcode() {

		new daum.Postcode(
				{

					oncomplete : function(data) {
						// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
						// 각 주소의 노출 규칙에 따라 주소를 조합한다.

						// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
						var fullAddr = ''; // 최종 주소 변수
						var extraAddr = ''; // 조합형 주소 변수

						// 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
						if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
							fullAddr = data.roadAddress;

						} else { // 사용자가 지번 주소를 선택했을 경우(J)
							fullAddr = data.jibunAddress;
						}

						// 사용자가 선택한 주소가 도로명 타입일때 조합한다.
						if (data.userSelectedType === 'R') {

							//법정동명이 있을 경우 추가한다.
							if (data.bname !== '') {
								extraAddr += data.bname;
							}

							// 건물명이 있을 경우 추가한다.
							if (data.buildingName !== '') {
								extraAddr += (extraAddr !== '' ? ', '
										+ data.buildingName : data.buildingName);
							}

							// 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
							fullAddr += (extraAddr !== '' ? ' (' + extraAddr
									+ ')' : '');
						}

						// 우편번호와 주소 정보를 해당 필드에 넣는다.
						document.reg_frm.postcode.value = data.zonecode; //5자리 새우편번호 사용
						document.reg_frm.address1.value = fullAddr;

						// 커서를 상세주소 필드로 이동한다.
						document.reg_frm.address2.focus();
					}
				}).open();
	}
</script>
<script>
$(document).on('keyup','#textarea01',function(e) {
	var textarea01 = $(this).val();
	$('#cntSPAN').text(getBytes(textarea01));
});

function getBytes(str) {
	var cnt = str.length;
	return cnt;
}
$(document).ready(function() {
	//이메일 선택
	$("select[name=select_email]").change(function() {
		$("input[name=email2]").val(this.value);
	});
});
	
</script>
<script type="text/javascript">
function infoConfirm() {
	   if (document.reg_frm.id.value.length == 0) {
	      alert("아이디는 필수 사항입니다.");
	      reg_frm.id.focus();
	      return;
	   }

	   if (document.reg_frm.id.value.length < 4) {
	      alert("아이디는 4자리 이상이여야합니다");
	      reg_frm.id.focus();
	      return;
	   }

	   if (document.reg_frm.pw.value.length == 0) {
	      alert("비밀번호는 필수 사항입니다.");
	      reg_frm.pw.focus();
	      return;
	   }

	   if (document.reg_frm.pw.value != document.reg_frm.pw_check.value) {
	      alert("비밀번호가 일치하지 않습니다.");
	      reg_frm.pw.focus();
	      return;
	   }

	   if (document.reg_frm.name.value.length == 0) {
	      alert("이름은 필수 사항입니다.");
	      reg_frm.name.focus();
	      return;
	   }

	   if (document.reg_frm.email.value.length == 0) {
	      alert("아이디는 필수 사항입니다.");
	      reg_frm.name.focus();
	      return;
	   }
	   
	   if (document.reg_frm.email.value.length == 0) {
	      alert("이메일은 필수 사항입니다.");
	      reg_frm.email.focus();
	      return;
	   }
	   
	   if (document.reg_frm.address.value.length == 0) {
	      alert("주소는 필수 사항입니다.");
	      reg_frm.address.focus();
	      return;
	   }
	   
	   document.reg_frm.submit();
	}
</script>
</head>
<body>

<form action="../Join.do" method="post" name="reg_frm">
	<div class="container-fluid">
		<div class="header">
			<img alt="" src="../img/MyTea_logo.png" width="130" height="130">
		</div>
	</div>
	<div class="body">
		<div class="con">
			<table class="option">
				<colgroup>
					<col style="width: 111px">
					<col>
				</colgroup>
				<tr>
					<th><label for="list1">아이디</label><span><em> *</em></span></th>
					<td id="list1"><input type="text" id="id" name="id">
						<input type="button" class="button h60 btn_gray_dark"
							id="id_check" onclick="" autocomplete="off" value="중복확인"></td>
				</tr>
				<tr>
					<th><label for="list2">비밀번호</label><span><em> *</em></span></th>
					<td id="list2"><input type="text" name="pw" maxlength="14" autocomplete="off"></td>
				</tr>
				<tr>
					<th><label for="list3">비밀번호 확인</label><span><em> *</em></span></th>
					<td id="list3"><input type="text" id="pw_check" maxlength="14" autocomplete="off"></td>
				</tr>
				<tr>
					<th><label for="list4">이름</label><span><em> *</em></span></th>
					<td id="list4"><input type="text" name="name" maxlength="6"
						autocomplete="off"></td>
				</tr>
				<tr>
					<th><label for="list5">생년월일</label></th>
					<td id="list5"><input type="date" name="birth"
						max='<fmt:formatDate value="${now}" pattern="yyyy-MM-dd"/>'></td>
				</tr>
				<tr>
					<th><label for="list6">연락처</label><span><em> *</em></span></th>
					<td id="list6"><input type="tel" name="phone"
						placeholder="전화번호 입력" maxlength="11" autocomplete="off">&nbsp;<input
						type="button" class="certify" value="인증번호 받기"><br> <input
						type="text" id="certify" placeholder="인증번호를 입력하세요."></td>
				</tr>

				<tr>
					<th><label for="list7">이메일</label></th>
					<td id="list7"><input type="text" placeholder="이메일 주소 입력"
						name="email1" data-validation="1" maxlength="50"
						autocomplete="off"><i>@</i> <input type="text"
						maxlength="50" name="email2" data-validation="1"
						autocomplete="off"> <select name="select_email"
						id="btn_email_select">
							<option value="">직접입력</option>
							<option value="naver.com">naver.com</option>
							<option value="daum.net">daum.net</option>
							<option value="gmail.com">gmail.com</option>
							<option value="hotmail.com">hotmail.com</option>
							<option value="nate.com">nate.com</option>
							<option value="yahoo.co.kr">yahoo.co.kr</option>
					</select></td>
				</tr>
				<tr>
					<th><label for="list8">주소</label><span><em> *</em></span></th>
					<td id="list8"><input type="text" placeholder="우편번호"
						name="postcode" maxlength="5" size="6"> <input
						type="button" value="우편번호 검색" onclick="execDaumPostcode()"><br>
						<input type="text" placeholder="주소 입력" name="address1" size="30">
						<input type="text" placeholder="상세주소 입력" name="address2" size="30">
					</td>
				</tr>
			</table>
			<div class="agree">
				<input type="checkbox" id=chk_1><label for="chk_1"><span>[필수]
				</span>개인정보 수집 및 이용동의</label> <a href="#a" class="view">전문보기</a>
			</div>
		</div>
		<div class="txt_center">
	
			<input type="button" onclick="infoConfirm()" value="가입하기">
	
		</div>

	</div>

	<div class="dim"></div>
</form>
</body>
</html>