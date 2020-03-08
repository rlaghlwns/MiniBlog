<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>::: Q n A :::</title>
</head>
<body>
<div id="boardmain">
<table border="1">
	<tr>
		<td>No.</td>
		<td width="50%">제목</td>
		<td>작성자</td>
		<td>등록일</td>
	</tr>
	<c:forEach items="${viewAll }" var="list">
		<tr>
			<td>${list.qnum }</td>
			<td><a href='qnaresult?qnum=${list.qnum }'>${list.qtitle }</a></td>
			<td>${list.qwriter }</td>
			<td>${list.qdate }</td>
		</tr>
	</c:forEach>
</table>

	<div id="right-div"><a href="newQNA"><button>질문하기</button></a><br></div>

	<div id="pagebutton">		
		<c:if test="${paging.startPage != 1 }">
			<a href="/test/?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">&lt;</a>
		</c:if>
		<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
			<c:choose>
				<c:when test="${p == paging.nowPage }">
					<b>${p }</b>
				</c:when>
				<c:when test="${p != paging.nowPage }">
					<a href="/test/?nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a>
				</c:when>
			</c:choose>
		</c:forEach>
		<c:if test="${paging.endPage != paging.lastPage}">
			<a href="/test/?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">&gt;</a>
		</c:if>
	</div>
</div>
</body>
</html>