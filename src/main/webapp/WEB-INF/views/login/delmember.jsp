<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
				"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-1.11.2.min.js"></script>
<script src="http://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>

</head>
<body>
	<header> <%@include file="../littleLogo.jsp"%>
	<div
		style="font-size: large; color: whitegray; margin-left: 170px; padding-top: 12px">회원탈퇴</div>
	</header>
	<div align="center" style="margin-top: 30vh">
		<fieldset style="width: 450px; height: 280px; padding-top: 40px;">
			<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
			<form name="delform" method="post" action="delmember">
				<table>
					<tr>
						<th colspan="3">이름</th>
					</tr>
					<tr>
						<th colspan="3"><input name="name" id="name" type="text"
							onblur="namecheck()"><br>
							<div id="nameResult"></div></th>
					</tr>
					<tr>
						<th colspan="3">ID</th>
					</tr>

					<tr>
						<th colspan="3"><input name="userid" id="userid" type="text"
							onblur="idcheck()"><br>
							<div id="idResult"></div></th>
					</tr>

					<tr>
						<th colspan="3">PW</th>
					</tr>

					<tr>
						<th colspan="3"><input type="password" id="userpw"
							onblur="pwcheck()" name="userpw"><br>
							<div id="pwResult"></div></th>
					</tr>
				</table>
				<br>
				<input
					style="width: 100px; height: 50px; background-color: black; color: white"
					type="button" value="탈퇴하기" id="delbtn">
			</form>
		</fieldset>
	</div>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#delbtn").click(function() {
				if (confirm("탈퇴하시겠습니까?\n 기입한 정보가 일치하지 않으면 탈퇴가 되지 않습니다.")) {
					document.delform.submit();
				}
			});
		});
	</script>


	<script type="text/javascript" language="javascript">
		function namecheck() {
			var name = document.getElementById('name').value;
			if (name == "") {
				$('#nameResult').text("이름 입력해주세요");
				$('#nameResult').css('color', 'red');
			} else {
				$('#nameResult').text("");
			}

		}
		function idcheck() {
			var userid = document.getElementById('userid').value;
			if (userid == "") {
				$('#idResult').text("아이디를 입력해주세요");
				$('#idResult').css('color', 'red');
			} else {
				$('#idResult').text("");
			}
		}

		function pwcheck() {
			var userpw = document.getElementById('userpw').value;
			if (userpw == "") {
				$('#pwResult').text("비밀번호 입력해주세요");
				$('#pwResult').css('color', 'red');
			} else {
				$('#pwResult').text("");
			}
		}
	</script>

</body>
</html>