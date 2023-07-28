<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="True"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- CSS only -->
<html>
<head>
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
							alert('확인용  '+ idCheck);
							window.location.href = "m_nearbyCinema";
						}

					});
		});


   function inputC() {
      var id = document.getElementById("u_id").value
      var rating = document
            .querySelector('input[name="c_starPoint"]:checked');
      if (id === '') {
         alert('로그인 후 이용바랍니다.')
         return
      }
      if (rating === null) {
         alert('별점을 작성해주세요.');
         return;
      }
      var form = document.getElementById("form")
      alert('댓글이 작성되었습니다.');
      form.submit();
   }
   function removeC(id,comment,name){
      //alert('삭제하시겠습니까?')
      var flag = confirm('삭제하시겠습니까?');
      if(flag){
         window.location.href="m_detaile_c_remove?u_id="+id+"&c_comment="+comment+"&m_name="+name;
         alert('삭제되었습니다.')
         //삭제
      }else{
         //취소
      }
   }
	
   
   
   
   
  
   
   function getMovie(m_name, u_id) {
		$.ajax({
			url: "http://localhost:8089/movies/m_wishList_insert",
			type: "post",
			data: {
				m_name: m_name,
				u_id: u_id
			},
			dataType: "json",
			success: function(result) {
				if (result == 1) {
					alert('찜 등록되었습니다.');
				} else if (result == 2) {
					alert('찜은 5개 이상 등록할 수 없습니다.');
				} else if (result == 3) {
					alert('이미 찜 목록에 있는 영화입니다.');
				}
			},
			error: function() {
				alert('로그인 후 이용바랍니다.');
			}
		});
	}
   
   
   
   
   
</script>
<title>Home</title>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=73a375b8e0fd0f296454d626b8140d7c&libraries=services,clusterer,drawing,LIBRARY"></script>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
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
<style>
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

#mainCon {
	font-family: 'Noto Sans KR', sans-serif;
}

#actionView {
	width: end;
	height: 600px;
	margin: 7%;
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
<!-- JavaScript Bundle with Popper -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
	crossorigin="anonymous"></script>
</head>



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
<!--  -->
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
<hr>
<!--  -->
<!-- <span style="">${nowId_addr} 입니다.</span> -->
<!--  리스트 넣을 자리. -->




<input type="hidden" name="user_addr" value="${nowId_addr}">
<input type="hidden" name="user_moviesbrand"
	value="${loginUser.favoriteMovieTheater}">
