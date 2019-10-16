<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<jsp:include page="/header/header2.jsp" />

<head>
<meta charset="UTF-8">
<title>together</title>
<link
	href="https://fonts.googleapis.com/css?family=Saira+Stencil+One|Sunflower:300,500,700&display=swap&subset=korean,latin-ext,vietnamese"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=East+Sea+Dokdo&display=swap"
	rel="stylesheet">
<meta name="viewport" content="width=device-width, initial-scale=1">
<META http-equiv="content-type" content="text/html; charset=euc-kr">

<!-- 자동으로 모바일 조정  -->

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="/twoteam/css/main.css" />
<link rel="stylesheet" type="text/css" href="/twoteam/css/animate.css" />
<link
	href="https://fonts.googleapis.com/css?family=Do+Hyeon|Noto+Sans+KR&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Noto+Sans+KR|Saira+Stencil+One&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Roboto+Mono&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Karma">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/twoteam/js/wow.min.js"></script>
<script type="text/javascript" src="/twoteam/js/main2.js"></script>
<style type="text/css">
body, h1, h2, h3, h4, h5, h6 {
	font-family: "Karma", sans-serif
}

.w3-bar-block .w3-bar-item {
	padding: 20px
}
</style>
<script type="text/javascript">
	$(document).ready(function() {
		new WOW().init();

		var timer = setInterval(function() {
			$.ajax({
				type : 'GET',
				url : 'iu.do',
				datatype : 'json',
				contentType : 'application/json',
				success : function(object) {
					console.log(object.url);
					$('.main_bg').empty();
					$('.main_bg').load(object.url);
				}
			});
		}, 500000); // 30초에 한번씩 받아온다.
	});
</script>
<style type="text/css">
.carousel-content {
  position: absolute;
  transform: translateY(-50%) translateX(-50%); 
  top: 50%;
  left: 50%;
  font-size:200px;
  z-index: 20;
  color: white;
  text-shadow: 0 1px 2px rgba(0,0,0,.6);
}
</style>
</head>
<body>
<body>
	<form action="main.do" method="post">


		<div id="myCarousel" class="carousel slide" data-ride="carousel">
			<!-- Indicators -->
			<ol class="carousel-indicators">
				<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
				<li data-target="#myCarousel" data-slide-to="1"></li>
				<li data-target="#myCarousel" data-slide-to="2"></li>
				<li data-target="#myCarousel" data-slide-to="3"></li>
			</ol>

			<!-- Wrapper for slides -->
			<div class="carousel-inner">
				<div class="item active">
					<img src="/twoteam/images/img3.jpg" alt="">
					<div class="carousel-content">
						<p>TRAVEL</p>
					</div>
				</div>
				<div class="item">
					<img src="/twoteam/images/img10.jpg" alt="">
				</div>
				<div class="item">
					<img src="/twoteam/images/img8.jpg" alt="">
				</div>
				<div class="item">
					<img src="/twoteam/images/img5.jpg" alt="">
				</div>
			</div>

			<!-- Left and right controls -->
			<a class="left carousel-control" href="#myCarousel" data-slide="prev">
				<span class="glyphicon glyphicon-chevron-left"></span> <span
				class="sr-only">Previous</span>
			</a> <a class="right carousel-control" href="#myCarousel"
				data-slide="next"> <span
				class="glyphicon glyphicon-chevron-right"></span> <span
				class="sr-only">Next</span>
			</a>
		</div>
		

		<div class="main_bg2">
			<div class="w3-main w3-content w3-padding" style="max-width: 1400px;">
				<div class="showwrap">
					<div id="showimg2" class="wow fadeInRight">
						<a href="travel.do"> <img id="img2f"
							src="/twoteam/images/show2.jpg"
							onmouseover="this.src='/twoteam/images/icon7.png';"
							onmouseout="this.src='/twoteam/images/show2.jpg';">
						</a>
					</div>
					<div id="showtext" class="wow fadeInRight">
						<a href="travel.do"><h1>
								나의 여행을 </br>자랑해볼까유?
							</h1></a>
					</div>
					<div id="showimg1" class="wow fadeInRight">
						<a href="trip2.do"> <img id="img1f"
							src="/twoteam/images/show.jpg"
							onmouseover="this.src='/twoteam/images/icon3.png';"
							onmouseout="this.src='/twoteam/images/show.jpg';">
						</a>
					</div>
					<div id="showimg4" class="wow fadeInRight">
						<a href="ad.do"> <img id="img4f"
							src="/twoteam/images/show4.jpg"
							onmouseover="this.src='/twoteam/images/icon5.png';"
							onmouseout="this.src='/twoteam/images/show4.jpg';">
						</a>
					</div>
					<div id="showimg5" class="wow fadeInRight">
						<a href="qna.do"> <img id="img5f"
							src="/twoteam/images/show5.jpg"
							onmouseover="this.src='/twoteam/images/icon8.png';"
							onmouseout="this.src='/twoteam/images/show5.jpg';">
						</a>
					</div>
					<div id="showimg6" class="wow fadeInRight">
						<a href="mypage.do"> <img id="img6f"
							src="/twoteam/images/show6.jpg"
							onmouseover="this.src='/twoteam/images/icon1.png';"
							onmouseout="this.src='/twoteam/images/show6.jpg';">
						</a>
					</div>
				</div>
			</div>
		</div>
		<!-- !PAGE CONTENT! -->
		<div class="main_bg">
			<div class="w3-main w3-content w3-padding" style="max-width: 1600px;">
				<div class="wow fadeInDown">
					<p id="top">Best Top3</p>
				</div>
				<div class="wow fadeInDown" id="topform">
					<table id="top_frm">
						<tr>
							<c:forEach items="${requestScope.aList }" var="aList">
								<td><img src="/twoteam/khtemp/${aList.tb_img}"
									class="top_img"><br /> <a href="travel_view.do?tb_num=${aList.tb_num}"
									class="top_img_title"> ${aList.tb_title}</a></td>
							</c:forEach>
						</tr>

					</table>
				</div>
			</div>
		</div>

	</form>


</body>
</html>