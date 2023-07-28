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
			<td width=300><a href=".">장르별 top 6!!</a></td>
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
			document.getElementById("f_input").addEventListener("click",
					function(event) {
						event.preventDefault();
						//alert(idCheck + 'd');
						if (idCheck == '') {
							alert('로그인 후 이용 바랍니다.');
						} else {
							//alert(idCheck + '로그인을 한 경우');
							window.location.href = "f_input";
						}

					});
		});

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
	<div
		style="width: 800px; height: 200px; text-align: center; margin: auto;">
		<h1>자유게시판입니다.</h1>
		<span>수정은 제목과 내용, 글유형만 변경 가능합니다. </span>
	</div>

	<div
		style="width: 800px; height: 600px; text-align: center; margin: auto;">
		<!-- 테이블을 놓을 자리 . -->
		<form method="get" action="modifyBoard_save" id="modifyForm">
			<table style="width: 100%; align-content: center;" id="mtable">

				<tr>
					<th>글번호
					<td>${datile.f_num}<input type="hidden"
						value="${datile.f_num}" name="f_num"></td>
				</tr>
				<tr>
					<th>작성아이디
					<td>${datile.u_id}</td>
				</tr>
				<tr>
					<th>작성자이름
					<td>${datile.u_name}</td>
				</tr>
				<tr>
					<td>제목</td>
					<td><input type="text" id="f_title" name="f_title"
						style="width: 9.9cm;"></td>
				</tr>
				<tr>
					<td>내용</td>
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
					<th>파일
					<td><img src="download?filename=${datile.f_filename}"></td>
				</tr>
				<tr>
					<th>작성일자
					<td>${datile.f_date}</td>
				</tr>
				<tr>
					<th>조회수
					<td>${datile.f_viewCnt}</td>
				</tr>
				<tr>
					<td colspan="2"><input type="button" value="modify"
						onclick="modifyButton()"></td>
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

#mtable {
	border: 1px #a39485 solid;
	font-size: .9em;
	box-shadow: 0 2px 5px rgba(0, 0, 0, .25);
	width: 100%;
	border-collapse: collapse;
	overflow: hidden;
	border-radius: 5px;
}

#mtable th, #mtable td {
	text-align: center;
}

#search {
	margin-bottom: 10px;
}

#searchInput {
	padding: 5px;
	width: 200px;
}

#searchButton {
	padding: 5px 10px;
}
</style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	$(document).ready(function() {
		$("#searchButton").click(function() {
			var searchText = $("#searchInput").val().toLowerCase();
			var searchResultExists = false; // 검색 결과 존재 여부를 나타내는 변수

			$("#mtable tbody tr").each(function() {
				var rowText = $(this).text().toLowerCase();

				if (rowText.indexOf(searchText) === -1) {
					$(this).hide();
				} else {
					$(this).show();
					searchResultExists = true; // 검색 결과가 존재함을 표시
				}
			});

			if (!searchResultExists) {
				$("#noResultMessage").show(); // 검색 결과가 없다는 메시지를 표시
			} else {
				$("#noResultMessage").hide(); // 검색 결과가 있을 경우 메시지를 숨김
			}
		});
	});

	function modifyButton() {
		var form = document.getElementById('modifyForm')
		var flag = confirm('수정하시겠습니까?')
		if (flag) {
			form.submit();
		}
	}
</script>

