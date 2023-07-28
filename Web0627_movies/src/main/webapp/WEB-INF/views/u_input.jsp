<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Human Movies</title>

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">





<style>
body {
	min-height: 100vh;
	background: -webkit-gradient(linear, left bottom, right top, from(#92b5db),
		to(#1d466c));
	background: -webkit-linear-gradient(bottom left, #92b5db 0%, #1d466c 100%);
	background: -moz-linear-gradient(bottom left, #92b5db 0%, #1d466c 100%);
	background: -o-linear-gradient(bottom left, #92b5db 0%, #1d466c 100%);
	background: linear-gradient(to top right, #92b5db 0%, #1d466c 100%);
}

.input-form {
	max-width: 680px;
	margin-top: 80px;
	padding: 32px;
	background: #fff;
	-webkit-border-radius: 10px;
	-moz-border-radius: 10px;
	border-radius: 10px;
	-webkit-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
	-moz-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
	box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15)
}

#loginBoxTitle {
	color: #000000;
	font-weight: bold;
	font-size: 32px;
	text-transform: uppercase;
	padding: 5px;
	margin-bottom: 20px;
	background: linear-gradient(to right, #270a09, #8ca6ce);
	-webkit-background-clip: text;
	-webkit-text-fill-color: transparent;
}
</style>
</head>

<body>
	<div class="container">
		<div class="input-form-backgroud row">
			<div class="input-form col-md-12 mx-auto">
				<div id="loginBoxTitle">
					<a href="<%=request.getContextPath()%>/">Human Movies</a>
				</div>
				<form class="validation-form" novalidate action="u_input_save"
					method="post" id="check">
					<div class="row">
						<div class="col-md-6 mb-3">
							<!--    아이디          -->
							<label for="name">아이디</label> <input type="text"
								class="form-control" name="u_id" id="u_id"> <span
								id="id_feedback"></span>
						</div>

						<!--  비밀번호      -->
						<div class="col-md-6 mb-3">
							<label for="nickname">비밀번호</label> <input type="password"
								class="form-control" id="u_pw" name="u_pw" required> <small
								id="pw_feedback" class="form-text text-muted"><span
								id="checkPw">영문 대소문자, 숫자, 특수문자를 포함하여 10글자 이하로 입력해주세요.</span></small>
						</div>
					</div>
					<!--    이메일          -->
					<div class="mb-3">
						<label for="email">이메일</label> <input type="email"
							class="form-control" id="u_email" placeholder="you@example.com"
							required name="u_email">
					</div>
					<!--    이름          -->
					<div class="mb-3">
						<label for="address">이름</label> <input type="text"
							class="form-control" name="u_name">
					</div>
					<!--    생년월일          -->
					<div class="mb-3">
						<label for="address2">생년월일<span class="text-muted"></span></label>
						<input type="text" class="form-control" id="birthdate"
							placeholder="yyyymmdd" name="u_birthdate">
					</div>
					<!-- 	주소 		-->
					<div class="mb-3">
						<label for="address3">사는곳<span class="text-muted"></span></label>
						<select id="address3" name="u_addr"></select> <select
							name="u_addr"></select>
					</div>
					<!-- 	선호장르 	-->
					<div class="mb-3">
						<label for="address4">선호장르<span class="text-muted"></span></label>
						<select name="u_preferredgenre" class="form-control" id="address4">
							<option value="액션">액션</option>
							<option value="코미디">코미디</option>
							<option value="스릴러">스릴러</option>
							<option value="로맨스">로맨스</option>
							<option value="애니메이션">애니메이션</option>
						</select>
					</div>
					<div class="mb-3">
						<label for="address4">선호영화관<span class="text-muted"></span></label>
						<select name="favoriteMovieTheater" class="form-control"
							id="address4">
							<option value="CGV">CGV</option>
							<option value="메가박스">메가박스</option>
							<option value="롯데시네마">롯데시네마</option>
						</select>
					</div>
					<div class="row">
						<div class="col-md-8 mb-3"></div>
					</div>
					<hr class="mb-4">
					<div class="mb-4"></div>
					<input type="button" class="btn btn-primary btn-lg btn-block"
						onclick="checkUser()" value="가입 완료">

				</form>

			</div>
		</div>
		<footer class="my-3 text-center text-small">
			<p class="mb-1">Human</p>
		</footer>
	</div>

</body>




<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
	function checkUser() {

		var check = document.getElementById("check"); // form의 아이디.
		var checkPw = document.getElementById("checkPw"); //비밀번호 유효성안내 span
		var password = document.getElementById("u_pw").value; // 텍스트 입력 비밀번호 값.
		var birthdate = document.getElementById("birthdate").value; // 텍스트 입력값 생년월일의 아이디 birtdate
		var email = document.getElementById("u_email").value;//텍스트로 입력한 이메일
		// 비밀번호 유효성 검사
		var passwordRegex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{1,10}$/;
		if (!passwordRegex.test(password)) {
			alert("비밀번호는 영문 대소문자, 숫자, 특수문자를 포함하여 10글자 이하로 입력해주세요.");
			checkPw.style.color = "red";
			return false;
		} else {
			checkPw.style.visibility = 'hidden';
		}
		// 생년월일 유효성 검사
		var birthdateRegex = /^\d{4}(0[1-9]|1[0-2])(0[1-9]|[12][0-9]|3[01])$/;
		if (!birthdateRegex.test(birthdate)) {
			alert("생년월일은 yyyymmdd 형식으로 입력해주세요.");
			return false;
		}
		// 이메일 유효성 검사
		var emailRegex = /^\w+([.-]?\w+)*@\w+([.-]?\w+)*(\.\w{2,3})+$/;
		if (!emailRegex.test(email)) {
			alert("유효한 이메일 주소를 입력해주세요.");
			return false;
		}

		alert('회원가입 완료')
		check.submit();
	}

	$("#u_id").keyup(function() {
		let u_id = $('#u_id').val();

		$.ajax({
			url : "http://localhost:8089/movies/idCheck",
			type : "post",
			data : {
				u_id : u_id
			},
			dataType : "json",
			success : function(result) {
				if (result == 1) {
					$("#id_feedback").html('이미 사용중인 아이디입니다.');
					$("#id_feedback").attr('color', '#dc3545');
				} else {
					$("#id_feedback").html('사용가능 아이디입니다.');
					$("#id_feedback").attr('color', '#2fb380');
				}
			},
			error : function() {
				alert("서버 요청 실패")
			}
		})
	})

	$('document')
			.ready(
					function() {
						var area0 = [ "시/도 선택", "서울특별시", "인천광역시", "대전광역시",
								"광주광역시", "대구광역시", "울산광역시", "부산광역시", "경기도",
								"강원도", "충청북도", "충청남도", "전라북도", "전라남도", "경상북도",
								"경상남도", "제주도" ];
						var area1 = [ "강남구", "강동구", "강북구", "강서구", "관악구", "광진구",
								"구로구", "금천구", "노원구", "도봉구", "동대문구", "동작구",
								"마포구", "서대문구", "서초구", "성동구", "성북구", "송파구",
								"양천구", "영등포구", "용산구", "은평구", "종로구", "중구", "중랑구" ];
						var area2 = [ "계양구", "남구", "남동구", "동구", "부평구", "서구",
								"연수구", "중구", "강화군", "옹진군" ];
						var area3 = [ "대덕구", "동구", "서구", "유성구", "중구" ];
						var area4 = [ "광산구", "남구", "동구", "북구", "서구" ];
						var area5 = [ "남구", "달서구", "동구", "북구", "서구", "수성구",
								"중구", "달성군" ];
						var area6 = [ "남구", "동구", "북구", "중구", "울주군" ];
						var area7 = [ "강서구", "금정구", "남구", "동구", "동래구", "부산진구",
								"북구", "사상구", "사하구", "서구", "수영구", "연제구", "영도구",
								"중구", "해운대구", "기장군" ];
						var area8 = [ "고양시", "과천시", "광명시", "광주시", "구리시", "군포시",
								"김포시", "남양주시", "동두천시", "부천시", "성남시", "수원시",
								"시흥시", "안산시", "안성시", "안양시", "양주시", "오산시",
								"용인시", "의왕시", "의정부시", "이천시", "파주시", "평택시",
								"포천시", "하남시", "화성시", "가평군", "양평군", "여주군", "연천군" ];
						var area9 = [ "강릉시", "동해시", "삼척시", "속초시", "원주시", "춘천시",
								"태백시", "고성군", "양구군", "양양군", "영월군", "인제군",
								"정선군", "철원군", "평창군", "홍천군", "화천군", "횡성군" ];
						var area10 = [ "제천시", "청주시", "충주시", "괴산군", "단양군",
								"보은군", "영동군", "옥천군", "음성군", "증평군", "진천군", "청원군" ];
						var area11 = [ "계룡시", "공주시", "논산시", "보령시", "서산시",
								"아산시", "천안시", "금산군", "당진군", "부여군", "서천군",
								"연기군", "예산군", "청양군", "태안군", "홍성군" ];
						var area12 = [ "군산시", "김제시", "남원시", "익산시", "전주시",
								"정읍시", "고창군", "무주군", "부안군", "순창군", "완주군",
								"임실군", "장수군", "진안군" ];
						var area13 = [ "광양시", "나주시", "목포시", "순천시", "여수시",
								"강진군", "고흥군", "곡성군", "구례군", "담양군", "무안군",
								"보성군", "신안군", "영광군", "영암군", "완도군", "장성군",
								"장흥군", "진도군", "함평군", "해남군", "화순군" ];
						var area14 = [ "경산시", "경주시", "구미시", "김천시", "문경시",
								"상주시", "안동시", "영주시", "영천시", "포항시", "고령군",
								"군위군", "봉화군", "성주군", "영덕군", "영양군", "예천군",
								"울릉군", "울진군", "의성군", "청도군", "청송군", "칠곡군" ];
						var area15 = [ "거제시", "김해시", "마산시", "밀양시", "사천시",
								"양산시", "진주시", "진해시", "창원시", "통영시", "거창군",
								"고성군", "남해군", "산청군", "의령군", "창녕군", "하동군",
								"함안군", "함양군", "합천군" ];
						var area16 = [ "서귀포시", "제주시", "남제주군", "북제주군" ];

						// 시/도 선택 박스 초기화

						$("select[name^=u_addr]")
								.each(
										function() {
											$selsido = $(this);
											$
													.each(
															eval(area0),
															function() {
																$selsido
																		.append("<option value='"+this+"'>"
																				+ this
																				+ "</option>");
															});
											$selsido
													.next()
													.append(
															"<option value=''>구/군 선택</option>");
										});

						// 시/도 선택시 구/군 설정

						$("select[name^=u_addr]")
								.change(
										function() {
											var area = "area"
													+ $("option", $(this))
															.index(
																	$(
																			"option:selected",
																			$(this))); // 선택지역의 구군 Array
											var $gugun = $(this).next(); // 선택영역 군구 객체
											$("option", $gugun).remove(); // 구군 초기화

											if (area == "area0")
												$gugun
														.append("<option value=''>구/군 선택</option>");
											else {
												$
														.each(
																eval(area),
																function() {
																	$gugun
																			.append("<option value='"+this+"'>"
																					+ this
																					+ "</option>");
																});
											}
										});

					});
</script>

</html>


