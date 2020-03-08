<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link href='resources/css/home2-2.css'
	rel='stylesheet' type='text/css'>
<body>
<nav class="nav" style="margin-top: 30px; margin-right: 20px;">
		<input type="checkbox" class="nav__cb" id="menu-cb" />
		<div class="nav__content">
			<ul class="nav__items">
				<li class="nav__item"><span class="nav__item-text"> <a
						href="${pageContext.request.contextPath }/logout">로그아웃</a>
				</span></li>
				<li class="nav__item"><span class="nav__item-text"> <a
						href="${pageContext.request.contextPath }/info">내정보</a>
				</span></li>
				<li class="nav__item" style="width: 100px;"><span
					class="nav__item-text"> <a
						href="${pageContext.request.contextPath }/design">내블로그 편집</a>
				</span></li>
				<li class="nav__item"><span class="nav__item-text"> <a
						href="${pageContext.request.contextPath }">메인으로</a>
				</span></li>
			</ul>
		</div>
		<label class="nav__btn" for="menu-cb"> <img
			src="LoadImg?usernickname=${sessionScope.login.nickname }"
			style="width: 50px; border-radius: 25px; box-shadow: 0px 8px 15px rgba(238, 238, 238, 1); height: 50px;">
			<br> <span>${sessionScope.login.nickname }님</span>
		</label>
	</nav>
</body>
</html>