<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
				"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Ajax</title>

<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-1.11.2.min.js"></script>
<script src="http://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
</head>
<body>
	<div>
		<input type="text" id="nickname" name="nickname" placeholder="닉네임"
			required>
		<div id="nick_check"></div>
	</div>

	<script>
		$("#nickname")
				.blur(
						function() {

							var nickname = $('#nickname').val();
							$
									.ajax({
										url : '${pageContext.request.contextPath}/nickcheck?nickname='
												+ nickname,
										type : 'get',
										success : function(data) {
											console.log("1 = 중복o / 0 = 중복x : "
													+ data);

											if (data == 1) {

												$("#nick_check").text(
														"사용중인 닉네임입니다");
												$("#nick_check").css("color",
														"red");

											} else {

												if (nickname == "") {

													$('#nick_check').text(
															'닉네임을 입력해주세요');
													$('#nick_check').css(
															'color', 'red');

												} else {

													$('#nick_check').text(
															"사용가능한 닉네임 입니다");
													$('#nick_check').css(
															'color', 'blue');

												}

											}
										},
										error : function() {
											console.log("실패");
										}
									});
						});
	</script>
</body>
</html>