<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/home2.css">
</head>
<body style="background-color: white;">
	<div class="menu" style="position: fixed; background-color: white; z-index: 102;">
		<div class="blogboard">
			<a href="${pageContext.request.contextPath }?menu=board">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;블로그게시판</a>
		</div>
		<div class="myblog">
			<a href="blog?nickname=${sessionScope.login.nickname}">내 블로그</a>
		</div>
		<div class="qna">
			<a href="${pageContext.request.contextPath }?menu=qna">질문게시판&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>
		</div>
	</div>
</body>
</html>