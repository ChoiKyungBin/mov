<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>
		<div id="loginBoxTitle">
			<a href="<%=request.getContextPath()%>/">Human Movies</a>
		</div>
	</h1>

	<form action="m_input_save" method="post" encType="multipart/form-data"
		name="nU">
		<table style="width: 50vw;">
			<tr>
				<td colspan="2">영화등록</td>
			</tr>
			<tr>
				<td>영화 이름</td>
				<td><input type="text" name="m_name" style="width: 300px;"></td>
			</tr>
			<tr>
				<td>한줄 소개</td>
				<td><input type="text" name="m_oneline" style="width: 300px;"></td>
			</tr>
			<tr>
				<td>소개</td>
				<td><input type="text" name="m_content"
					style="width: 300px; height: 200px;"></td>
			</tr>
			<tr>
				<td>국가</td>
				<td><input type="text" name="m_country"></td>
			</tr>
			<tr>
				<td>장르</td>
				<td><select id="select1" name="m_genre">
						<option value="액션">액션</option>
						<option value="코미디">코미디</option>
						<option value="공포">공포</option>
						<option value="로맨스">로맨스</option>
						<option value="애니메이션">애니메이션</option>
				</select></td>
			</tr>
			<tr>
				<td>나이제한</td>
				<td><input type="text" name="m_alimit"></td>
			</tr>
			<tr>
				<td>배우</td>
				<td><input type="text" name="m_actor"></td>
			</tr>
			<tr>
				<td>감독</td>
				<td><input type="text" name="m_director"></td>
			</tr>
			<tr>
				<td>개봉일</td>
				<td><input type="date" name="m_date"></td>
			</tr>
			<tr>
				<td>시간</td>
				<td><input type="text" name="m_time"></td>
			</tr>
			<tr>
				<td>포스터(파일)</td>
				<td><input type="file" name="file"></td>
			</tr>
			<tr>
				<td colspan="2"><input type="button" value="영화등록"
					onclick="checkPw()"></td>
			</tr>


		</table>
	</form>


</body>
</html>
<style>
#select1 {
	width: 4.8cm;
}

table {
	border-collapse: collapse;
	width: 100%;
}

th, td {
	whidth: 25%;
	padding: 8px;
	text-align: Center;
	border-bottom: 2px solid #ddd;
	padding: 8px;
}

th {
	background-color: #f2f2f2;
}

tr:nth-child(even) {
	background-color: #f9f9f9;
}

tr:hover {
	background-color: #f5f5f5;
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
<script>
	function checkPw() {
		//alert('cc')
		document.getElementsByName('nU')[0].submit();
	}
</script>