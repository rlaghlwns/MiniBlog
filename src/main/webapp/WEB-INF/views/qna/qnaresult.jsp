<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>::: 질문 확인 :::</title>
<link rel="stylesheet" type="text/css" href="resources/css/board-result.css">
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="resources/js/reply-func.js"></script>
<script type="text/javascript">
   $(function() {
       $("#qnaForm").on("submit", function(event) {
           var content = document.querySelector("#qcontent").value;
           if(content === "") {
               alert("내용을 입력하세요.");
               event.preventDefault();
           }
           else{
               var request = new XMLHttpRequest();
               request.open("POST", "/test/qnaresult");
               request.send();
           }
       })
   });
</script>
</head>
<body>

<!-- 질문 보여지는 div -->
<div id="resultpage" align="center">
<form method="post" action="qnaupdate?qnum=${vo.qnum }">
   <table border="1" id="qnaupdateForm">
      <tr>
         <th>${vo.qnum }</th><th>${vo.qtitle }</th><th>${vo.qwriter }</th><th>${vo.qdate }</th>
      </tr>

      <tr>
         <td colspan="4" align="center">${vo.qcontent }</td>
      </tr>   
   </table>
   <p>
   <input type="button" value="목록" onclick="location.replace('${pageqcontent.request.contextPath}/test/qnahome')">
<%--    <a href="qnaupdate?qnum=${vo.qnum }"><button>수정</button></a> --%>
   <input type="button" value="수정" onclick="QNAupdateForm('qnaupdateForm', '${vo.qwriter}', '${vo.qcontent }', 'qcontent', '${vo.qtitle }')">
   <a href="qnadelete?qnum=${vo.qnum }&qwriter=writer "><button>삭제</button></a>
                           <!-- login member 객체의 id 혹은 name과 대조 -->
</form>
   <p>
   
   <!-- 관리자만 답글 폼 생성(합칠 때 주석 풀기!) -->
 <c:if test="${sessionScope.login.userid eq 'admin'}"> 
   <c:if test="${vo.qreply eq '0' || vo.replydeleted eq '1'}">
   <form method="post" id="qnaForm">
   <table border="1">
      <tr>
         <th>profile</th><th>관리자</th>
      </tr>
      <tr>
         <td colspan="2">
            <textarea id="rcontext" name="qreply" placeholder="댓글 쓰는 곳" rows="5" ></textarea>
            <input type="hidden" name="qwriter" value="${login.userid }">
            <input type="hidden" name="qnum" value="${vo.qnum }">
            
         </td>
      </tr>
      <tr>
         <td colspan="2" align="right">
         <input type="submit" value="등록">
         </td>      
      </tr>
   </table>
   </form>
</c:if>
</c:if> 
   <p>
   
   <!-- 답글 보여지는 폼 -->
   
   <c:if test="${ vo.qreply ne '0' && vo.replydeleted eq '0'}">
 
      <form method="post">
      <input type="hidden" name="qnaupdate" value="qnaupdate">
      <input type="hidden" name="qnum" id="qnum" value="${vo.qnum }">
      <input type="hidden" name="qdate" value="${vo.qdate }">
      <input type="hidden" name="qwriter" value="${vo.qwriter }">
      <input type="hidden" name="qtitle" value="${vo.qtitle }">
      <table  style="border:1px solid; " id="qnareplyForm">
         <tr><th>profile</th><th>${vo.qwriter }</th></tr>
         <tr>
            <td colspan="2">
               ${vo.qreply }
               <br>
               <font color="gray">${vo.qdate }</font>
            </td>
         </tr>
         <tr>
            <td><input type="button" value="수정" onclick="updateForm('qnareplyForm','${vo.qwriter }','${vo.qreply }', 'qreply', 'null')">
            <a href="qnadelete?qnum=${vo.qnum }"><button type="button">삭제</button></a>
            </td>   
         </tr>
      </table>
      </form>  
   <br>
 
   </c:if>
   
</div>
</body>
</html>