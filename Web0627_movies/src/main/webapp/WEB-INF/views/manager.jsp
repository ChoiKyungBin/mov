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


<script>
	function m_input() {
		window.location.href = "m_input";
	}
	function MoviesManagerMent() {
		window.location.href = "MoviesManagerMent";
	}
	function InUserManagerMent() {
		window.location.href = "InUserManagerMent";
	}
</script>
<body>
	<div class="container">
		<div class="input-form-backgroud row">
			<div class="input-form col-md-12 mx-auto">
				<div id="loginBoxTitle">
					<a href="<%=request.getContextPath()%>/">Human Movies</a>
				</div>

				<div class="row">
					<div class="col-md-6 mb-3">
						<!--    아이디          -->
						<label for="name">아이디</label> <input type="text"
							class="form-control" name="u_id" id="u_id" value="${myInfo.u_id}"
							readonly> <span id="id_feedback"></span>
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
					<label for="manager">권한</label> <input type="email"
						class="form-control" id="u_email" placeholder="you@example.com"
						required name="u_email" value="${myInfo.u_grade}">
				</div>

				<div class="row">
					<div class="col-md-8 mb-3"></div>
				</div>
				<hr class="mb-4">
				<div class="mb-4"></div>
				<input class="btn btn-primary btn-lg btn-block" type="button"
					onclick="m_input()" value="영화추가"> <input
					class="btn btn-primary btn-lg btn-block" type="button" value="영화관리"
					onclick="MoviesManagerMent()"> <input
					class="btn btn-primary btn-lg btn-block" type="button"
					onclick="InUserManagerMent()" value="회원관리">

			</div>
		</div>
		<footer class="my-3 text-center text-small">
			<p class="mb-1">Human</p>
		</footer>
	</div>

</body>



</html>

