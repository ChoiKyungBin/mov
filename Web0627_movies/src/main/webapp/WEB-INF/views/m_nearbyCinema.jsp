<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="True"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- CSS only -->


<html>
<head>
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

#mainCon {
	font-family: 'Noto Sans KR', sans-serif;
}

#actionView {
	width: end;
	height: 600px;
	background-color: yellow;
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
<body></body>





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
</body>
<div class="search-container">
	<div class="search">
		<input type="text" placeholder="영화 입력" id="stext" name="s_word"><a
			href="m_search"><img
			src="https://s3.ap-northeast-2.amazonaws.com/cdn.wecode.co.kr/icon/search.png"
			id="simg"></a>
	</div>
</div>


<!--  -->
<!-- <span style="">${nowId_addr} 입니다.</span> -->
<!--  리스트 넣을 자리. -->
<input type="hidden" name="user_addr" value="${nowId_addr}">
<input type="hidden" name="user_moviesbrand"
	value="${loginUser.favoriteMovieTheater}">
<div class="mainView">
	<div id="actionView">
		<div id="map" style="width: 100%; height: 100%;"></div>
	</div>
</div>
</html>

<style>
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

.search {
	position: relative;
	width: 300px;
	display: flex;
	align-items: center;
}

.search-container {
	display: flex;
	justify-content: center;
	align-items: center;
	height: 10vh;
}
</style>
<script>
	document.getElementById("simg").addEventListener("click", function(event) {
		event.preventDefault();
		var a = document.getElementById("stext").value;

		ps.keywordSearch(a, placesSearchCB);
	})

	function sub() {
		var search = document.getElementById("search").value;

		ps.keywordSearch(search, placesSearchCB);
	}

	var user_addr = $('input[name=user_addr]').val(); // 고객의 주소를 담은 변수 
	var user_moviesbrand = $('input[name=user_moviesbrand]').val(); //고객의 선호 영화관의 정보
	// 마커를 클릭하면 장소명을 표출할 인포윈도우 입니다
	var infowindow = new kakao.maps.InfoWindow({
		zIndex : 1
	});
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	mapOption = {
		center : new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
		level : 3
	// 지도의 확대 레벨
	};
	// 지도를 생성합니다    
	var map = new kakao.maps.Map(mapContainer, mapOption);
	// 장소 검색 객체를 생성합니다
	var ps = new kakao.maps.services.Places();
	// 키워드로 장소를 검색합니다

	ps.keywordSearch(user_addr + '영화관' + user_moviesbrand, placesSearchCB);
	// 키워드 검색 완료 시 호출되는 콜백함수 입니다
	function placesSearchCB(data, status, pagination) {
		if (status === kakao.maps.services.Status.OK) {
			// 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
			// LatLngBounds 객체에 좌표를 추가합니다
			var bounds = new kakao.maps.LatLngBounds();
			for (var i = 0; i < data.length; i++) {
				displayMarker(data[i]);
				bounds.extend(new kakao.maps.LatLng(data[i].y, data[i].x));
			}
			// 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
			map.setBounds(bounds);
		}
	}
	// 지도에 마커를 표시하는 함수입니다
	function displayMarker(place) {

		// 마커를 생성하고 지도에 표시합니다
		var marker = new kakao.maps.Marker({
			map : map,
			position : new kakao.maps.LatLng(place.y, place.x)
		});

		// 마커에 클릭이벤트를 등록합니다
		kakao.maps.event.addListener(marker, 'click', function() {
			// 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
			infowindow.setContent('<div style="padding:5px;font-size:12px;">'
					+ place.place_name + '</div>');
			infowindow.open(map, marker);
		});
	}
	document.getElementById("stext").addEventListener("keydown",
			function(event) {
				if (event.key === "Enter") {
					event.preventDefault();
					var a = this.value;
					window.location.href = "m_search?m_word=" + a;
				}
			});
</script>


