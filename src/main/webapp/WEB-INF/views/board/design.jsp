<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="resources/js/style-div-func.js"></script>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
#div {
	margin: auto;
	width: 900px;
	height: 900px;
}

.div1 {
	width: 850px;
	height: 100px;
	border: 3px solid #868e96;
	border-radius: 5px;
}

.div2 {
	width: 600px;
	height: 600px;
	border: 3px solid #868e96;
	display: inline-block;
	margin-top: 20px;
	position: absolute;
	border-radius: 5px;
}

.div3 {
	width: 210px;
	height: 600px;
	border: 3px solid #868e96;
	display: inline-block;
	margin-left: 640px;
	margin-top: 20px;
	border-radius: 5px;
}

.img {
	width: 90px;
	height: 90px;
	margin-left: 30px;
}

.btn {
	float: right;
	margin-top: 20px;
	margin-right: 20px;
	width: 100px;
	background-color: black;
	border: none;
	color: #fff;
	padding: 15px 0;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 15px;
	cursor: pointer;
}

.btn:hover {
	background-color: #2c2c2c;
}

#show1 {
	background-color: white;
	font-family: '';
	color: '';
	font-size: 1rem;
	line-height: 120px;
}

#show2 {
	background-color: white;
	font-family: '';
	color: '';
	font-size: 1rem;
}

#show3 {
	background-color: white;
	font-family: '';
	color: '';
	font-size: 1rem;
}

#show4 {
	background-color: white;
	font-family: '';
	color: '';
	font-size: 1rem;
	display: inline-block;
}

table tr {
	height: 40px;
}

.menuname {
	text-align: left;
}

