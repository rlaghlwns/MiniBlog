<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="resources/js/reply-func.js"></script>
<script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>

<script type="text/javascript">

// 수정 + 파일첨부 버튼
$(function () {
	$('#btn-upload').click(function (e) {
	e.preventDefault();
	$('#file').click();
	});
});
	
// 사진 미리 보기	
function LoadImg(value) {
	if(value.files && value.files[0]) {
		var reader = new FileReader();
		reader.onload = function(e) {
			$('#LoadImg').attr('src', e.target.result);
		}
		reader.readAsDataURL(value.files[0]);
	}
}
</script>
<style type="text/css">
.inputbtn {
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
.inputbtn:hover{background-color: #2c2c2c;}
</style>
</head>
<body>
<div>
<%@include file="../littleLogo.jsp"%>
   <div style="font-size: large; margin-left: 45px; padding-top: 14px; position: fixed; top: 0;">프로필 수정</div>
</div>



<!-- 수정 -->

<div align="center" style="margin-top: 23vh">
<fieldset style="width:450px; height:250px; padding-top: 40px;">
	<img id="LoadImg" src="LoadImg" style="height: 150px"><br><br>
<form method="post" action="profile" enctype="multipart/form-data">
	
	<input type="file" name="file" id="file" onchange="LoadImg(this);" style="display:none">
	<button class="inputbtn" type="button" id="btn-upload" >사진 수정</button>
	
	<!-- 사진 삭제(버튼 이벤트 발생했을때) 했을 때 name="file"값이 null이 되도록 set -->
	<!-- 버튼 이벤트 발생안했다면 vo.profile 유지되게 -->
	<!-- <button type="button" onclick="test(file)">사진 삭제</button><a></a> <br>-->
	<input type="submit" class="inputbtn" value="수정 완료">
</form>


</fieldset>
</div>


<!-- 삭제 -->
<br>
<%-- <input type="button" value="메인으로" onclick="location.replace('${pageContext.request.contextPath}')"> --%>
</body>
</html>