<div style="width: 88%; margin: 0 auto;">
	<div class="main">
		<div id="imgView">
			<img alt="detail..." src="download?filename=${m_detail.m_filename}"
				style="height: 100%; width: 100%;">
		</div>
		<div id="inproduseView">
			<div style="width: 500px; height: 200px">
				<div id="title" style="height: 100px">
					<h1>${m_detail.m_name}</h1>
					<input type="button" value="찜하기"
						onclick="getMovie('${m_detail.m_name}','${userId}')">
				</div>
			</div>
			<div id="m_content" style="width: 700px;">
				<span>${m_detail.m_content}</span>
			</div>
		</div>
	</div>
	<div class="movieInfo">
		<div id="info">

			<!-- 영화한줄소개  -->
			<!-- <span style="color: blue;">${m_detail.m_oneline}</span> -->
			<table id="movieInfoTable">
				<tr>
					<th colspan="2">${m_detail.m_name}</th>
				</tr>
				<tr>
					<th>날짜</th>
					<td>${m_detail.m_country}</td>
				</tr>
				<tr>
					<th>장르</th>
					<td>${m_detail.m_genre}</td>
				</tr>
				<tr>
					<th>나이제한</th>
					<td>${m_detail.m_alimit}</td>
				</tr>
				<tr>
					<th>주연</th>
					<td>${m_detail.m_actor}</td>
				</tr>
				<tr>
					<th>감독</th>
					<td>${m_detail.m_director}</td>
				</tr>
				<tr>
					<th>러닝타임</th>
					<td>${m_detail.m_time}</td>
				</tr>
				<tr>
					<th>개봉날짜</th>
					<td>${m_detail.m_date}</td>
				</tr>
				<tr>
					<th>조회수</th>
					<td>${m_detail.m_views}</td>
				</tr>
			</table>
			<div style="width: 1090px;">
				<h1>평가 및 리뷰</h1>
				<span>총 ${listSize}건의 리뷰작성</span>
				<table>
					<tr>
						<th>순번</th>
						<th>작성자 이름</th>
						<th>작성 내용</th>
						<th>평점</th>
						<th>작성 날짜</th>
					</tr>
					<c:forEach var="i" items="${commentList}" varStatus="idx">
						<tr>
							<td>${idx.count}</td>
							<td>${i.u_id}</td>
							<td>${i.c_comment }</td>
							<td>${i.c_starPoint }</td>
							<td>${i.c_date}</td>
							<c:if test="${u_id==i.u_id}">
								<!-- 세션==i.u_id -->
								<td><input type="button" value="삭제"
									onclick="removeC('${u_id}','${i.c_comment}','${i.m_name}')"></td>

							</c:if>
						</tr>

					</c:forEach>


					<tr>
						<!--  page 정보 출력   page정보는 pageVO  객체가 저장하고 있음. 컨트롤러가 전달 함 -->
						<td colspan=8><c:if test="${pageVO.prev}">
								<a
									href="m_detail?page=${pageVO.startPage -1}&m_name=${m_detail.m_name}">[이전페이지그룹]</a>
							</c:if> <!--  page그룹 정보출력  변수명  startPage   endPage--> <c:forEach
								begin="${pageVO.startPage }" end="${pageVO.endPage}" var="idx">
								<a href="m_detail?page=${idx}&m_name=${m_detail.m_name}">${idx}</a>
							</c:forEach> <c:if test="${pageVO.next}">
								<a
									href="m_detail?page=${pageVO.endPage +1}&m_name=${m_detail.m_name}">[다음페이지그룹]</a>
							</c:if></td>
					</tr>
				</table>




				<div style="text-align: center;">
					<form id="form" method="get" action="m_detail_c">
						<!--  -->
						<input type="hidden" value="${m_detail.m_name}" name="m_name">
						<!--  -->
						<input type="hidden" value="${u_id}" name="u_id" id="u_id">
						<textarea placeholder="댓글을 입력 하세요 100자 제한" maxlength='100'
							cols="50" rows="10" style="resize: none;" name="c_comment"></textarea>
						<h5>별점주기</h5>
						<fieldset class="rate">
							<input type="radio" id="rating10" name="c_starPoint" value="10"><label
								for="rating10" title="5점"></label> <input type="radio"
								id="rating9" name="c_starPoint" value="9"><label
								class="half" for="rating9" title="4.5점"></label> <input
								type="radio" id="rating8" name="c_starPoint" value="8"><label
								for="rating8" title="4점"></label> <input type="radio"
								id="rating7" name="c_starPoint" value="7"><label
								class="half" for="rating7" title="3.5점"></label> <input
								type="radio" id="rating6" name="c_starPoint" value="6"><label
								for="rating6" title="3점"></label> <input type="radio"
								id="rating5" name="c_starPoint" value="5"><label
								class="half" for="rating5" title="2.5점"></label> <input
								type="radio" id="rating4" name="c_starPoint" value="4"><label
								for="rating4" title="2점"></label> <input type="radio"
								id="rating3" name="c_starPoint" value="3"><label
								class="half" for="rating3" title="1.5점"></label> <input
								type="radio" id="rating2" name="c_starPoint" value="2"><label
								for="rating2" title="1점"></label> <input type="radio"
								id="rating1" name="c_starPoint" value="1"><label
								class="half" for="rating1" title="0.5점"></label>
						</fieldset>
						<input type="button" value="댓글작성!" onclick="inputC()">
					</form>
				</div>
			</div>
		</div>
	</div>
</div>



</body>
</html>

<style>
@import
	url(//netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.css);

.main {
	width: end;
	height: 400px;
	display: flex;
	margin: 10px;
}

#imgView {
	width: 400px;
	height: 400px;
}

#inproduseView {
	width: 870px;
	height: 400px;
	margin-left: 10px;
}

#info {
	width: 1090px;
	height: 100%;
}

.movieInfo {
	width: end;
	height: auto;
	margin: 20px;
}

.movieInfo table {
	border-collapse: collapse;
	width: 100%;
}

.movieInfo th, .movieInfo td {
	padding: 8px;
	text-align: center;
	border-bottom: 2px solid #ddd;
	padding: 8px;
}

.movieInfo th {
	background-color: #f2f2f2;
}

.movieInfo tr:nth-child(even) {
	background-color: #f9f9f9;
}

.movieInfo tr:hover {
	background-color: #f5f5f5;
}

.rate {
	display: inline-block;
	border: 0;
	margin-right: 15px;
}

.rate>input {
	display: none;
}

.rate>label {
	float: right;
	color: #ddd
}

.rate>label:before {
	display: inline-block;
	font-size: 1rem;
	padding: .3rem .2rem;
	margin: 0;
	cursor: pointer;
	font-family: FontAwesome;
	content: "\f005 ";
}

.rate .half:before {
	content: "\f089 ";
	position: absolute;
	padding-right: 0;
}

.rate input:checked ~ label, .rate label:hover, .rate label:hover ~
	label {
	color: #f73c32 !important;
}

.rate input:checked+.rate label:hover, .rate input input:checked ~ label:hover,
	.rate input:checked ~ .rate label:hover ~ label, .rate label:hover ~
	input:checked ~ label {
	color: #f73c32 !important;
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

a {
	text-decoration: none;
	color: black;
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

