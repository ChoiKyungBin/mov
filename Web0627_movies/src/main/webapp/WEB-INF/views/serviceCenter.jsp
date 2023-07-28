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
	<div class="mainView">
		<div style="width: 100%; height: 200px; background-color:">
			<form action="">
				<div class="search-container">
					<div class="search">
						<input type="text" placeholder="제목란을 입력해주세요" id="stext"
							name="s_word"> <a href="scSearch" id="scSearch"> <img
							src="https://s3.ap-northeast-2.amazonaws.com/cdn.wecode.co.kr/icon/search.png"
							id="simg"></a>
					</div>
				</div>
			</form>
			<div style="width: 20%; margin: 0 auto;">
				<a href="sc_questions"><h4 align="center">직접 질문 하러 가기</h4></a>
			</div>
		</div>


		<h3 align="center">자주 찾는 질문</h3>
		<div
			style="width: 70%; height: 400px; margin: 0 auto; background-color:">
			<c:forEach items="${cntList}" var="i" varStatus="index">
				<div class="div10">
					<span>${index.count}</span><br> <span>${i.sc_title}</span><br>
					<span>${i.sc_content}</span><br> <span style="color: blue">${i.sc_answer}</span>
				</div>
			</c:forEach>
		</div>









		<c:if test="${searchList == null }">

			<h3 align="center" style="margin-top: 100px;">질문 게시판</h3>
			<div style="width: 80%; height: 800px; margin: 0 auto;">
				<div
					style="width: 100%; height: 5%; text-align: center; border-bottom: 1px solid; border-top: 3px solid">
					<div style="width: 5%; float: left;">
						<span>번호</span>
					</div>
					<div style="width: 14%; float: left;">
						<span>답변상태</span>
					</div>
					<div style="width: 47%; float: left;">
						<span>제목</span>
					</div>
					<div style="width: 14%; float: left;">
						<span>작성자</span>
					</div>
					<div style="width: 20%; float: left;">
						<span>작성일</span>
					</div>
				</div>
				<ul
					style="width: 100%; height: 100%; border-width: 1px; list-style-type: none; padding-left: 0;">
					<c:forEach var="i" items="${sclist}" varStatus="idx">
						<li style="text-align: center; border-bottom: 1px solid;">
							<div style="width: 100%; height: 50px;">
								<div style="width: 5%; float: left;">
									<span>${i.sc_num}</span>
								</div>
								<c:if test="${i.sc_answer == null}">
									<div style="width: 14%; float: left;">
										<span>미답변</span>
									</div>
								</c:if>

								<c:if test="${i.sc_answer != null}">
									<div style="width: 14%; float: left;">
										<span>답변완료</span>
									</div>
								</c:if>
								<div style="width: 47%; float: left; cursor: pointer;"
									onclick="test111('${i.sc_num}')" class="divcl">
									<span>${i.sc_title}</span>
								</div>
								<div style="width: 14%; float: left;">
									<span>${i.u_id}</span>
								</div>
								<div style="width: 20%; float: left;">
									<span>${i.sc_date}</span>
								</div>
							</div>
							<div
								style="width: 100%; height: 100px; padding-left: 200px; display: none;"
								class='answer'>
								<c:if test="${i.sc_answer == null}">
									<div style="width: 558px; height: 40px; text-align: left;">
										<span>질문내용: ${i.sc_content}</span>
									</div>
									<div style="width: 558px; text-align: left;">
										<span>조금만 기다려 주세요</span>
									</div>
								</c:if>
								<c:if test="${i.sc_answer != null}">
									<div style="width: 558px; height: 40px; text-align: left;">
										<span>질문내용: ${i.sc_content}</span>
									</div>
									<div style="width: 558px; text-align: left;">
										<span>답변: ${i.sc_answer}</span>
									</div>
								</c:if>
							</div>


						</li>
					</c:forEach>
					<!--  page 정보 출력   page정보는 pageVO  객체가 저장하고 있음. 컨트롤러가 전달 함 -->
					<li style="text-align: center;"><c:if test="${pageVO.prev}">
							<a href="serviceCenter?page=${pageVO.startPage -1}">[이전페이지그룹]</a>
						</c:if> <!--  page그룹 정보출력  변수명  startPage   endPage--> <c:forEach
							begin="${pageVO.startPage }" end="${pageVO.endPage}" var="idx">
							<a href="serviceCenter?page=${idx}">${idx}</a>
						</c:forEach> <c:if test="${pageVO.next}">
							<a href="serviceCenter?page=${pageVO.endPage +1}">[다음페이지그룹]</a>
						</c:if></li>

					<div
						style="width: 40%; height: 230px; margin: 0 auto; text-align: center;">
						<c:if test="${grade == 'system'}">
							<form method="post" action="scUpdate">
								<input type="text" pattern="[0-9]+" placeholder="번호 입력"
									size=48.5 name="sc_num">
								<textarea placeholder="답변 입력" maxlength='100' cols="50" rows="7"
									style="resize: none;" name="sc_answer"></textarea>
								<input type="submit" value="등록" style="width: 394px">
							</form>
						</c:if>
					</div>
				</ul>
			</div>
	</div>

	</c:if>








	<c:if test="${searchList != null }">
		<div style="width: 80%; height: 800px; margin: 0 auto;">
			<div
				style="width: 100%; height: 5%; text-align: center; border-bottom: 1px solid; border-top: 3px solid">
				<div style="width: 5%; float: left;">
					<span>번호</span>
				</div>
				<div style="width: 14%; float: left;">
					<span>답변상태</span>
				</div>
				<div style="width: 47%; float: left;">
					<span>제목</span>
				</div>
				<div style="width: 14%; float: left;">
					<span>작성자</span>
				</div>
				<div style="width: 20%; float: left;">
					<span>작성일</span>
				</div>
			</div>
			<ul
				style="width: 100%; height: 100%; border-width: 1px; list-style-type: none; padding-left: 0;">
				<c:forEach var="i" items="${searchList}" varStatus="idx">
					<li style="text-align: center; border-bottom: 1px solid;">
						<div style="width: 100%; height: 50px;">
							<div style="width: 5%; float: left;">
								<span>${i.sc_num}</span>
							</div>
							<c:if test="${i.sc_answer == null}">
								<div style="width: 14%; float: left;">
									<span>미답변</span>
								</div>
							</c:if>

							<c:if test="${i.sc_answer != null}">
								<div style="width: 14%; float: left;">
									<span>답변완료</span>
								</div>
							</c:if>
							<div style="width: 47%; float: left; cursor: pointer;"
								onclick="test111('${i.sc_num}')" class="divcl">
								<span>${i.sc_title}</span>
							</div>
							<div style="width: 14%; float: left;">
								<span>${i.u_id}</span>
							</div>
							<div style="width: 20%; float: left;">
								<span>${i.sc_date}</span>
							</div>
						</div>
						<div
							style="width: 100%; height: 100px; padding-left: 200px; display: none;"
							class='answer'>
							<c:if test="${i.sc_answer == null}">
								<div style="width: 558px; height: 40px; text-align: left;">
									<span>질문내용: ${i.sc_content}</span>
								</div>
								<div style="width: 558px; text-align: left;">
									<span>조금만 기다려 주세요</span>
								</div>
							</c:if>
							<c:if test="${i.sc_answer != null}">
								<div style="width: 558px; height: 40px; text-align: left;">
									<span>질문내용: ${i.sc_content}</span>
								</div>
								<div style="width: 558px; text-align: left;">
									<span>답변: ${i.sc_answer}</span>
								</div>
							</c:if>
						</div>


					</li>
				</c:forEach>



			</ul>
		</div>
	</c:if>









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
		document.getElementById('scSearch').addEventListener("click",
				function(event) {
					event.preventDefault();
					var searWord = document.getElementById('stext').value;
					window.location.href = "scSearch?sWord=" + searWord;
				})

		$(document).ready(function() {
			$('.answer').hide();
			$('.divcl').click(function() {
				$(this).parent().next('.answer').toggle();
			});
		});

		function test111(sc_num) {
			$.ajax({
				url : "http://localhost:8089/movies/cntplus",
				type : "post",
				data : {
					sc_num : sc_num
				},

				error : function() {
					alert('서버 요청 실패 ')
				}
			});
		}
	</script>
</body>
</html>



<style>
div.clickable {
	cursor: pointer;
	/* 추가적인 스타일 지정 가능 */
}

.div10 {
	width: 33.3%;
	height: 50%;
	float: left;
	border: 1px solid black;
	text-align: center;
}

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