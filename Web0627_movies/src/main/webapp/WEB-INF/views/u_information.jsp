<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
	var password = document.getElementById("u_pw").value; // 텍스트 입력 비밀번호 값.
	var birthdate = document.getElementById("u_birthdate").value; // 텍스트 입력값 생년월일의 아이디 birtdate
	var email = document.getElementById("u_email").value;//텍스트로 입력한 이메일
	function modeUser() {
		// 비밀번호 유효성 검사
		var passwordRegex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{1,10}$/;
		if (!passwordRegex.test(password)) {
			alert("비밀번호는 영문 대소문자, 숫자, 특수문자를 포함하여 10글자 이하로 입력해주세요.");
			return false;
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

		var flag = confirm('기존의 회원정보는 사라집니다 수정하시겠습니까?');
		var form = document.getElementById("update");
		if (flag) {
			//수정
			alert('수정되었습니다.')
			form.submit();
		} else {
			//취소
		}
	}
	function delUser() {
		var flag = confirm('기존의 회원정보는 완전히 사라집니다 탈퇴하시겠습니까? ');
		var u_id = document.getElementById("u_id").value;
		if (flag) {
			//탈퇴
			window.location.href = "delUser?u_id=" + u_id;
		} else {
			//
		}

	}
</script>
<body>
	<div class="container">
		<div class="input-form-backgroud row">
			<div class="input-form col-md-12 mx-auto">
				<div id="loginBoxTitle">
					<a href="<%=request.getContextPath()%>/">Human Movies</a>
				</div>
				<form action="myupdate" method="post" id="update">
					<div class="row">
						<div class="col-md-6 mb-3">
							<!--    아이디          -->
							<label for="name">아이디</label> <input type="text"
								class="form-control" name="u_id" id="u_id"
								value="${myInfo.u_id}" readonly> <span id="id_feedback"></span>
						</div>
						<!--  비밀번호      -->
						<div class="col-md-6 mb-3">
							<label for="nickname">비밀번호</label> <input type="text"
								class="form-control" id="u_pw" name="u_pw" required
								value="${myInfo.u_pw}">
						</div>
					</div>
					<!--    이메일          -->
					<div class="mb-3">
						<label for="email">이메일</label> <input type="email"
							class="form-control" id="u_email" placeholder="you@example.com"
							required name="u_email" value="${myInfo.u_email}">
					</div>
					<!--    이름          -->
					<div class="mb-3">
						<label for="address">이름</label> <input type="text"
							class="form-control" name="u_name" value="${myInfo.u_name}">
					</div>
					<!--    생년월일          -->
					<div class="mb-3">
						<label for="address2">생년월일<span class="text-muted"></span></label>
						<input type="text" class="form-control" id="u_birthdate"
							placeholder="yyyymmdd" name="u_birthdate"
							value="${myInfo.u_birthdate}">
					</div>
					<!--    주소       -->
					<div class="mb-3">
						<label for="address3">사는곳<span class="text-muted"></span></label>
						<input type="text" class="form-control" id="address3"
							placeholder="시/도/군" name="u_addr" value="${myInfo.u_addr }">
					</div>
					<!--    선호장르    -->
					<div class="mb-3">
						<label for="address4">선호장르<span class="text-muted"></span></label>
						<input type="text" class="form-control" id="address3"
							name="u_preferredgenre" value="${myInfo.u_preferredgenre }">
					</div>
					<!--    선호영화관    -->
					<div class="mb-3">
						<label for="address4">선호영화관브랜드<span class="text-muted"></span></label>
						<input type="text" class="form-control" id="address3"
							name="favoriteMovieTheater"
							value="${myInfo.favoriteMovieTheater }">
					</div>
					<!--    회원가입날짜    -->
					<div class="mb-3">
						<label for="address4">가입날짜<span class="text-muted"></span></label>
						<input type="text" class="form-control" id="address3"
							name="u_date" value="${myInfo.u_date }">
					</div>
					<div class="mb-3">
						<table>
							<label for="address4">찜목록<span class="text-muted"></span></label>
							<c:forEach items="${myWishList}" var="i" varStatus="index">
								<tr>
									<th>${index.count}번</th>
									<td><a href="m_detail?m_name=${i.m_name}">${i.m_name}</a><a
										id="selectDelete"
										href="selectDelete?u_id=${i.u_id}&&m_name=${i.m_name}"> D</a></td>
								</tr>
							</c:forEach>
						</table>

					</div>
					<div class="row">
						<div class="col-md-8 mb-3"></div>
					</div>
					<hr class="mb-4">
					<div class="mb-4"></div>
					<input class="btn btn-primary btn-lg btn-block" type="button"
						value="내 정보 수정" onclick="modeUser()"> <input
						class="btn btn-primary btn-lg btn-block" type="button"
						onclick="delUser()" value="탈퇴">
				</form>
			</div>
		</div>
		<footer class="my-3 text-center text-small">
			<p class="mb-1">Human</p>
		</footer>
	</div>

</body>



</html>

