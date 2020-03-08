<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/find.css">
<script src="http://code.jquery.com/jquery-1.11.2.min.js"></script>
<script src="http://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<body>
<header>
<%@include file="../littleLogo.jsp"%>
 <div style="font-size: large; color: whitegray; margin-left: 170px; padding-top: 12px">비밀번호 찾기</div>
</header>

<div align="center" style="margin-top: 30vh">
<fieldset style="width:450px; height:250px; padding-top: 27px;">
<table>
<form name="findpw" method="post">
		<tr>
			<th colspan="3">ID 입력</th>
		</tr>
		<tr>		
			<th colspan="3">
				<input class="margin" name="userid" required
					style="width: 400px; height: 35px" placeholder="ID 입력"></th>
		</tr>
		<tr>
			<th colpan="3">주민번호</th>
		</tr>
		<tr>
			<th colspan="3"><input onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" class="margin" id="front" type="text" name="front" onblur="idNumcheck()"
				style="width: 190px; height : 35px"> - 
			<input onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" class="margin" id="back" type="password" name="back" onblur="idNumcheck()"
				style="width: 190px; height : 35px"></th>
		</tr>
		<tr>
			<th colspan="3"><div id="idNumResult"></div></th>
		</tr>
		<tr>
			<th colspan="3" class="findbtn">
				<button class="find" id="find" style="width: 400px; height: 35px;">찾기</button>
<!-- 				<input class="find" id="find" style="width: 400px; height: 35px;" value="찾기"> -->
			</th>
		</tr>
	</form>
	</table>
	</fieldset>
	</div>
	<script type="text/javascript" language="javascript">
	function idNumcheck() {
		var str = document.getElementById('front').value;
		var str2 = document.getElementById('back').value;
		if (str == "" || str2 == ""){
			$('#idNumResult').text("주민등록번호를 입력해주세요");
			$('#idNumResult').css('color','red');}
		else {
			$.ajax({
				url : "idNumcheck",
				data : {
					front : str,
					back : str2
				},
				success : function(data) {
					if (data == "false"){
						$('#idNumResult').text("주민등록번호를 확인해주세요");
						$('#idNumResult').css('color','red');}
					else if (data == "true")
						$('#idNumResult').text("");
				}
			});
		}
	}
	
	$('#find').on('click', function() {
		idNumcheck();

		var result=$('#idNumResult').text();

		if (result == "") {
			document.findpw.submit();
		}
	});
	
	</script>
</body>
</html>