<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.btn {
   width:100px;
    background-color: black;
    border: none;
    color:#fff;
    padding: 15px 0;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 15px;
    margin: 4px;
    cursor: pointer;
}
.btn:hover{background-color: #2c2c2c;}
</style>
</head>

<body>
<%@include file="../littleLogo.jsp"%>
 <div style="font-size: large; color: whitegray; margin-left: 170px; padding-top: 12px">비밀번호 확인</div>
		<div align="center" style="margin-top: 30vh">
	<form method="POST">
<fieldset style="width:450px; height:170px; padding-top: 40px;">
			<strong>비밀번호를 입력하세요.</strong> <br> <br>
			<input type="password" name="userpw" placeholder="PW"> &nbsp;<br> <br>
			<input type="submit" class="btn" value="확인"><br>
			<b style="color: red">${fail }</b>
		</fieldset>
	</form>
	</div>
</body>
</html>