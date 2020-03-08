<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
            "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
   href="${pageContext.request.contextPath}/resources/css/update.css">
<script src="http://code.jquery.com/jquery-1.11.2.min.js"></script>
<script src="http://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>

</head>
<body id="update">
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<header>
   <%@include file="../littleLogo.jsp"%>
   <div style="font-size: large; margin-left: 45px; padding-top: 14px; position: fixed; top: 0;">내 정보</div>
</header>   
   <div style="padding-left: 30%; padding-right: 30%;" align="center">
      <fieldset style="wifdth:250px; height:620px; margin: auto;">
      <form action="update" method="post" name="changeform">
      <table>
         <tr class="margin">
            <th colspan="3">
            <label class="nav__btn" for="menu-cb">
            <a href="profile"> <img src="LoadImg?usernickname=${sessionScope.login.nickname }" 
            style="width: 150px; height: 150px; border-radius: 75px; box-shadow: 0px 8px 15px rgba(238, 238, 238, 1);"></a>
            <div style="width: 150px; text-align: center;">${sessionScope.login.nickname } 님</div> 
            </label>
            </th>
         </tr>
            <input name="userid" type="hidden" value="${sessionScope.login.userid }">
            <tr class="margin">
               <th>아이디</th>
               <th>${sessionScope.login.userid }</th>
            </tr>
            <tr class="margin">
               <th>비밀번호</th>
               <th><input id="userpw" type="password" name="userpw" onblur="pwcheck()" required></th>
            </tr>

            <tr class="margin">
               <th>비밀번호 확인</th>
               <th><input id="cfpw" type="password" name="confirm"
                  onblur="cfcheck()" required></th>
            </tr>
            <tr class="margin">
               <th colspan="2">
                  <div id="cfResult"></div>
               </th>
            </tr>
            <tr class="margin">
               <th>이름</th>
               <th>${sessionScope.login.name }</th>
            </tr>
            <tr class="margin">
               <th>생년월일</th>
               <th>${sessionScope.login.birth }</th>
            </tr>
            <tr class="margin">
               <th>전화번호</th>
               <th><input name="phone" value="${sessionScope.login.phone }"
                  required></th>
            </tr>
            <tr>
               <th>E-mail</th>
               <th>${sessionScope.login.email }</th>
            </tr>
            <tr>
               <th>닉네임</th>
               <th>${sessionScope.login.nickname }</th>
            </tr>
            <tr>
               <th>address</th>
               <th><input type="text" name="address"
                  value="${sessionScope.login.address }"></th>
            </tr>
      </table>
      </form>
      </fieldset>
      <div style="margin-top: 7px;" align="center">
         <div style="display:inline;">
         <input class="btn2"  id="join" type="button" value="변경하기"> 
         <a href="delmember"><input  class="btn2" type="button" value="탈퇴하기"></a>
         <input class="btn2" type="button" value="메인으로" onclick="location.replace('${pageContext.request.contextPath}')">
      </div></div>
   </div>
   <script type="text/javascript" language="javascript">

      function pwcheck() {
         var str = document.getElementById('userpw').value;
         if (str == "") {
            $('#pwResult').text("비밀번호를 입력해주세요");
            $('#pwResult').css('color', 'red');
         } else
            $('#pwResult').text("");
      }

      function cfcheck() {
         var str = document.getElementById('cfpw').value;
         var str2 = document.getElementById('userpw').value;
         if (str == "") {
            $('#cfResult').text("비밀번호를 입력해주세요");
            $('#cfResult').css('color', 'red');
         } else if (str != str2) {
            $('#cfResult').text("비밀번호가 일치하지 않습니다");
            $('#cfResult').css('color', 'red');
         } else
            $('#cfResult').text("");
      }

      $('#join').on('click', function() {
         pwcheck();
         cfcheck();
         //          nickcheck();

         var pw = $('#pwResult').text();
         var confirm = $('#cfResult').text();
         //          var nick = $('#nick_check').text();
         if (pw == "" && confirm == "") {
            document.changeform.submit();
         }
      });
   </script>
</body>
</html>