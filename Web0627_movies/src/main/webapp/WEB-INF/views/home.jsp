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
	<div class="mainView">
		<form action="">
			<div class="search-container">
				<div class="search">
					<input type="text" placeholder="영화 입력" id="stext" name="s_word"><a
						href="m_search"><img
						src="https://s3.ap-northeast-2.amazonaws.com/cdn.wecode.co.kr/icon/search.png"
						id="simg"></a>
				</div>
			</div>
		</form>
		<div align="center">
			<font id="mainCon">장르별 TOP6</font>
		</div>
		<div id="actionView">
			<div id="imageView">
				<div id="actionslide" class="carousel slide" data-bs-ride="false">
					<div class="carousel-inner">
						<c:forEach items="${actionview}" var="i" varStatus="status">
							<c:if test="${status.count % 3 == 1}">
								<div
									class="carousel-item <c:if test='${status.count == 1}'>active</c:if>">
									<div class="row" style="width: 100%; height: 100%;">
										<c:forEach begin="${status.count - 1}"
											end="${status.count + 1}" items="${actionview}" var="img"
											varStatus="imgStatus">
											<div class="col">
												<div
													style="height: 100%; display: flex; flex-direction: column; position: relative"
													id="imgtest1">
													<a href="m_detail?m_name=${img.m_name}" class="hoverimg"
														style="width: 100%; height: 100%;"> <img
														src="download?filename=${img.m_filename}" alt="..."
														style="width: 100%; height: 100%; object-fit: cover;">
														<div class="hovertext">
															<h3>${img.m_oneline}</h3>
														</div>
													</a>
												</div>
											</div>
										</c:forEach>
									</div>
								</div>
							</c:if>
						</c:forEach>
					</div>

					<button class="carousel-control-prev" type="button"
						data-bs-target="#actionslide" data-bs-slide="prev">
						<span class="carousel-control-prev-icon" aria-hidden="true"></span>
						<span class="visually-hidden">Previous</span>
					</button>
					<button class="carousel-control-next" type="button"
						data-bs-target="#actionslide" data-bs-slide="next">
						<span class="carousel-control-next-icon" aria-hidden="true"></span>
						<span class="visually-hidden">Next</span>
					</button>
				</div>
				<div align="center">
					<font id="mainCon">액션 best top 6!!</font>
				</div>
			</div>
		</div>


		<div id="horrolView">
			<div id="imageView">
				<div id="horrolslide" class="carousel slide" data-bs-ride="false">
					<div class="carousel-inner">
						<c:forEach items="${horrorview}" var="i" varStatus="status">
							<c:if test="${status.count % 3 == 1}">
								<div
									class="carousel-item <c:if test='${status.count == 1}'>active</c:if>">
									<div class="row" style="width: 100%; height: 100%;">
										<c:forEach begin="${status.count-1}" end="${status.count + 1}"
											items="${horrorview}" var="img" varStatus="imgStatus">
											<div class="col">
												<div
													style="height: 100%; display: flex; flex-direction: column; position: relative"
													id="imgtest1">
													<a href="m_detail?m_name=${img.m_name}" class="hoverimg"
														style="width: 100%; height: 100%;"> <img
														src="download?filename=${img.m_filename}" alt="..."
														style="width: 100%; height: 100%; object-fit: cover;">
														<div class="hovertext">
															<h3>${img.m_oneline}</h3>
														</div>
													</a>
												</div>
											</div>
										</c:forEach>
									</div>
								</div>
							</c:if>
						</c:forEach>
					</div>
					<button class="carousel-control-prev" type="button"
						data-bs-target="#horrolslide" data-bs-slide="prev">
						<span class="carousel-control-prev-icon" aria-hidden="true"></span>
						<span class="visually-hidden">Previous</span>
					</button>
					<button class="carousel-control-next" type="button"
						data-bs-target="#horrolslide" data-bs-slide="next">
						<span class="carousel-control-next-icon" aria-hidden="true"></span>
						<span class="visually-hidden">Next</span>
					</button>
				</div>
				<div align="center">
					<font id="mainCon">공포 best top 6!!</font>
				</div>
			</div>
		</div>


		<div id="romanceView">
			<div id="imageView">
				<div id="romanceslide" class="carousel slide" data-bs-ride="false">
					<div class="carousel-inner">
						<c:forEach items="${romanceview}" var="i" varStatus="status">
							<c:if test="${status.count % 3 == 1}">
								<div
									class="carousel-item <c:if test='${status.count == 1}'>active</c:if>">
									<div class="row" style="width: 100%; height: 100%;">
										<c:forEach begin="${status.count - 1}"
											end="${status.count + 1}" items="${romanceview}" var="img"
											varStatus="imgStatus">
											<div class="col">
												<div
													style="height: 100%; display: flex; flex-direction: column; position: relative"
													id="imgtest1">
													<a href="m_detail?m_name=${img.m_name}" class="hoverimg"
														style="width: 100%; height: 100%;"> <img
														src="download?filename=${img.m_filename}" alt="..."
														style="width: 100%; height: 100%; object-fit: cover;">
														<div class="hovertext">
															<h3>${img.m_oneline}</h3>
														</div>
													</a>
												</div>
											</div>
										</c:forEach>
									</div>
								</div>
							</c:if>
						</c:forEach>
					</div>
					<button class="carousel-control-prev" type="button"
						data-bs-target="#romanceslide" data-bs-slide="prev">
						<span class="carousel-control-prev-icon" aria-hidden="true"></span>
						<span class="visually-hidden">Previous</span>
					</button>
					<button class="carousel-control-next" type="button"
						data-bs-target="#romanceslide" data-bs-slide="next">
						<span class="carousel-control-next-icon" aria-hidden="true"></span>
						<span class="visually-hidden">Next</span>
					</button>
				</div>
				<div align="center">
					<font id="mainCon">로맨스 best top 6!!</font>
				</div>
			</div>
		</div>


		<div id="aniView">
			<div id="imageView">
				<div id="anislide" class="carousel slide" data-bs-ride="false">
					<div class="carousel-inner">
						<c:forEach items="${animationview}" var="i" varStatus="status">
							<c:if test="${status.count % 3 == 1}">
								<div
									class="carousel-item <c:if test='${status.count == 1}'>active</c:if>">
									<div class="row" style="width: 100%; height: 100%;">
										<c:forEach begin="${status.count - 1}"
											end="${status.count + 1}" items="${animationview}" var="img"
											varStatus="imgStatus">
											<div class="col">
												<div
													style="height: 100%; display: flex; flex-direction: column; position: relative"
													id="imgtest1">
													<a href="m_detail?m_name=${img.m_name}" class="hoverimg"
														style="width: 100%; height: 100%;"> <img
														src="download?filename=${img.m_filename}" alt="..."
														style="width: 100%; height: 100%; object-fit: cover;">
														<div class="hovertext">
															<h3>${img.m_oneline}</h3>
														</div>
													</a>
												</div>
											</div>
										</c:forEach>
									</div>
								</div>
							</c:if>
						</c:forEach>
					</div>
					<button class="carousel-control-prev" type="button"
						data-bs-target="#anislide" data-bs-slide="prev">
						<span class="carousel-control-prev-icon" aria-hidden="true"></span>
						<span class="visually-hidden">Previous</span>
					</button>
					<button class="carousel-control-next" type="button"
						data-bs-target="#anislide" data-bs-slide="next">
						<span class="carousel-control-next-icon" aria-hidden="true"></span>
						<span class="visually-hidden">Next</span>
					</button>
				</div>
				<div align="center">
					<font id="mainCon">애니 best top 6!!</font>
				</div>
			</div>
		</div>


		<div id="comedyView">
			<div id="imageView">
				<div id="comedyslide" class="carousel slide" data-bs-ride="false">
					<div class="carousel-inner">
						<c:forEach items="${comedyview}" var="i" varStatus="status">
							<c:if test="${status.count % 3 == 1}">
								<div
									class="carousel-item <c:if test='${status.count == 1}'>active</c:if>">
									<div class="row" style="width: 100%; height: 100%;">
										<c:forEach begin="${status.count - 1}"
											end="${status.count + 1}" items="${comedyview}" var="img"
											varStatus="imgStatus">
											<div class="col">
												<div
													style="height: 100%; display: flex; flex-direction: column; position: relative"
													id="imgtest1">
													<a href="m_detail?m_name=${img.m_name}" class="hoverimg"
														style="width: 100%; height: 100%;"> <img
														src="download?filename=${img.m_filename}" alt="..."
														style="width: 100%; height: 100%; object-fit: cover;">
														<div class="hovertext">
															<h3>${img.m_oneline}</h3>
														</div>
													</a>
												</div>
											</div>
										</c:forEach>
									</div>
								</div>
							</c:if>
						</c:forEach>
					</div>
					<button class="carousel-control-prev" type="button"
						data-bs-target="#comedyslide" data-bs-slide="prev">
						<span class="carousel-control-prev-icon" aria-hidden="true"></span>
						<span class="visually-hidden">Previous</span>
					</button>
					<button class="carousel-control-next" type="button"
						data-bs-target="#comedyslide" data-bs-slide="next">
						<span class="carousel-control-next-icon" aria-hidden="true"></span>
						<span class="visually-hidden">Next</span>
					</button>
				</div>
				<div align="center">
					<font id="mainCon">코미디 best top 6!!</font>
				</div>
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

		document.getElementById("simg").addEventListener("click",
				function(event) {
					var a = document.getElementById("stext").value;
					event.preventDefault();

					window.location.href = "m_search?m_word=" + a;
				});
		document.getElementById("stext").addEventListener("keydown",
				function(event) {
					if (event.key === "Enter") {
						event.preventDefault();
						var a = this.value;
						window.location.href = "m_search?m_word=" + a;
					}
				});
	</script>
</body>
</html>

<style>
a {
	text-decoration: none;
	color: black;
}

.hoverimg {
	position: relative;
	overflow: hidden;
}

.hoverimg:hover img {
	filter: blur(3px) brightness(40%);
	transform: scale(1.05);
	transition: 0.5s;
}

.hoverimg .hovertext {
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	color: #e9e9eb;
	opacity: 0;
	transition: 0.5s;
	font-family: "Last Ninja", Impact, fantasy;
}

.hoverimg:hover .hovertext {
	opacity: 1;
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
	width: 100%;
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

.child-div {
	flex-basis: 30%;
	height: 100px;
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
</style>

