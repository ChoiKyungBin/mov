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
               <c:if test="${grade == 'system'}">
						<a href="Manager">영화/회원관리</a>
					</c:if>
					<c:if test="${grade != 'system'}">
						<a href="u_information">내정보</a>
					</c:if>
					<a href="logout">로그아웃</a>
					<br>
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



	<div
		style="width: 800px; height: 200px; text-align: center; margin: auto;">
		<h1>자유게시판입니다.</h1>
		<span>미풍양속을 해치지 않는 범위 내에서 자유롭게 작성해주세요. <br>정치와 관련된 글은 가급적
			삼가 부탁드립니다. <br> 글작성은 로그인 후 작성이 가능합니다.
		</span>
	</div>
	<div id="search"
		style="width: 900px; height: 40px; text-align: center; margin: auto;">
		<input type="text" id="searchInput" placeholder="검색어를 입력하세요">
		<button id="searchButton">검색</button>
	</div>
	<div
		style="width: 900px; height: 600px; text-align: center; margin: auto;">
		<!-- 테이블을 놓을 자리 . -->

		<div id="noResultMessage" style="display: none;">검색 결과가 없습니다.</div>
		<table style="width: 100%; align-content: center;" id="mtable">
			<colgroup>
				<col style="width: 10%;">
				<col style="width: 15%;">
				<col style="width: 35%;">
				<col style="width: 20%;">
				<col style="width: 10%;">
				<col style="width: 10%;">
			</colgroup>
			<thead>
				<tr>
					<th style="">순번</th>
					<th>작성자 이름</th>
					<th>작성 제목</th>
					<th>작성 날짜</th>
					<th>조회수</th>
					<th>수정/삭제</th>
				</tr>
			</thead>
			<c:forEach items="${List}" var="idx">
				<tbody>
					<tr>
						<td>${idx.f_num}</td>
						<td>${idx.u_id}</td>
						<td><a href="detailBoard?f_num=${idx.f_num}">${idx.f_title}</a></td>
						<td>${idx.f_date}</td>
						<td>${idx.f_viewCnt}</td>
						<c:if test="${idx.u_id==userId}">
							<td><a href="#" class="editButton" data-fnum="${idx.f_num}">M</a>/
								<a href="#" class="delButton" data-fnum="${idx.f_num}">D</a></td>

						</c:if>

					</tr>
				</tbody>
			</c:forEach>
			<tbody>
				<tr>
					<td colspan="5"><c:if test="${pageVO.prev}">
							<span><a href="freeBoard?page=${pageVO.startPage -1}">[이전페이지그룹]</a></span>
						</c:if> <!--  page그룹 정보출력  변수명  startPage   endPage--> <c:forEach
							begin="${pageVO.startPage }" end="${pageVO.endPage }" var="idx">
							<span><a href="freeBoard?page=${idx}">${idx}</a></span>
						</c:forEach> <c:if test="${pageVO.next}">
							<span><a href="freeBoard?page=${pageVO.endPage +1}">[다음페이지그룹]</a></span>
						</c:if></td>
				</tr>
			</tbody>
		</table>

		<div style="text-align: center; margin-top: 10px;">
			<input type="button" value="글 등록하기" id="f_input" onclick="f_input()">
			<!-- <a id="f_input" href="#">글 등록하기</a> -->
			<!-- f_input -->
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
		function f_input() {
			var flag = confirm('타인에게 불편한말은 삼가부탁드립니다.');
			if (flag) {
				window.location.href = "f_input"
			} else {

			}
		}
	</script>
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

	$(document).ready(function() {
		// 수정 버튼 클릭 이벤트 핸들러
		$(".editButton").click(function(event) {
			event.preventDefault();
			var fNum = $(this).data("fnum"); // data-fnum 속성 값 가져오기

			// fNum을 사용하여 필요한 로직 수행
			// ...

			// 예시: 콘솔에 fNum 출력
			console.log("fNum:", fNum);
			var flag = confirm('수정하시겠습니까?')
			if (flag) {
				window.location.href = "modifyBoard?f_num=" + fNum;
			}
		});

		// 삭제 버튼 클릭 이벤트 핸들러
		$(".delButton").click(function(event) {
			event.preventDefault();
			var fNum = $(this).data("fnum"); // data-fnum 속성 값 가져오기

			// fNum을 사용하여 필요한 로직 수행
			// ...

			// 예시: 콘솔에 fNum 출력
			console.log("fNum:", fNum);
			var flag = confirm('삭제시 이전데이터는 복구할 수 없습니다 정말 삭제하시겠습니까?')
			if (flag) {
				window.location.href = "deleteBoard?f_num=" + fNum;
			}
		});

	});
</script>

