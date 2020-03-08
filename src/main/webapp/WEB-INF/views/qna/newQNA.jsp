<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>::: 질문 등록 :::</title>

</head>
<body>

<form method="post">
	<table border="1">
		<tr>
			<th>제목</th><td><input type="text" name="qtitle" required="required"></td>
			<th>작성자</th><td>test${vo.writer }</td>
		</tr>
		<tr>
			<td colspan="4"><textarea name="qcontent" id="qcontent" rows="10" cols="100"></textarea></td>
		</tr>
	</table>
	<input type="hidden" name="qwriter" value="관리자">
	<input type="submit" value="작성완료">
</form>
</body>
</html>