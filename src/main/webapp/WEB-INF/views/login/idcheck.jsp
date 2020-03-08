<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
				"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Ajax</title>

<script src="http://code.jquery.com/jquery-1.11.2.min.js"></script>
<script src="http://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>

</head>
<body>
	<div>
		<input type="text" id="userid"
			name="userid" placeholder="ID" required>
		<div id="id_check"></div>
	</div>

	<script>

		$("#userid")
				.blur(
						function() {

							var userid = $('#userid').val();
							$.ajax({
										url : '${pageContext.request.contextPath}/idcheck?userid='
												+ userid,
										type : 'get',
										success : function(data) {
											console.log("1 = 중복o / 0 = 중복x : "
													+ data);

											if (data == 1) {

												$("#id_check").text(
														"사용중인 아이디입니다");
												$("#id_check").css("color",
														"red");

											} else {

												if (userid == "") {

													$('#id_check').text(
															'아이디를 입력해주세요');
													$('#id_check').css('color',
															'red');

												} else {

													$('#id_check')
															.text(
																	"사용가능한 아이디 입니다.");
													$('#id_check').css('color',
															'blue');

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

