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
	<div class="mainView">
		<div
			style="width: 85%; height: 80%; background-color: #e6e8e2; margin: 0 auto;">
			<div
				style="width: 55%; height: 80%; margin: 0 auto; text-align: center;">
				<form action="sc_questions_input" method="post">
					<p>제목</p>
					<textarea placeholder="제목을 입력 하세요" maxlength='100' cols="60"
						rows="1" style="resize: none;" name="sc_title"></textarea>
					<p>내용</p>
					<textarea placeholder="내용을 입력 하세요" maxlength='100' cols="60"
						rows="8" style="resize: none;" name="sc_content"></textarea>
					<input type="submit" value="등록"
						style="width: 471px; margin-top: 20px">
				</form>
			</div>
		</div>
	</div>


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
	</script>
</body>
</html>

<style>
.search-container {
	display: flex;
	justify-content: center;
	align-items: center;
	height: 10vh;
}

.search {
	position: relative;
	width: 300px;
	display: flex;
	align-items: center;
}

#stext {
	width: 1000px;
	border: 1px solid #bbb;
	border-radius: 8px;
	padding: 10px 12px;
	font-size: 14px;
}

#simg {
	position: absolute;
	width: 17px;
	top: 10px;
	right: 12px;
	margin: 0;
}

a {
	text-decoration: none;
	color: black;
}

#mainCon {
	font-family: 'Noto Sans KR', sans-serif;
}

#actionView {
	width: end;
	height: 600px;
	margin: 7%;
}

#imageView {
	width: end;
	height: 450px;
}

#horrolView {
	width: end;
	height: 600px;
	margin: 7%;
}

#romanceView {
	width: end;
	height: 600px;
	margin: 7%;
}

#aniView {
	width: end;
	height: 600px;
	margin: 7%;
}

#comedyView {
	width: end;
	height: 600px;
	margin: 7%;
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

#d1 {
	font-weight: bold;
	text-align: center;
}

#c2 {
	height: 300px;
}

#c1 {
	height: 300px;
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