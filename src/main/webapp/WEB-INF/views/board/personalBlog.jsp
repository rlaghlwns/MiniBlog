<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<script src="resources/ckeditor/ckeditor.js"></script>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.9.0.min.js"></script>
<head>
<meta charset="UTF-8">
<title>${blog.nickname }님의블로그</title>
<script type="text/javascript">
	function addbtn() {
		var tmp = "<c:out value='${nick }'/>";
		$.ajax({
			url : "add",
			data : {
				nickname : tmp
			},
			success : function(data) {
				if (data == "success") {
					alert("이웃신청을 했습니다.");
				} else if (data == "fail") {
					alert("이미 이웃입니다.");
				} else if (data == "notid") {
					alert("로그인하세요")
				}
			}
		});
	}
	function okbtn() {
		var myid = "<c:out value='${nick }'/>";
		var friend = $("#friend").val();
		var ok = confirm("수락하시겠습니까?");
		if (ok == true) {
			$.ajax({
				url : "sure",
				data : {
					nickname : myid,
					friend : friend
				},
				success : function(data) {
					if (data == "success") {
						alert("수락하였습니다.");
						var url = "blog?nickname=" + myid;
						location.href = url;
					} else
						alert("실패")
				}
			});
		} else if (ok == false) {
	         $.ajax({
	             url : "refusal",
	             data : {
	                mynick : myid,
	                friend : friend
	             },
	             success : function(data) {
	                if (data == "success") {
	                   alert("거절하였습니다.");
	                   var url = "blog?nickname=" + myid;
	                   location.href = url;
	                } else
	                   alert("실패")
	             }
	          });
	       }

	}
	function change_menu1(frm) {
		switch (frm) {
		case "1":
			document.all('layer1').style.visibility = "visible";
			document.all('layer2').style.visibility = "hidden";
			break;
		case "2":
			document.all('layer2').style.visibility = "visible";
			document.all('layer1').style.visibility = "hidden";
			break;
		}
	}
</script>
</head>
<script src="http://code.jquery.com/jquery-1.11.2.min.js"></script>
<script src="http://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<script type="text/javascript" src="resources/js/board-page.js"></script>
<script type="text/javascript" src="resources/js/reply-func.js"></script>
<link rel="stylesheet" type="text/css" href="resources/css/webfont.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/${design.layout }.css">
<div
	style="font-size: large; margin-left: 45px; padding-top: 14px; position: fixed; top: 0;">내
	블로그</div>
