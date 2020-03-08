<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mainlogin.css">
<link href="https://fonts.googleapis.com/css?family=Amaranth&display=swap" rel="stylesheet">
<script type="text/javascript" src="resources/js/board-page.js"></script>
<script type="text/javascript" src="resources/js/mainlogin2.js"></script>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- <%@include file="mainback.jsp"%> --%>
<body id="mainlogin">

<div align="center">
<div style="width: 500px; margin-top: 70px; box-shadow: 0px 8px 15px rgba(100, 100, 100, 100);" align="center">

	<div id="logodiv" style="padding-top: 50px;">
		<a href="${pageContext.request.contextPath }">
			<img src="resources/images/logo.png" style="height: 70px; width: auto;">
		</a>
	</div>
	
	<div id="div" style="margin-top: 50px;">
			<form method="post">
				<div class="loginform">
					<input class="idpw-input idpw-animate-input" name="userid"
						placeholder="id입력" required><br> <input
						class="idpw-input idpw-animate-input" name="userpw"
						placeholder="pw입력" type="password" style="margin-top: 10px"
						required><br>
				</div>
				<div class="loginbtn">
					<input id="login" class="login" type="submit" value="login"
						style="margin-top: 10px">
				</div>
				<br>
				<div class="checkbox">
					<input id="box" class="check" type="checkbox" name="auto"><label
						for="box" class="label">&nbsp;자동로그인</label>
				</div>
			</form>
			<p style="color: red">${fail }</p>
			<br> <a class="a"
				href="${pageContext.request.contextPath }/join">회원가입</a> &nbsp;
			<p>|</p>
			&nbsp;<a class="a" href="findid">아이디 찾기</a>&nbsp;
			<p>|</p>
			&nbsp;<a class="a" href="findpw">비밀번호 찾기</a>
	</div>
</div>
</div>
</body>
</html>