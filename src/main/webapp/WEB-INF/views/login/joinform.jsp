<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
				"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/join.css">
<script src="http://code.jquery.com/jquery-1.11.2.min.js"></script>
<script src="http://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=685c21b38655384dd6dd4d8982a2a4e8&libraries=services"></script>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=685c21b38655384dd6dd4d8982a2a4e8"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<body>
<header>
<%@include file="../littleLogo.jsp"%>
 <div style="font-size: large; color: whitegray; margin-left: 170px; padding-top: 12px">회원가입</div>
</header>

	<nav>
		<table>
		<form method="POST" name="joinForm" id="joinform">
			<tr>
				<th colspan="3">아이디</th>
			</tr>
			<tr>
				<th colspan="3">
					<input class="margin" id="userid" type="text" name="userid" onblur="idcheck()"
						style="width: 400px; height: 35px" placeholder="아이디 입력"></th>
			</tr>
			<tr>
				<th colspan="3"><div id="idResult"></div></th>
			</tr>			
			<tr>
				<th colspan="3" >비밀번호</th>
			</tr>
			<tr>
				<th colspan="3" >
				<input class="margin" id="userpw" type="password" name="userpw" onblur="pwcheck()"
					style="width: 400px; height: 35px" placeholder="비밀번호 (8~13자리)"></th>
			</tr>
			<tr>
				<th colspan="3"><div id="pwResult"></div></th>
			</tr>
			<tr>
				<th colspan="3" >비밀번호 확인</th>
			</tr>
			<tr>
				<th colspan="3">
					<input class="margin" id="confirm" type="password"	name="confirm" onblur="cfcheck()"
						style="width: 400px; height: 35px" placeholder="비밀번호 재입력"></th>
			</tr>
			<tr>
				<th colspan="3"><div id="cfResult"></div></th>
			</tr>
			<tr>
				<th colspan="3">이름</th>
			</tr>
			<tr>
				<th colspan="3">
					<input class="margin" id="username" type="text" name="name" onblur="namecheck()"
					style="width: 400px; height: 35px" placeholder="이름 입력"></th>
			</tr>
			<tr>
				<th colspan="3"><div id="nameResult"></div></th>
			</tr>			
			<tr>
				<th colspan="3">닉네임</th>
			</tr>
			<tr>
				<th colspan="3">
					<input class="margin" type="text" id="nickname" name="nickname" placeholder="닉네임 입력" 
					onblur="nickcheck()" style="width: 400px; height: 35px"></th>
			</tr>
			<tr>
				<th colspan="3"><div id="nick_check"></div></th>
			</tr>			
			<tr>
				<th colspan="3">주소</th>
			</tr>
			<tr>
				<th >
					<input class="margin" type="text" id="sample5_address"	name="address"
						style="width:300px; height: 35px" placeholder="주소 입력"> </th>
				<th class="jusobtn" >
				<input type="button" class="juso" onclick="sample5_execDaumPostcode()" value="주소검색">
<!-- 				<button class="juso" onclick="sample5_execDaumPostcode()">주소검색</button></th> -->
<!-- 				<input type="button" onclick="sample5_execDaumPostcode()" value="주소 검색"	></th> -->
			</tr>
			<tr>
				<th colspan="3">주민번호</th>
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
				<th colspan="3">생년월일</th>
			</tr>
			<tr>
				<th colspan="3">
				<input onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" class="margin" id="birth" name="birth" placeholder="생년월일 (8자)" 
					style="width: 400px; height: 35px">	</th>
			</tr>
			<tr>
				<th colspan="3">휴대폰번호</th>
			</tr>
			<tr>
				<th colspan="3">
				<input onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" class="margin" id="phone" type="text" name="phone" onblur="phonecheck()" placeholder="휴대폰 번호(-없이 입력)"
					style="width: 400px; height: 35px"></th>
			</tr>
			<tr>
				<th colspan="3"><div id="phoneResult"></div></th>
			</tr>
			<tr>
				<th colspan="3">이메일</th>
			</tr>
			<tr>
				<th colspan="3">
				<input class="margin" id="email" type="text" name="email" onblur="emailcheck()"
					style="width: 400px; height: 35px" placeholder="이메일 입력"></th>
			</tr>
			<tr>
				<th colspan="3"><div id="emailResult"></div></th>
			</tr>
			<tr>
				<th colspan="3" class="joinbtn">
