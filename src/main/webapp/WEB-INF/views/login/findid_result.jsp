<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/layout1.css">
<body id="find" style="padding-top: 32vh;">
<a href="${pageContext.request.contextPath}"><%@include file="../littleLogo.jsp"%>
</a>
<div align="center" style="margin-top: 50px">
	<fieldset style="width: 450px; height:150px">
	<table>
	<tr>
		<th>
			<c:if test="${not empty result}">
				<h1>아이디<br>
				${result.userid }</h1>
			</c:if>
			<c:if test="${empty result }">
				<h1 style="color:red; padding-top: 22px;">존재하지않는 회원입니다<br></h1>
			</c:if>
		</th>
	</tr>
	<tr>
		<th>
			<button onclick="history.back()">이전 페이지</button>
			<button onclick="location.replace('${pageContext.request.contextPath}')">로그인</button>
			<button onclick="location.replace('${pageContext.request.contextPath}/join')">회원가입</button>
<!-- 	<input type="button" -->
<%-- 			value="홈 으로" onclick="location.replace('${pageContext.request.contextPath}')"> --%>
		</th>
	</tr>
	</table>
	</fieldset>
</div>
</body>
</html>