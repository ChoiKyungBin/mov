<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="True"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<style>
#genre {
	text-align: center;
}
</style>
<html>
<head>
<title>Home</title>
</head>
<body>

	<c:if test="${grade == 'system'}">
		<h2>
			<a href="m_input">영화소개글 작성</a>
		</h2>
	</c:if>
	<div id="d">
		<div class="child-div">
			<div id="loginBoxTitle">
				<a href="<%=request.getContextPath()%>/">Human Movies</a>
			</div>
		</div>
		<div class="child-div"></div>
		<div class="child-div" id="d1">
			<div style="padding-top: 2cm; margin-left: 3cm;">
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

	<!--  
   <table align="center" border="1" width="970" style='table-layout:fixed;'>
      
      <tr align="center">
         <td>
            <c:forEach var="i" items="${mainView}">
               <a href="."> <img src="download?filename=${i.m_filename}"height="250" width="80%">
               <p>${i.m_name}</p></a>
            </c:forEach>
         </td>
      </tr>
   </table>
-->
	<table align="center" border="1" width="970"
		style='table-layout: fixed;'>
		<c:forEach var="i" items="${genreView}" varStatus="status">

			<c:if test="${status.index % 3 == 0}">
				<tr align="center">
			</c:if>
			<td><a href="m_detail?m_name=${i.m_name }"> <img
					src="download?filename=${i.m_filename}" height="250" width="80%">
					<p>${i.m_name}</p></a></td>
			<c:if test="${status.index % 3 == 2 or status.last}">
				</tr>
			</c:if>

		</c:forEach>
	</table>



	<!--<table style="width: 10cm; table-layout: fixed;">
      <tr>
         <td><c:forEach var="i" items="${mainView}">
               <img src="download?filename=${i.m_filename}">
            </c:forEach></td>

      </tr>



   </table>  -->
</html>

<style>
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