<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>새 글 쓰기</title>
<script src="resources/ckeditor/ckeditor.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.9.0.min.js"></script>
</head>
<body>
<h1>새 글 쓰기</h1>
<hr>
<form method="post">
	<table border="1">
		<tr>
			<th>제목</th><td><input type="text" name="title" value="${vo.title }"></td>
			<th>작성자</th><td>${vo.writer }</td>
		</tr>
		<tr>
			<td colspan="4"><textarea name="context" id="context" rows="10" cols="100">${vo.context }</textarea></td>
		</tr>
	</table>
	
	<input type="hidden" name="visit" value="${visit }">
	<input type="hidden" name="writer" value="${vo.writer }">
	<input type="hidden" name="bnum" value="${vo.bnum }">
	<input type="submit" value="작성완료">
</form>
</body>
<script>
var ckeditor_config = {
		   resize_enaleb : false,
		   enterMode : CKEDITOR.ENTER_BR,
		   shiftEnterMode : CKEDITOR.ENTER_P,
		   filebrowserUploadUrl : "images"
		 };
CKEDITOR.replace("context", ckeditor_config);
/* window.parent.CKEDITOR.tools.callFunction(1,"","전송완료"); */
</script> 
</html>