.select {
	text-align: right;
	width: 48%
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script src="http://code.jquery.com/jquery-1.11.2.min.js"></script>
<script src="http://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<script type="text/javascript">
	function check(a, b) {
		for (i = 1; i <= 4; i++) {
			if (i == a) {
				document.all.layout.value = b
				var c = "layout" + i
				document.getElementById(c).style.border = "5px solid green";
				var image2 = document.getElementById("div2");
				show(i);
			}
			if (i != a) {
				var c = "layout" + i
				document.getElementById(c).style.border = "";
			}
		}
	}

	function show(i) {
		var a = document.getElementById("show1");
		$('#show1').text("TITLE");
		a.style.border = "2px solid";
		a.style.display = "";
		var b = document.getElementById("show2");
		b.style.marginTop = "10px";
		b.style.marginLeft = "30px";
		b.style.display = "";
		var c = document.getElementById("show3");
		c.style.marginTop = "10px";
		c.style.marginLeft = "20px";
		c.style.display = "";
		var d = document.getElementById("show4");
		d.style.marginTop = "10px";
		d.style.marginLeft = "20px";
		d.style.display = "";
		if (i == 1) {
			var b = document.getElementById("show2");
			b.style.width = "57%";
			b.style.height = "400px";
			b.style.display = "inline-block";
			b.style.border = "2px solid";
			$('#show2').text("post");
			var c = document.getElementById("show3");
			c.style.width = "28%";
			c.style.height = "400px";
			c.style.display = "inline-block";
			c.style.border = "2px solid";
			$('#show3').text("side");
			var d = document.getElementById("show4");
			d.style.display = "none";
		} else if (i == 2) {
			var b = document.getElementById("show2");
			b.style.width = "20%";
			b.style.height = "400px";
			b.style.display = "inline-block";
			b.style.border = "2px solid";
			$('#show2').text("side");
			var c = document.getElementById("show3");
			c.style.width = "45%";
			c.style.height = "400px";
			c.style.display = "inline-block";
			c.style.border = "2px solid";
			c.style.position = "absolute";
			$('#show3').text("post");
			var d = document.getElementById("show4");
			d.style.width = "15%";
			d.style.height = "200px";
			d.style.display = "inline-block";
			d.style.border = "2px solid";
			//          d.style.margin = "10px 20px 200px";
			d.style.marginLeft = "325px";
			$('#show4').text("side2");
		} else if (i == 3) {
			var b = document.getElementById("show2");
			b.style.width = "28%";
			b.style.height = "400px";
			b.style.display = "inline-block";
			b.style.border = "2px solid";
			$('#show2').text("side");
			var c = document.getElementById("show3");
			c.style.width = "57%";
			c.style.height = "400px";
			c.style.display = "inline-block";
			c.style.border = "2px solid";
			$('#show3').text("post");
			var d = document.getElementById("show4");
			d.style.display = "none";
		} else if (i == 4) {
			var b = document.getElementById("show2");
			b.style.width = "20%";
			b.style.height = "400px";
			b.style.display = "inline-block";
			b.style.border = "2px solid";
			$('#show2').text("side");
			var c = document.getElementById("show3");
			c.style.width = "65%";
			c.style.height = "280px";
			c.style.display = "inline-block";
			c.style.border = "2px solid";
			c.style.position = "absolute";
			$('#show3').text("post");
			var d = document.getElementById("show4");
			d.style.width = "65%";
			d.style.height = "100px";
			d.style.border = "2px solid";
			d.style.display = "inline-block";
			d.style.margin = "10px 20px";
			d.style.marginTop = "310px";
			$('#show4').text("under");
		}
	}
</script>
<body>
	<%@include file="my.jsp"%>
	<%@include file="../littleLogo.jsp"%>
	<div
		style="font-size: large; color: whitegray; margin-left: 170px; padding-top: 12px; position: fixed;">블로그
		편집</div>

	<form method="POST">
		<div id="div" style="padding-top: 100px">
			<div class="div1">
				<input type="hidden" name="layout"
					value="${design.layout ne null? design.layout : 'x'}"> <img
					class="img" src="resources/images/layout1.png" name="layout1"
					onclick="check(1,this.name)" id="layout1"> <img class="img"
					src="resources/images/layout2.png" name="layout2"
					onclick="check(2,this.name)" id="layout2"> <img class="img"
					src="resources/images/layout3.png" name="layout3"
					onclick="check(3,this.name)" id="layout3"> <img class="img"
					src="resources/images/layout4.png" name="layout4"
					onclick="check(4,this.name)" id="layout4"> <input class="btn"
					type="submit" value="편집 완료">
			</div>
			<div class="div2" id="div2">

				<div id="show1"
					style="width: 90%; height: 20%; margin-left: 30px; margin-top: 10px;background-color:${design.show1box};color:${design.show1font};font-family:${design.show1style};font-size:${design.show1size}px;text-align:${design.show1align};display:none;"></div>
				<div id="show2"
					style="margin-left: 30px; margin-top: 10px; float: left;background-color:${design.show2box};color:${design.show2font};font-family:${design.show2style};font-size:${design.show2size}px;text-align:${design.show2align};display:none;"></div>
				<div id="show3"
					style="margin-left: 20px; margin-top: 10px;background-color:${design.show3box};color:${design.show3font};font-family:${design.show3style};font-size:${design.show3size}px;text-align:${design.show3align};display:none;"></div>
				<div id="show4"
					style="margin: 10px 20px 10px 325px;background-color:${design.show4box};color:${design.show4font};font-family:${design.show4style};font-size:${design.show4size}px;text-align:${design.show4align};display:none;"></div>

			</div>
			<div class="div3">
				<input type="hidden" id="show1box" name="show1box"
					value="${design.show1box ne null? design.show1box : 'x'}">
				<input type="hidden" id="show2box" name="show2box"
					value="${design.show2box ne null? design.show2box : 'x'}">
				<input type="hidden" id="show3box" name="show3box"
					value="${design.show3box ne null? design.show3box : 'x'}">
				<input type="hidden" id="show4box" name="show4box"
					value="${design.show4box ne null? design.show4box : 'x'}">
				<table>
					<tr>
						<td class="menuname">TITLE 배경색</td>
						<td class="select"><input id="show1b" type="color"
							onchange="backgroundColorChange('show1', 'show1b','show1box')"></td>
					</tr>
					<tr>
						<td class="menuname">POST 배경색</td>
						<td class="select"><input id="show2b" type="color"
							onchange="backgroundColorChange('show2', 'show2b','show2box')"></td>
					</tr>
					<tr>
						<td class="menuname">SIDE 배경색</td>
						<td class="select"><input id="show3b" type="color"
							onchange="backgroundColorChange('show3', 'show3b','show3box')"></td>
					</tr>
					<tr>
						<td class="menuname">SIDE2 배경색</td>
						<td class="select"><input id="show4b" type="color"
							onchange="backgroundColorChange('show4', 'show4b','show4box')"></td>
					</tr>

				</table>
				<hr>
				<input type="hidden" id="show1font" name="show1font"
					value="${design.show1font ne null? design.show1font : 'x'}">
				<input type="hidden" id="show2font" name="show2font"
					value="${design.show2font ne null? design.show2font : 'x'}">
				<input type="hidden" id="show3font" name="show3font"
					value="${design.show3font ne null? design.show3font : 'x'}">
				<input type="hidden" id="show4font" name="show4font"
					value="${design.show4font ne null? design.show4font : 'x'}">


				<table>
					<tr>
						<th colspan="2">TITLE 설정</th>
					</tr>

					<tr>
						<td class="menuname">글자색</td>
						<td class="select"><input id="show1f" type="color"
							onchange="fontColorChange('show1', 'show1f','show1font')"></td>
					</tr>

					<tr>
						<td class="menuname">글자 크기</td>
						<td class="select"><select id="size" style="width: 80%"
							onchange="fontSizeChange('show1', 'size')">
								<option value="10">10</option>
								<option value="12">12</option>
								<option value="14">14</option>
								<option value="16">16</option>
								<option value="18">18</option>
								<option value="20">20</option>
								<option value="24">24</option>
								<option value="36">36</option>
								<option value="48">48</option>
								<option value="60">60</option>
								<option value="72">72</option>
								<option value="84">84</option>
								<option value="96">96</option>
						</select></td>
					</tr>

					<tr>
						<td class="menuname">글꼴</td>
						<td class="select"><select id="font" style="width: 80%"
							onchange="fontStyleChange('show1', 'font')">
								<option
									style="font-family: 'Nanum Gothic', sans-serif; font-size: 1rem;"
									value="Nanum Gothic, sans-serif">Nanum Gothic</option>
								<option
									style="font-family: 'Nanum Myeongjo', serif; font-size: 1rem;"
									value="Nanum Myeongjo, serif">Nanum Myeongjo</option>
								<option
									style="font-family: 'Nanum Pen Script', cursive; font-size: 1rem;"
									value="Nanum Pen Script, cursive">Nanum Pen Script</option>
								<option
									style="font-family: 'Open Sans Condensed', sans-serif; font-size: 1rem;"
									value="Open Sans Condensed, sans-serif">Open Sans
									Condensed</option>
								<option
									style="font-family: 'Roboto', sans-serif; font-size: 1rem;"
									value="Roboto, sans-serif">Roboto</option>
								<option style="font-family: Lobster, cursive; font-size: 1rem;"
									value="Lobster, cursive">Lobster</option>
						</select></td>
					</tr>

					<tr>
						<td class="menuname">정렬</td>
						<td class="select"><select id="align" style="width: 80%"
							onchange="fontAlignChange('show1', 'align')">
								<option value="left">left</option>
								<option value="right">right</option>
								<option value="center">center</option>
								<option value="justify">justify</option>
						</select></td>
					</tr>
				</table>
				<br><hr><br>
				<table>
					<tr>
						<th class="menuname" colspan="2" style="text-align: center;">TITLE 내용을 입력하세요
						</th>
					</tr>
					<tr>
						<th class="menuname" colspan="2">
						<input placeholder="TITLE 내용" name="title" style="width: 199px;">
						</th>
					</tr>
				</table>
				<input type="hidden" id="show1style" name="show1style"
					value="${design.show1style ne null? design.show1style : 'x'}">
				<input type="hidden" id="show2style" name="show2style"
					value="${design.show2style ne null? design.show2style : 'x'}">
				<input type="hidden" id="show3style" name="show3style"
					value="${design.show3style ne null? design.show3style : 'x'}">
				<input type="hidden" id="show4style" name="show4style"
					value="${design.show4style ne null? design.show4style : 'x'}">
				<input type="hidden" id="show1size" name="show1size"
					value="${design.show1size ne null? design.show1size : 'x'}">
				<input type="hidden" id="show2size" name="show2size"
					value="${design.show2size ne null? design.show2size : 'x'}">
				<input type="hidden" id="show3size" name="show3size"
					value="${design.show3size ne null? design.show3size : 'x'}">
				<input type="hidden" id="show4size" name="show4size"
					value="${design.show4size ne null? design.show4size : 'x'}">

				<input type="hidden" id="show1align" name="show1align"
					value="${design.show1align ne null? design.show1align : 'x'}">
				<input type="hidden" id="show2align" name="show2align"
					value="${design.show2align ne null? design.show2align : 'x'}">
				<input type="hidden" id="show3align" name="show3align"
					value="${design.show3align ne null? design.show3align : 'x'}">
				<input type="hidden" id="show4align" name="show4align"
					value="${design.show4align ne null? design.show4align : 'x'}">
			</div>
		</div>
	</form>
</body>
</html>