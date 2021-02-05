<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<!-- alert로 필터 script -->
<script type="text/javascript" src="member.js"></script>
<!-- 우편번호 api script -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

<script>
function execDaumPostcode() {

    new daum.Postcode({

        oncomplete: function(data) {
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
            if(data.userSelectedType === 'R'){

                //법정동명이 있을 경우 추가한다.
                if(data.bname !== ''){
                    extraAddr += data.bname;
                }

                // 건물명이 있을 경우 추가한다.
                if(data.buildingName !== ''){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }

                // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
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
<script type="text/javascript">
	$(document).on('keyup', '#textarea01', function(e) {
		var textarea01 = $(this).val();
		$('#cntSPAN').text(getBytes(textarea01));
	});

	function getBytes(str) {
		var cnt = str.length;
		return cnt;
	}
	$(document).ready(function() {
		//이메일선택
		$("select[name=select_email]").change(function() {
			$("input[name=email2]").val(this.value);
		});
	});
</script>
<style>
@font-face {
	font-family: hzStyleFont;
	src: url("../font/Cafe24Ssurround.ttf");
}

* {
	font-family: hzStyleFont;
}

.navbar {
	margin-bottom: 0;
	border-radius: 0;
	border: none;
	background-color: #D9CDBC;
}

.jumbotron { /* 이 접근자로는 컨트롤 안 됨. */
	margin-bottom: 100px;
	background-color: blue;
}

.table {
	text-align: left;
	font-size: 16px;
	margin-bottom: 100px;
}

img {
	object-fit: cover
}

input {
	margin-bottom: 7px;
}

input[type=password] {
	font-family: arial;
}

input::placeholder {
	font-family: hzStyleFont;
	font-size: 12px;
}
</style>

<title>회원 가입 페이지</title>
</head>
<body style="background: lightgray">
	<c:set value="<%=new java.util.Date()%>" var="now"></c:set>
	<nav class="navbar navbar-inverse">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#myNavbar">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#">Portfolio</a>
			</div>
			<div class="collapse navbar-collapse" id="myNavbar">
				<ul class="nav navbar-nav">
					<li><a href="#">About</a></li>
					<li><a href="#">Gallery</a></li>
					<li><a href="#">Contact</a></li>
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<li><a href="#"><span class="glyphicon glyphicon-log-in"></span>
							Login</a></li>
				</ul>
			</div>
		</div>
	</nav>

	<div class="jumbotron" style="background-color: lightgray;">
		<div class="container text-center">
			<div class="register_form">
				<form name="reg_frm" id="detailJoinForm" method="POST"
					action="joinOk.jsp" autocomplete="off">
					<h2 id="pageTit" class="pageName" style="text-align: center">회원가입</h2>
					<table class="table">
						<thead style="font-size: 30px;">
							<tr>
								<td><sup>계정 정보 입력</sup></td>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>
									<div class="id_input">
										아이디 설정<br>
										<input type="text" name="id" placeholder="아이디 입력" data-validation="1"
											maxlength="20" size="20" value="" autocomplete="off">
										<button type="button" class="button h60 btn_gray_dark"
											id="btn_dup" onclick="javascript:">중복확인</button>
									</div><br>
									<div class="pw_input">
										비밀번호 설정<br>
										<span><input style="font-family: arial;" type="password" name="pwd" data-validation="1"
											 maxlength="14" placeholder="비밀번호(6~14자리)" autocomplete="new-password"></span>
										<span><input style="font-family: arial;" type="password" name="pwd_check"
											data-validation="1" maxlength="14" placeholder="비밀번호 확인"></span>
									</div>
								</td>
							</tr>
						</tbody>
					</table>

					<table class="table">
						<thead style="font-size: 30px;">
							<tr>
								<td><sup>개인 정보 입력(필수)</sup></td>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>
									이름<br>
									<div class="name_input">
										<span><input type="text" placeholder="이름 입력" name="name"
											data-validation="1" maxlength="6" autocomplete="off"></span>
									</div><br>
									
									전화번호<br>
									<div class="tel_input">
										<span><input type="tel" placeholder="휴대폰 번호 ('-'제외)"
											name="tel" data-validation="1" maxlength="11" autocomplete="off"></span>
									</div><br>
									
									생년월일<br>
									<div class="birth_input">
										<span><input type="date" placeholder="생년월일 입력" name="birthdate"
											max='<fmt:formatDate value="${now}" pattern="yyyy-MM-dd"/>'></span>
									</div><br> 
									
									이메일<br>
									<div class="email_input">
										<span><input type="text" placeholder="이메일 주소 입력" name="email1" 
											data-validation="1" maxlength="50" autocomplete="off"><i>@</i></span>
										<span><input type="text" maxlength="50" name="email2" data-validation="1" autocomplete="off"></span> 
										<span> 
											<select name="select_email" id="btn_email_select">
												<option value="">직접입력</option>
												<option value="naver.com">naver.com</option>
												<option value="daum.net">daum.net</option>
												<option value="gmail.com">gmail.com</option>
												<option value="hotmail.com">hotmail.com</option>
												<option value="nate.com">nate.com</option>
												<option value="yahoo.co.kr">yahoo.co.kr</option>
											</select>
										</span>
									</div><br>
									
									주소<br>
									<div class="address_input">
										<span><input type="text" placeholder="우편번호" name="postcode" maxlength="5" size="6"></span> 
										<span><input type="button" value="우편번호 검색" onclick="execDaumPostcode()"></span><br>
										<span><input type="text" placeholder="주소 입력" name="address1" size="30"></span><br>
										<span><input type="text" placeholder="상세주소 입력" name="address2" size="30"></span>
									</div>
								</td>
							</tr>
						</tbody>
					</table>

					<div class="payment_reg">
						<table class="table">
							<thead style="font-size: 30px;">
								<tr>
									<td><sup>결제 정보 등록 (선택)</sup></td>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>
										<p>
											계좌번호<br>
											<select name="bankname">
												<option value="">은행을 선택하세요</option>
												<option value="1">신한은행</option>
												<option value="2">국민은행</option>
												<option value="3">농협</option>
												<option value="4">하나은행</option>
												<option value="5">우리은행</option>
											</select>
										</p>
										<p class="account_no">
											계좌번호 입력<br>
											<span><input type="text" name="account_no"
												maxlength="15" size="15" data-validation="1"></span>
										</p>
										<p class="payment_reg_info" style="font-size: 0.9em">
											<small>*자주 쓰는 카드를 등록하시면, 웹 주문시 자동 결제가 완료됩니다.</small>
										</p>

										<p>
											신용카드<br>
											<select name="cardname">
												<option value="">카드를 선택하세요</option>
												<option value="1">신한카드</option>
												<option value="2">비씨카드</option>
												<option value="3">국민카드</option>
												<option value="4">NH농협카드</option>
												<option value="5">현대카드</option>
												<option value="6">삼성카드</option>
												<option value="7">하나카드</option>
												<option value="8">롯데카드</option>
												<option value="9">씨티카드</option>
												<option value="10">우리카드</option>
											</select>
										</p>
										<p class="card_number">
											카드번호 입력<br>
											<span><input type="text" name="card_no1"
												minlength="4" maxlength="4" size="5" data-validation="1"></span>
											<span><input type="text" name="card_no2"
												minlength="4" maxlength="4" size="5" data-validation="1"></span>
											<span><input type="text" name="card_no3"
												minlength="4" maxlength="4" size="5" data-validation="1"></span>
											<span><input type="text" name="card_no4"
												minlength="4" maxlength="4" size="5" data-validation="1"></span>
										</p>
										<p class="card_exp_date">
											유효기간<br>
											<select name="exp_month">
												<option value="">월(Month)</option>
												<option value="1">01</option>
												<option value="2">02</option>
												<option value="3">03</option>
												<option value="4">04</option>
												<option value="5">05</option>
												<option value="6">06</option>
												<option value="7">07</option>
												<option value="8">08</option>
												<option value="9">09</option>
												<option value="10">10</option>
												<option value="11">11</option>
												<option value="12">12</option>
											</select>
											<select name="exp_year">
												<option value="">년(Year)</option>
												<option value="1">21</option>
												<option value="2">22</option>
												<option value="3">23</option>
												<option value="4">24</option>
												<option value="5">25</option>
												<option value="6">26</option>
												<option value="7">27</option>
												<option value="8">28</option>
												<option value="9">29</option>
												<option value="10">30</option>
											</select>
										</p> 
									</td>
								</tr>
							</tbody>
						</table>
						<div class="btn_wrap">
							<input type="button" value="회원가입 신청" class="btn btn-warning" onclick="infoConfirm()">
							<input type="button" value="다시 입력하기" class="btn btn-warning" onclick="javascript:window.location='join.jsp'">
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>