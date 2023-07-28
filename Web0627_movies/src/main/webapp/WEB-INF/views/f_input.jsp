<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="True"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<!-- CSS only -->



<html>
<head>
<title>Home</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@700&display=swap"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<!-- JavaScript Bundle with Popper -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
	crossorigin="anonymous"></script>
<c:if test="${grade == 'system'}">
	<span><a href="m_input">영화소개글 작성</a></span>
</c:if>

</head>
<body>


	<div id="d">
		<div class="child-div">
			<div id="loginBoxTitle">
				<a href="<%=request.getContextPath()%>/">Human Movies</a>
			</div>
		</div>
		<div class="child-div"></div>
		<div class="child-div" id="d1">
			<div style="padding-top: 2cm; margin-left: 4cm;">
				<!-- 로그인 성공 -->
				<c:if test="${userId!=null}">
               ${userId}님
               <a href="u_information">내정보</a>
					<a href="logout">로그아웃</a>
				</c:if>
				<!-- 로그인 안됨 -->
				<c:if test="${userId==null}">
					<a href="login">로그인</a>
					<a href="u_input">회원가입</a>
				</c:if>
			</div>
		</div>
	</div>
	<!--  -->
	<input type="hidden" name="idCheck" value="${userId}">
	<hr>
	<table>
		<tr id="genre">
			<!-- <td width=300><a href="m_genre_save?selgenre=액션">액션</a></td>
         <td width=300><a href="m_genre_save?selgenre=공포">공포</a></td>
         <td width=300><a href="m_genre_save?selgenre=코미디">코미디</a></td>
         <td width=300><a href="m_genre_save?selgenre=로맨스">로맨스</a></td> -->
			<td width=300><a href="moviesInfomation">사이트소개</a></td>
			<td width=300><a href="list_view">영화</a></td>
			<!-- m_nearbyCinema -->
			<td width=300><a href="#" id="rnjsgks">주변극장</a></td>
			<td width=300><a href="freeBoard">자유게시판</a></td>
			<td width=300><a href="serviceCenter">고객센터</a></td>
		</tr>
	</table>
	<!--  리스트 넣을 자리. -->
	<hr>
	<div class="mainView"></div>


	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script>
		document.addEventListener("DOMContentLoaded", function() {
			var idCheck = $('input[name=idCheck]').val();
			document.getElementById("rnjsgks").addEventListener("click",
					function(event) {
						event.preventDefault();
						//alert(idCheck + 'd');
						if (idCheck == '') {
							alert('로그인 후 이용 바랍니다.');
						} else {
							//alert(idCheck + '로그인을 한 경우');
							window.location.href = "m_nearbyCinema";
						}

					});
		});

		function inputCheck() {
			var form = document.getElementById("form")

			var flag = confirm('타인을 비방하거나 모방하는 내용은 제제의 대상이 될 수 있습니다. 작성하시겠습니까?');
			if (flag) {
				//작성
				form.submit();
			} else {
				//취소
			}

		}
	</script>
	<div
		style="width: 900px; height: 500px; text-align: center; margin: auto;">
		<h1>자유게시판입니다.</h1>
		<span>미풍양속을 해치지 않는 범위 내에서 자유롭게 작성해주세요. <br>정치/종교/지역/인종/젠더
			등 차별과 관련되거나 민감한 주제에 관한 발언은 가급적 삼가해주시기 바랍니다.
		</span>
		<form action="f_input_save" enctype="multipart/form-data" id="form"
			method="post">
			<input type="hidden" name="u_id" value="${userId}"> <input
				type="hidden" name="u_name" value="${userName}">
			<table id="stable">
				<tr>
					<td><span>제목</span></td>
					<td><input type="text" id="f_title" name="f_title"></td>
				</tr>
				<tr>
					<td><span>내용</span></td>
					<td><textarea id="f_content" name="f_content" rows="5"
							cols="50"></textarea></td>
				</tr>
				<tr>
					<td><span>유형</span></td>
					<td><span>공개</span><input type="radio" value="기본" id="f_type"
						name="f_type"><span>익명</span><input type="radio"
						value="익명" id="f_type" name="f_type"></td>
				</tr>
				<tr>
					<td><label for="f_filename">파일</label></td>
					<td><input type="file" id="file" name="file"></td>
				</tr>
				<tr>
					<td colspan="2" style="text-align: center;"><input
						type="button" onclick="inputCheck()" value="작성 완료"></td>
				</tr>
			</table>
		</form>


	</div>
</body>
</html>

<style>
a {
	text-decoration: none;
	color: black;
}

#genre {
	text-align: center;
}

#d {
	display: flex;
	justify-content: space-between;
}

#d1 {
	font-weight: bold;
	text-align: center;
	display: flex;
	justify-content: space-between;
	align-items: center;
}

.child-div {
	flex-basis: 30%;
	height: 100px;
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

#stable {
	margin: auto;
	width: 50%;
}

#stable tr td input[type="text"], #stable tr td textarea {
	width: 100%;
}

#stable td:first-child {
	text-align: right;
	padding-right: 10px;
}
</style>


