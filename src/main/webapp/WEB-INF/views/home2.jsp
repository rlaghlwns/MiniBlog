<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>MINI BLOG</title>

</head>

<link
	href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css"
	rel="stylesheet">
<link href='https://fonts.googleapis.com/css?family=Anton'
	rel='stylesheet' type='text/css'>
<link href='https://fonts.googleapis.com/css?family=Neucha'
	rel='stylesheet' type='text/css'>
<script src="http://code.jquery.com/jquery-1.11.2.min.js"></script>
<script src="http://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/home2.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/home2-2.css">
<script type="text/javascript" src="resources/js/board-page.js"></script>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<body style="padding-top: 150px;">
	<div id="logo-div">
		<%@include file="logo.jsp"%>
	</div>
	<%@include file="my.jsp"%>
	<%@include file="menu.jsp"%>


	<div class="centerbody">
		<c:if
			test="${param.menu ne 'qna'&&param.menu ne 'qnawrite' &&param.menu ne 'view'}">
			<p class="ppap">블로그 추천</p>
			<section style="height: 400px;">
				<div class="slide" style="margin-top: 20px;">
					<ul>
						<li>
							<div
								style="width: 90%; height: 90%; margin-top: 2%; margin-left: 5%; text-align: center;">
								<div class="idiv" style="float: left;">
									<a href="blog?nickname=${list[0].nickname }"> <img
										id="LoadImg" src="LoadImg?usernickname=${list[0].nickname}"><br>
										<p class="ip">${list[0].blogname }</p>
									</a>
								</div>
								<div class="idiv">
									<a href="blog?nickname=${list[1].nickname }"> <img
										id="LoadImg" src="LoadImg?usernickname=${list[1].nickname}"><br>
										<p class="ip">${list[1].blogname }</p>
									</a>
								</div>
								<div class="idiv" style="float: right;">
									<a href="blog?nickname=${list[2].nickname }"> <img
										id="LoadImg" src="LoadImg?usernickname=${list[2].nickname}"><br>
										<p class="ip">${list[2].blogname }</p>
									</a>
								</div>
							</div>
						</li>



						<li>
							<div
								style="width: 90%; height: 90%; margin-top: 2%; margin-left: 5%; text-align: center;">
								<div class="idiv" style="float: left;">
									<a href="blog?nickname=${list[3].nickname }"> <img
										id="LoadImg" src="LoadImg?usernickname=${list[3].nickname}"><br>
										<p class="ip">${list[3].blogname }</p>
									</a>
								</div>
								<div class="idiv">
									<a href="blog?nickname=${list[4].nickname }"> <img
										id="LoadImg" src="LoadImg?usernickname=${list[4].nickname}"><br>
										<p class="ip">${list[4].blogname }</p>
									</a>
								</div>
								<div class="idiv" style="float: right;">
									<a href="blog?nickname=${list[5].nickname }"> <img
										id="LoadImg" src="LoadImg?usernickname=${list[5].nickname}"><br>
										<p class="ip">${list[5].blogname }</p>
									</a>
								</div>
							</div>
						</li>



						<li>
							<div
								style="width: 90%; height: 90%; margin-top: 2%; margin-left: 5%; text-align: center;">
								<div class="idiv" style="float: left;">
									<a href="blog?nickname=${list[6].nickname }"> <img
										id="LoadImg" src="LoadImg?usernickname=${list[6].nickname}"><br>
										<p class="ip">${list[6].blogname }</p>
									</a>
								</div>
								<div class="idiv">
									<a href="blog?nickname=${list[7].nickname }"> <img
										id="LoadImg" src="LoadImg?usernickname=${list[7].nickname}"><br>
										<p class="ip">${list[7].blogname }</p>
									</a>
								</div>
								<div class="idiv" style="float: right;">
									<a href="blog?nickname=${list[8].nickname }"> <img
										id="LoadImg" src="LoadImg?usernickname=${list[8].nickname}"><br>
										<p class="ip">${list[8].blogname }</p>
									</a>
								</div>
							</div>
						</li>

					</ul>
				</div>
			</section>
		</c:if>

		<script type="text/javascript" src="resources/js/logo.js"></script>
		<c:if test="${empty param.menu }">
			<footer>
				<%@include file="ad.jsp"%>
				<div class="news">
					<p>news</p>

					<li style="margin-left: 7%;"><a
						href="http://news.zum.com/photo/14790116/58026527?cm=pn_article_view&cm=front_hotissue&r=1&thumb=1"
						class="item d_photonewslink" data-pos="front_hotissue"
						data-id="58026527" data-index="1" data-kn="2" data-ol="I"
						target="_blank"><div class="thumb">
								<img
									src="http://static.news.zumst.com/images/upload/2020/02/11/08/a0665d38e58d4ed3ba74a398daea7a39.jpg"
									alt="" width="180" height="120"><span class="bd"></span><span
									class="icon_topic icon_photo"></span>
							</div> <span class="text">트와이스 쯔위 <br>'이기적인 아름다움 뽐내며'
						</span></a></li>
					<li><a
						href="http://hub.zum.com/pikleco/56401?cm=front_hotissue&r=1&thumb=1"
						class="item d_photonewslink" data-pos="front_hotissue"
						data-id="47364691" data-index="1" data-kn="-1" data-ol="I"><div
								class="thumb">
								<img
									src="http://static.news.zumst.com/images/upload/2020/02/11/08/1d6f3af7441d445cb997f7de32e4f901.jpg"
									alt="" width="180" height="120"><span class="bd"></span>
							</div> <span class="text">서장훈 건물에 들어온<br>세입자들은 절대 안 나간다
						</span></a></li>

					<li><a
						href="http://news.zum.com/photo/1491749/58032042?cm=pn_article_view&cm=front_hotissue&r=2&thumb=1"
						class="item d_photonewslink" data-pos="front_hotissue"
						data-id="58032042" data-index="2" data-kn="2" data-ol="I"
						target="_blank"><div class="thumb">
								<img
									src="http://static.news.zumst.com/images/upload/2020/02/11/08/1c21387e3354449985729a76de6345c9.jpg"
									alt="" width="180" height="120"><span class="bd"></span><span
									class="icon_topic icon_photo"></span>
							</div> <span class="text">남보라, 단발 후 여신 <br>비주얼…소멸 직전 얼굴
						</span></a></li>
					<li style="margin-left: 7%;"><a
						href="http://news.zum.com/photo/39547648/58030413?cm=pn_article_view&cm=front_hotissue&r=1&thumb=1"
						class="item d_photonewslink" data-pos="front_hotissue"
						data-id="58030413" data-index="1" data-kn="2" data-ol="I"
						target="_blank"><div class="thumb">
								<img
									src="http://static.news.zumst.com/images/upload/2020/02/11/08/dab0068bc640419bb30021f8e6ef4305.jpg"
									alt="" width="180" height="120"><span class="bd"></span><span
									class="icon_topic icon_photo"></span>
							</div> <span class="text">크리스 에반스 "봉준호 영화 <br>출연 안 한다면
								어리석죠"
						</span></a></li>
					<li><a
						href="http://news.zum.com/photo/15816740/58031666?cm=pn_article_view&cm=front_hotissue&r=4&thumb=1"
						class="item d_photonewslink" data-pos="front_hotissue"
						data-id="58031666" data-index="4" data-kn="2" data-ol="I"
						target="_blank"><div class="thumb">
								<img
									src="http://static.news.zumst.com/images/upload/2020/02/11/07/57537531a1ad49ca9a0b9b60640f9fb7.jpg"
									alt="" width="136" height="100"><span class="bd"></span><span
									class="icon_topic icon_photo"></span>
							</div> <span class="text">'환상의 롱다리 치어' <br>인천 전자랜드 김나영
						</span></a></li>

					<li><a
						href="http://hub.zum.com/smartincome/56341?cm=front_hotissue&r=4&thumb=1"
						class="item d_photonewslink" data-pos="front_hotissue"
						data-id="47364515" data-index="4" data-kn="-1" data-ol="I"><div
								class="thumb">
								<img
									src="http://static.news.zumst.com/images/upload/2020/02/11/08/87d380cb6c654a39a2be6dbaa79eebd6.jpg"
									alt="" width="136" height="100"><span class="bd"></span>
							</div> <span class="text">세계 최초 2층 케이블카 <br>무서워서 구경할 수 있겠어?
						</span></a></li>
			</footer>
		</c:if>
		<c:if test="${param.menu eq 'board' }">
			<footer>
				<%@include file="ad.jsp"%>
				<div class="news">
					<p>블로그 게시판</p>
					<div id="right-div" style="margin-left: 23px;">
						<select id="cntPerPage" name="sel"
							onchange="selChangeMain('${paging.nowPage }')">
							<option value="5"
								<c:if test="${paging.cntPerPage == 5}">selected</c:if>>5줄
								보기</option>
							<option value="10"
								<c:if test="${paging.cntPerPage == 10}">selected</c:if>>10줄
								보기</option>
							<option value="15"
								<c:if test="${paging.cntPerPage == 15}">selected</c:if>>15줄
								보기</option>
							<option value="20"
								<c:if test="${paging.cntPerPage == 20}">selected</c:if>>20줄
								보기</option>
						</select>
					</div>
					<!-- boardList -->
					<table>
						<tr>
							<th>블로그이름</th>
							<th class="nick">닉네임</th>
						</tr>
						<c:forEach items="${viewAll }" var="list">
							<tr>
								<td style="text-align: left;"><a
									href="blog?nickname=${list.nickname }"
									style="margin-left: 40px;">${list.blogname }</a></td>
								<td>${list.nickname }</td>
							</tr>
						</c:forEach>
					</table>
					<!-- page button -->
					<div id="pagebutton">
						<c:if test="${paging.startPage != 1 }">
							<a
								href="${ctx }?menu=board&nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">&lt;</a>
						</c:if>
						<c:forEach begin="${paging.startPage }" end="${paging.endPage }"
							var="p">
							<c:choose>
								<c:when test="${p == paging.nowPage }">
									<a class="active">${p }</a>
								</c:when>
								<c:when test="${p != paging.nowPage }">
									<a
										href="${ctx }?menu=board&nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a>
								</c:when>
							</c:choose>
						</c:forEach>
						<c:if test="${paging.endPage != paging.lastPage}">
							<a
								href="${ctx }?menu=board&nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">&gt;</a>
						</c:if>
					</div>
				</div>
			</footer>
		</c:if>




		<c:if test="${param.menu eq 'qna' }">
			<footer
				style="min-height: 500px; max-height: 100%; margin-top: 100px;">
				<div class="news" style="min-height: 500px; width: 100%">
					<p>QnA</p>
					<div id="boardmain">
						<table>
							<tr>
								<th>No.</th>
								<th width="50%">제목</th>
								<th>작성자</th>
								<th>등록일</th>
							</tr>
							<c:forEach items="${viewAll }" var="list">
								<tr>
									<td>${list.qnum }</td>
									<td style="text-align: left;"><a
										href="${ctx }?menu=view&qnum=${list.qnum }"
										style="margin-left: 15px;">${list.qtitle }</a></td>
									<td>${list.qwriter }</td>
									<td>${list.qdate }</td>
								</tr>
							</c:forEach>
						</table>

						<div id="right-div" style="width: 95%; margin-left: 20px;">
							<a href="${ctx }?menu=qnawrite" style="float: right;"><button
									class="btn">질문하기</button></a><br>
						</div>

						<div id="pagebutton">
							<c:if test="${paging.startPage != 1 }">
								<a
									href="${ctx }?menu=board&nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">&lt;</a>
							</c:if>
							<c:forEach begin="${paging.startPage }" end="${paging.endPage }"
								var="p">
								<c:choose>
									<c:when test="${p == paging.nowPage }">
										<b>${p }</b>
									</c:when>
									<c:when test="${p != paging.nowPage }">
										<a
											href="${ctx }?menu=board&nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a>
									</c:when>
								</c:choose>
							</c:forEach>
							<c:if test="${paging.endPage != paging.lastPage}">
								<a
									href="${ctx }?menu=board&nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">&gt;</a>
							</c:if>
						</div>
					</div>
				</div>
			</footer>
		</c:if>

		<c:if test="${param.menu eq 'qnawrite' }">
			<footer
				style="min-height: 500px; max-height: 100%; margin-top: 100px;">
				<div class="news"
					style="min-height: 500px; width: 100%; max-height: 1000px;">
					<p>QnA</p>
					<form method="post" action="newQNA">
						<table border="1">
							<tr>
								<th>제목</th>
								<td><input type="text" name="qtitle" required="required"></td>
								<th>작성자</th>
								<td>${sessionScope.login.nickname }</td>
							</tr>
							<tr>
								<td colspan="4"><textarea style="width: 100%; resize: none"
										name="qcontent" id="qcontent" rows="10" cols="100"></textarea></td>
							</tr>
						</table><p style="width: 95%;margin-left: 20px;">
						<input type="hidden" name="qwriter"
							value="${sessionScope.login.nickname }"> <input
							style="float: right;" class="btn"
							type="submit" value="작성완료"></p>
					</form>
				</div>
			</footer>
		</c:if>



		<script type="text/javascript" src="resources/js/reply-func.js"></script>
		<c:if test="${param.menu eq 'view' }">
			<footer
				style="min-height: 500px; max-height: 100%; margin-top: 100px;">
				<div class="news"
					style="min-height: 500px; width: 100%; max-height: 1000px;">
					<p>QnA</p>
					<form style="display: inline;" method="post" action="qnaupdate">
						<table border="1" id="qnaupdateForm">
							<tr>
								<th>${qnavo.qnum }</th>
								<th>${qnavo.qtitle }</th>
								<th>${qnavo.qwriter }</th>
								<th>${qnavo.qdate }</th>
							</tr>
							<tr style="height: 270px;">
								<td colspan="4" style="text-align: left; vertical-align: top;">${qnavo.qcontent }</td>
							</tr>
						</table>
						<input type="hidden" name="qnum" value="${qnavo.qnum }">
						<div align="center">
							<c:if
								test="${sessionScope.login.nickname eq qnavo.qwriter||sessionScope.login.nickname eq '관리자' }">
								<input class="btn" id="a" type="button" value="수정"
									onclick="QNAupdateForm('qnaupdateForm','${qnavo.qwriter}',
								'${qnavo.qcontent }','qcontent','${qnavo.qtitle }')">
							</c:if>
					</form>
					<c:if
						test="${sessionScope.login.nickname eq qnavo.qwriter ||sessionScope.login.nickname eq '관리자'}">
						<a href="qnadelete?qnum=${qnavo.qnum }"><button id="c"
								class="btn">삭제</button></a>
					</c:if>
					<a id="b" style="height: 50px;" class="btn"
						href="${ctx }/?menu=qna">목록</a>
					<p>

						<!-- 관리자만 답글 폼 생성(합칠 때 주석 풀기!) -->
						<c:if test="${sessionScope.login.userid eq 'admin'}">
							<c:if test="${qnavo.qreply eq '0' || qnavo.replydeleted eq '1'}">
								<form method="post" action="qnaresult">
									<table border="1">
										<tr>
											<td colspan="2"><textarea id="rcontext" name="qreply"
													placeholder="댓글 쓰는 곳" rows="5" style="width: 100%; resize: none;"></textarea> <input
												type="hidden" name="qwriter" value="${login.userid }">
												<input type="hidden" name="qnum" value="${qnavo.qnum }">

											</td>
										</tr>
										<tr>
											<td colspan="2" align="right"><input type="submit"
												class="btn" value="등록"></td>
										</tr>
									</table>
								</form>
							</c:if>
						</c:if>
					<p>

						<!-- 답글 보여지는 폼 -->

						<c:if test="${ qnavo.qreply ne '0' && qnavo.replydeleted eq '0'}">

							<form method="post" action="qnaresult">
								<input type="hidden" name="qnaupdate" value="qnaupdate">
								<input type="hidden" name="qnum" id="qnum"
									value="${qnavo.qnum }"> <input type="hidden"
									name="qdate" value="${qnavo.qdate }"> <input
									type="hidden" name="qwriter" value="${qnavo.qwriter }">
								<input type="hidden" name="qtitle" value="${qnavo.qtitle }">
								<table style="border: 1px solid;" id="qnareplyForm">
									<tr style="height: 70px;">
										<td colspan="2">${qnavo.qreply }<br> <font
											color="gray">${qnavo.qdate }</font>&nbsp;<br>&nbsp;<br>
											<c:if test="${sessionScope.login.userid eq 'admin'}">
												<input class="btn" type="button" value="수정"
													onclick="updateForm('qnareplyForm','${sessionScope.login.nickname }','${qnavo.qreply }', 'qreply', 'null')">
												<%-- 																						<a href="qnadelete?qnum=${qnavo.qnum }"><button --%>
												<!-- 																								type="button">삭제</button></a></td> -->
											</c:if>
									</tr>
								</table>
							</form>
							<br>

						</c:if>
				</div>
			</footer>
		</c:if>
		<script type="text/javascript">
			$(function() {
				$("#qnaForm").on("submit", function(event) {
					var content = document.querySelector("#qcontent").value;
					if (content === "") {
						alert("내용을 입력하세요.");
						event.preventDefault();
					} else {
						var request = new XMLHttpRequest();
						request.open("POST", "/qnaresult");
						request.send();
					}
				})
			});
		</script>
	</div>
</body>

</html>
