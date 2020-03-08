<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@include file="../littleLogo.jsp"%>
<script type="text/javascript">
	alert('수정 성공');
	location.href="${pageContext.request.contextPath }";

</script>
</body>
</html>