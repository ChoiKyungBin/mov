<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Human Movies - 회원가입</title>

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

a {
	text-decoration: none;
	color: black;
}

.input-form {
	max-width: 680px;
	margin: 80px auto;
	padding: 32px;
	background: #fff;
	border-radius: 10px;
	box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
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

.btn-block {
	width: 100%;
}
</style>
</head>

<body>
	<div class="container">
		<div class="input-form">
			<div id="loginBoxTitle">
				<a href="<%=request.getContextPath()%>/">Human Movies</a>
			</div>
			<form class="validation-form" novalidate action="login_save"
				method="post" id="check">
				<div class="form-group">
					<label for="u_id">아이디</label> <input type="text"
						class="form-control" id="u_id" name="u_id"
						placeholder="${loginFaul}">
				</div>
				<div class="form-group">
					<label for="u_pw">비밀번호</label> <input type="password"
						class="form-control" id="u_pw" name="u_pw">
				</div>
				<div class="form-group">
					<a href="#" id="forgotId">아이디를 잊으셨나요?</a>
				</div>
				<button class="btn btn-primary btn-lg btn-block" type="submit">로그인</button>
			</form>
			<div class="text-center mt-3">
				<a href="u_input">회원가입</a>
			</div>
		</div>
	</div>

	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script>
		document.getElementById("forgotId").addEventListener("click",
				function(event) {
					event.preventDefault(); // 기본 링크 동작 방지
					var flag = confirm('아이디를 찾으실거면 확인 비밀번호를 찾고자하면 취소를 눌러주세요 ')
					//alert(flag)
					if (flag) {
						// 아이디찾기
						window.location.href = "u_findId";
					} else {
						// 비밀번호찾기
						window.location.href = "u_findPw";
					}
				});
	</script>
</body>
</html>


