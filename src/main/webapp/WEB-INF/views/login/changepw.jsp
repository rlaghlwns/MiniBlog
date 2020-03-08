<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-1.11.2.min.js"></script>
<script src="http://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style type="text/css">
#change {
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
#change:hover{background-color: #2c2c2c;}

</style>
</head>
<body id="find">
<a href="${pageContext.request.contextPath}"><%@include file="../littleLogo.jsp"%>
</a>

<div align="center" style="margin-top: 30vh">
<fieldset style="width:450px; height:250px; padding-top: 22px;">
<table>
	<form method="post" name="changepw" action="chagepw">
		<tr>
			<th>변경할 비밀번호</th>
		</tr>
		<tr>		
			<th>
				<input class="margin" name="userpw" id="userpw" onblur="pwcheck()" required
					type="password" style="width: 400px; height: 35px; margin-bottom: 20px" placeholder="비밀번호 입력"></th>
		</tr>
		<tr>
			<th><div class="margin" id="pwResult"></div></th>
		</tr>
		<tr>
			<th>비밀번호 확인</th>
		</tr>
		<tr>		
			<th>
				<input class="margin" name="confirm" id="cfpw" onblur="cfcheck()" required
					type="password" style="width: 400px; height: 35px; margin-bottom: 20px" placeholder="비밀번호 확인"></th>
		</tr>
		<tr>
			<th><div class="margin" id="cfResult" style="color: red"></div></th>
		</tr>
		<tr>
		<th>
<!-- 			<button id="change">변경하기</button> -->
			<input type="hidden" name="userid" value="${userid }">
			<input type="button" id="change" value="변경하기">
		</th>
	</tr>
	</form>
	</table>
</fieldset>
</div>
	<script type="text/javascript" language="javascript">
		function pwcheck() {
			var str = document.getElementById('userpw').value;
			if (str == "")
				$('#pwResult').text("비밀번호를 입력해주세요");
			else
				$('#pwResult').text("");
		}

		function cfcheck() {
			var str = document.getElementById('cfpw').value;
			var str2 = document.getElementById('userpw').value;
			if (str == "")
				$('#cfResult').text("비밀번호를 입력해주세요");
			else if (str != str2)
				$('#cfResult').text("비밀번호가 일치하지 않습니다");
			else
				$('#cfResult').text("");
		}

		$('#change').on('click', function() {
			pwcheck();
			cfcheck();

			var pw = $('#pwResult').text();
			var confirm = $('#cfResult').text();

			if (pw == "" && confirm == "") {
				document.changepw.submit();
			}
		});
	</script>
</body>
</html>