<body class="personalBlog">
	<div class="title"
		style="background:linear-gradient(to top,white,${design.show1box});color:${design.show1font};font-family:${design.show1style};font-size:${design.show1size}px;text-align:${design.show1align};">
		${blog.blogname }</div>
	<%@include file="my.jsp"%>
	<%@include file="../littleLogo.jsp"%>

	<div class="menu">
		<div class="board"
			style="background:linear-gradient(to top,white,${design.show2box});font-family:${design.show2style};font-size:${design.show2size}px;text-align:${design.show2align};">
			<p style="font-size: 20px;">

				<c:if test="${param.write eq null }">
					<!-- 게시글 내용 -->
					<div class="in" align="center">
						<c:if test="${param.bnum ne null }">
							<table class="boardtable">
								<tr>
									<th style="width: 20%; padding-right: 5px;">글번호</th>
									<th style="width: 60%;">제목</th>
									<th style="width: 20%;">작성자</th>
								</tr>
								<tr>
									<td style="width: 20%; padding: 5px;">${vo.bnum }</td>
									<td style="width: 60%;">${vo.title }</td>
									<td style="width: 20%;">${vo.writer }</td>
								</tr>
								<tr>
									<td style="text-align: left;" colspan="3"><div
											id="vocontext">${vo.context }</div></td>
								</tr>
							</table>
							<c:if test="${sessionScope.login.nickname eq vo.writer }">
								<a
									href="blog?write=update&nickname=${blog.nickname }&bnum=${vo.bnum }"><button>수정</button></a>
							</c:if>
							<c:if
								test="${sessionScope.login.nickname eq vo.writer || sessionScope.login.nickname eq blog.nickname }">
								<a
									href="boarddelete?bnum=${vo.bnum }&writer=writer&visit=${blog.nickname }"><button>삭제</button></a>
							</c:if>

						</c:if>
					</div>


					<!-- reply form -->
					<c:if test="${param.bnum ne null }">
						<div align="center">
							<form action="reply">
								<table class="boardtable">
									<tr>
										<!-- 수정필요 수정 필요 -->
										<th style="text-align: left;">
											<div style="display: inline-block;">
												<img class="img" width="30px;"
													src="LoadImg?usernickname=${sessionScope.login.nickname }">
											</div>&nbsp;
											<div style="display: inline-block;" class="writerinfo">
												<strong>${sessionScope.login.nickname }</strong>&nbsp; <font
													color="gray">${rereply.rrdate }</font>
											</div>
										</th>
									</tr>
									<tr>
										<td colspan="2"><textarea id="rcontext" name="rcontext"
												placeholder="댓글 쓰는 곳" rows="5"></textarea> <input
											type="hidden" name="visit" value="${blog.nickname }">
											<input type="hidden" name="rwriter"
											value="${sessionScope.login.nickname }"> <input
											type="hidden" name="bnum" value="${vo.bnum }"></td>
									</tr>
									<tr>
										<td id="replysubmit" colspan="2" align="right"><input
											class="inputbtn" type="submit" value="등록"></td>
									</tr>
								</table>
							</form>
						</div>
					</c:if>


					<!-- reply -->
					<c:if test="${!empty reply }">
						<c:forEach var="rvo" items="${reply }" varStatus="st">
							<c:if test="${rvo.bnum eq vo.bnum }">
								<form method="post" action="rupdate">
									<input type="hidden" name="visit" value="${blog.nickname }">
									<input type="hidden" name="rnum" value="${rvo.rnum }">
									<input type="hidden" name="bnum" value="${rvo.bnum }">
									<input type="hidden" name="rrcm" value="${rvo.rrcm }">
									<input type="hidden" name="rdate" value="${rvo.rdate }">
									<input type="hidden" name="rwriter" value="${rvo.rwriter }">
									<table class="replytable" id="updateForm${st.count }">
										<tr>
											<td class="replytableTd">
												<div>
													<img class="img" width="30px;"
														src="LoadImg?usernickname=${rvo.rwriter }">
												</div>&nbsp;
												<div class="writerinfo">
													<strong>${rvo.rwriter }</strong>&nbsp; <font color="gray">${rvo.rdate }</font>
												</div>
											</td>
										</tr>
										<tr>
											<td colspan="2">${rvo.rcontext }</td>
										</tr>
										<tr>
											<td colspan="2">
												<div class="btndiv1">
													<c:if test="${sessionScope.login.nickname eq rvo.rwriter }">
														<input type="button" value="수정"
															onclick="updateForm('updateForm${st.count }','${rvo.rwriter }','${rvo.rcontext }', 'rcontext')">
													</c:if>
													<input type="button" value="댓글"
														onclick="updateForm('replyForm${st.count }', '${login.nickname }', 'null', 'rrcontext')">
													<c:if
														test="${sessionScope.login.nickname eq rvo.rwriter || sessionScope.login.nickname eq blog.nickname  }">
														<a
															href="rdelete?rnum=${rvo.rnum }&bnum=${rvo.bnum }&visit=${blog.nickname }">
															삭제 </a>
													</c:if>
												</div>
											</td>
										</tr>
									</table>
								</form>

								<!-- rereply form -->
								<form method="post" action="rereply">
									<input type="hidden" name="visit" value="${blog.nickname }">
									<input type="hidden" name="rrwriter"
										value="${sessionScope.login.nickname }"> <input
										type="hidden" name="rnum" value="${rvo.rnum }"> <input
										type="hidden" name="bnum" value="${rvo.bnum }">
									<table class="boardtable" id="replyForm${st.count }"></table>
								</form>


								<!-- rereply -->
								<div id="rereplydiv">
									<c:forEach var="rereply" items="${rereplyarr }" varStatus="rst">
										<c:if test="${rvo.rnum eq rereply.rnum }">
											<form method="post" action="rrupdate">
												<input type="hidden" name="visit" value="${blog.nickname }">
												<input type="hidden" name="rnum" value="${rereply.rnum }">
												<input type="hidden" name="rrnum" value="${rereply.rrnum }">
												<input type="hidden" name="bnum" value="${rereply.bnum }">
												<input type="hidden" name="rrrcm" value="${rereply.rrrcm }">
												<input type="hidden" name="rrdate"
													value="${rereply.rrdate }"> <input type="hidden"
													name="rrwriter" value="${rereply.rrwriter }">
												<table class="rereplytable"
													id="rrupdateForm${rereply.rrnum }">
													<tr>
														<td class="replytableTd">
															<div>
																<img class="img" width="30px;"
																	src="LoadImg?usernickname=${rereply.rrwriter }">
															</div>&nbsp;
															<div class="writerinfo">
																<strong>${rereply.rrwriter }</strong>&nbsp; <font
																	color="gray">${rereply.rrdate }</font>
															</div>
														</td>
													</tr>
													<tr>
														<td colspan="2">${rereply.rrcontext }</td>
													</tr>

													<tr>
														<td colspan="2">
															<div class="btndiv2">
																<c:if
																	test="${sessionScope.login.nickname eq rereply.rrwriter }">
																	<input type="button" value="수정"
																		onclick="updateForm('rrupdateForm${rereply.rrnum }','${rereply.rrwriter }','${rereply.rrcontext }','rrcontext')">
																</c:if>
																<c:if
																	test="${sessionScope.login.nickname eq rereply.rrwriter || sessionScope.login.nickname eq blog.nickname  }">
																	<a
																		href="rrdelete?rrnum=${rereply.rrnum }&bnum=${rereply.bnum }&visit=${blog.nickname }">
																		삭제 </a>
																</c:if>
															</div>
														</td>
													</tr>
												</table>
											</form>

										</c:if>
									</c:forEach>
								</div>

								<br>
							</c:if>
						</c:forEach>

					</c:if>


         &nbsp;<br>
					<br>
					<br>
					<!-- paging -->
					<div>
						<!-- countPerPage -->
						<div id="right-div">
							<c:if test="${empty vo }">
								<select id="cntPerPage" name="sel"
									style="width: 100px; background-color: black; font-weight: bolder; color: white; height: 30px;"
									onchange="selChange2('${paging.nowPage }', '${blog.nickname }')">
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
							</c:if>
							<c:if test="${vo ne null }">
								<select id="cntPerPage" name="sel"
									onchange="selChange('${paging.nowPage }', '${blog.nickname }', '${vo.bnum }')">
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
							</c:if>
						</div>

						<div align="center">
							<table class="boardtable">
								<tr>
									<th>No</th>
									<th>제목</th>
									<th>작성자</th>
									<th>작성 날짜</th>
								</tr>
								<c:forEach var="list" items="${viewAll }">
									<tr>
										<td>${list.bnum }</td>
										<td><a
											href="blog?nickname=${blog.nickname }&bnum=${list.bnum }">${list.title }</a></td>
										<td>${list.writer }</td>
										<td>${list.boarddate }</td>
									</tr>
								</c:forEach>
							</table>
						</div>

						<!-- page button -->
						<div id="pagebutton">
							<c:if test="${paging.startPage != 1 }">
								<c:if test="${vo ne null }">
									<a
										href="blog?nickname=${blog.nickname }&bnum=${vo.bnum }&nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">&lt;</a>
								</c:if>
								<c:if test="${empty vo }">
									<a
										href="blog?nickname=${blog.nickname }&nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">&lt;</a>
								</c:if>
							</c:if>
							<c:forEach begin="${paging.startPage }" end="${paging.endPage }"
								var="p">
								<c:choose>
									<c:when test="${p == paging.nowPage }">
										<b>${p }</b>
									</c:when>
									<c:when test="${p != paging.nowPage }">
										<c:if test="${vo ne null }">
											<a
												href="blog?nickname=${blog.nickname }&bnum=${vo.bnum }&nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a>
										</c:if>
										<c:if test="${empty vo }">
											<a
												href="blog?nickname=${blog.nickname }&nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a>
										</c:if>
									</c:when>
								</c:choose>
							</c:forEach>
							<c:if test="${paging.endPage != paging.lastPage}">
								<c:if test="${vo ne null }">
									<a
										href="blog?nickname=${blog.nickname }&bnum=${vo.bnum }&nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">&gt;</a>
								</c:if>
								<c:if test="${empty vo }">
									<a
										href="blog?nickname=${blog.nickname }&nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">&gt;</a>
								</c:if>
							</c:if>
						</div>
						<c:if test="${sessionScope.login.nickname eq blog.nickname }">
							<a style="margin-left: 564px;"
								href="blog?nickname=${blog.nickname }&visit=${blog.userid }&write=board"><button>새
									글 쓰기</button></a>
						</c:if>
					</div>
				</c:if>
				<c:if test="${param.write eq 'board' }">
					<form method="post" action="newBoard">
						<table style="margin-top: 20px; width: 100%">
							<tr>
								<%-- <td><input class="text" style="background-color: ${design.show1box}" type="text" name="title" size="20""
                         placeholder="제목" required="required"></td> --%>
								<td style="background-color: black; height: 40px;"><input
									class="text" type="text" name="title" size="20"
									placeholder="제목" required="required"></td>
								<th style="background-color: black; color: white;">작성자</th>
								<td
									style="background-color: black; color: white; text-align: center;">${sessionScope.login.nickname }</td>
							</tr>
							<tr>
								<td colspan="4"><textarea name="context" id="context"
										rows="10" cols="100"></textarea></td>
							</tr>
						</table>
						<input type="hidden" name="visit" value="${blog.nickname }">
						<input type="hidden" name="writer"
							value="${sessionScope.login.nickname }"> <input
							class="inputbtn" style="margin-left: 564px;" type="submit"
							value="작성완료">
					</form>
				</c:if>

				<c:if test="${param.write eq 'update' }">
					<form method="post" action="boardupdate">
						<table style="margin-top: 20px; width: 100%">
							<tr>
								<td style="background-color: black; height: 40px;"><input
									class="text" type="text" name="title" size="20"
									placeholder="${vo.title }" value="${vo.title }"></td>
								<th style="background-color: black; color: white;">작성자</th>
								<td style="background-color: black; color: white;">${vo.writer }</td>
							</tr>
							<tr>
								<td colspan="4"><textarea name="context" id="context"
										rows="10" cols="100">${vo.context }</textarea></td>
							</tr>
						</table>

						<input type="hidden" name="visit" value="${blog.nickname }">
						<input type="hidden" name="writer" value="${vo.writer }">
						<input type="hidden" name="bnum" value="${vo.bnum }"> <input
							style="margin-left: 564px;" class="inputbtn" type="submit"
							value="작성완료">
					</form>

				</c:if>
		</div>

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
		<div class="list"
			style="background:linear-gradient(to top,white,${design.show3box});font-family:${design.show3style};font-size:${design.show3size}px;text-align:${design.show3align};">
			<c:if test="${login.nickname ne nick }">
				<c:if test="${check ne 1 }">
					<input class="friendbtn" type="button" value="이웃추가 +" id="add"
						onclick="addbtn()">
				</c:if>
			</c:if>
			<!-- 친구 추가 -->
			<div>
				<form name="friend">
					<select name="joinfriend" size="1"
						onchange='change_menu1(this.value)'
						style="width: 100%; background-color: black; font-weight: bolder; color: white; height: 40px;">
						<option selected value="1">이웃신청목록</option>
						<option selected value="2">내 이웃보기</option>
					</select>

					<div id="layer1" style="position: absolute; visibility: hidden;">
						<table>
							<c:if test="${login.nickname eq nick }">
								<!-- 내 블로그 이여야 이웃신청 목록 볼 수 있음 -->
								<c:forEach var="list" items="${joinfriend }">
									<tr>
										<td><input type="hidden" id="friend"
											value="${list.friend }"> <img
											style="width: 30px; height: 30px; border-radius: 30px; margin-left: 12px;"
											class="img" src="LoadImg?usernickname=${list.friend }">
											<a style="font-size: 18px;"
											href="blog?nickname=${list.friend }">${list.friend }</a></td>
										<td><input class="surebtn" type="button" id="ok"
											name="${list.friend }" value="ok" onclick="okbtn()"></td>
									</tr>
								</c:forEach>
							</c:if>
						</table>
					</div>

					<div id="layer2" style="position: absolute; visivility: hidden;">
						<table>
							<c:forEach var="list" items="${myfriend }">
								<tr style="margin-top: 10px;">
									<td><div style="width: 200px; overflow: hidden;">
											<img
												style="width: 30px; height: 30px; border-radius: 30px; margin-left: 12px;"
												class="img" src="LoadImg?usernickname=${list.friend }">
											<a style="font-size: 18px;"
												href="blog?nickname=${list.friend }">${list.friend }</a>
										</div></td>

								</tr>
							</c:forEach>
						</table>
					</div>
				</form>
			</div>
		</div>
		<c:if
			test="${design.layout eq 'layout2' || design.layout eq 'layout4'}">
			<div class="side"
				style="background:linear-gradient(to top,white,${design.show4box});font-family:${design.show4style};font-size:${design.show4size}px;text-align:${design.show4align};"></div>
		</c:if>
	</div>
	<img alt="" src="">

</body>
</html>