<!-- 					<button class="join" id="join" style="width: 400px; height: 35px">회원가입</button> -->
					<input type="button" id="join" class="join" value="회원가입"
						style="width: 400px; height: 35px">
				</th>
			</tr>
			<tr>
				<th colspan="3"><div id="result"></div></th>
			</tr>
			
		</form>
	</table>
	</nav>
		<script type="text/javascript" language="javascript">
			function nickcheck() {

				var nickname = $('#nickname').val();
				$
						.ajax({
							url : '${pageContext.request.contextPath}/nickcheck?nickname='
									+ nickname,
							type : 'get',
							success : function(data) {
								if (data == 1) {

									$("#nick_check").text("사용중인 닉네임입니다");
									$("#nick_check").css("color", "red");

								} else {

									if (nickname == "") {

										$('#nick_check').text('닉네임을 입력해주세요');
										$('#nick_check').css('color', 'red');

									} else {

										$('#nick_check').text("사용가능한 닉네임입니다");
										$('#nick_check').css('color', 'blue');

									}

								}
							},
							error : function() {
								console.log("실패");
							}
						});

			}
			function idcheck() {
				var str = document.getElementById('userid').value;
				if (str == ""){
					$('#idResult').text("아이디를 입력해주세요");
					$('#idResult').css('color','red');}
				else {
					$.ajax({
						url : "idcheck",
						data : {
							userid : str
						},
						success : function(data) {
							if (data == "success"){
								$('#idResult').text("이미사용중인 아이디입니다");
								$('#idResult').css('color','red');}
							else if (data == "fail"){
								$('#idResult').text("사용가능한 아이디입니다");
							$('#idResult').css('color','blue');}
						}
					});
				}
			}
			function addresscheck() {
				var str = document.getElementById('address').value;
				if (str == ""){
					$('#pwResult').text("주소를 입력해주세요");
					$('#pwResult').css('color','red');}
				else
					$('#pwResult').text("");
			}
			function birthcheck() {
				var str = document.getElementById('birth').value;
				if (str == ""){
					$('#pwResult').text("생년월일를 입력해주세요");
					$('#pwResult').css('color','red');}
				else
					$('#pwResult').text("");
			}
			

			function pwcheck() {
				var str = document.getElementById('userpw').value;
				if (str == ""){
					$('#pwResult').text("비밀번호를 입력해주세요");
					$('#pwResult').css('color','red');}
				else
					$('#pwResult').text("");
			}

			function cfcheck() {
				var str = document.getElementById('confirm').value;
				var str2 = document.getElementById('userpw').value;
				if (str == ""){
					$('#cfResult').text("비밀번호를 입력해주세요");
					$('#cfResult').css('color','red');}
				else if (str != str2){
					$('#cfResult').text("비밀번호가 일치하지 않습니다");
					$('#cfResult').css('color','red');}
				else
					$('#cfResult').text("");
			}

			function namecheck() {
				var str = document.getElementById('username').value;
				if (str == ""){
					$('#nameResult').text("이름을 입력해주세요");
					$('#nameResult').css('color','red');}
				else
					$('#nameResult').text("");
			}
			function getidnum(){
				var str = document.getElementById('front').value;
				var str2 = document.getElementById('back').value;
				$.ajax({
					url : "idnumrow",
					data : {
						front : str,
						back : str2
					},
					success : function(data) {
						if(data=="exist"){
							$('#idNumResult').text("이미가입된 번호");
							$('#idNumResult').css('color','red');
						}else{
							$('#idNumResult').text("");
						}
						
					}
				});
				
			}

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
								$('#idNumResult').css('color','red');
								}
							else if (data == "true"){
// 								$('#idNumResult').text("");
							getidnum();
						}
						$('#idNumResult').text("");
						var str3 = str2.substring(0,1);
	            		if(str3 == 1 || str3 == 2){
	            			$(document).ready(function() {
	            		        $('#birth').val(19+""+str);
	            		    });
	            		}
	            		else{
	            			$(document).ready(function() {
	            		        $('#birth').val(20+""+str);
	            		    });
	            		}
					}
					});
				}
			}

			function phonecheck() {
				var str = document.getElementById('phone').value;
				if (str == ""){
					$('#phoneResult').text("휴대폰번호를 입력해주세요");
					$('#phoneResult').css('color','red');}
				else
					$('#phoneResult').text("");
			}

			function emailcheck() {
				var str = document.getElementById('email').value;
				if (str == ""){
					$('#emailResult').text("이메일을 입력해주세요");
					$('#emailResult').css('color','red');}
				else
					$('#emailResult').text("");
			}

			function sample5_execDaumPostcode() {
				new daum.Postcode(
						{
							oncomplete : function(data) {
								var addr = data.address;			
								document.getElementById("sample5_address").value = addr;
								
							}
						}).open();
			}
			
			$('#join').on('click',
					function() {
						idcheck();
						pwcheck();
						cfcheck();
						namecheck();
						idNumcheck();
						phonecheck();
						emailcheck();
						nickcheck();

						var id = $('#idResult').text();
						var pw = $('#pwResult').text();
						var confirm = $('#cfResult').text();
						var name = $('#nameResult').text();
						var idnum = $('#idNumResult').text();
						var phone = $('#phoneResult').text();
						var email = $('#emailResult').text();
						var nick = $('#nick_check').text();

						if (id == "사용가능한 아이디입니다" && pw == "" && confirm == ""
								&& name == "" && idnum == "" && phone == ""
								&& email == "" && nick == "사용가능한 닉네임입니다") {
							document.joinForm.submit();
						} else {
							$('#result').text("정보를 제대로 입력해주세요.")
							$('#result').css('color','red');
						}
					});

		</script>




	</div>
</body>
</html>