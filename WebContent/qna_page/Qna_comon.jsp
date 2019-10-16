<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <jsp:include page="/header/header2.jsp" /><jsp:include page="Qna_page_aside.jsp"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<style type="text/css">
@font-face{
font-family:'park';
src:url('/twoteam/fonts/BinggraeTaom-Bold.ttf') format('truetype');
}
* {
   margin: 0;
   padding: 0;
   font-family: 'park';
}
/* body{
	background: #ECF6FA;
} */
section{
margin-left: 350px;
margin-top : 150px;
height: 1300px;
}
h1{
	color: #E13C3C;
}
#wrap{
	margin-top : 100px;
	margin-left: 100px;
}
</style>
</head>
<body>
<form action ="">
<section>
<h1>오시는길</h1>
<br>
<div id="wrap">
<img src="/twoteam/images/waymap.jpg">
<br><br>

		<ul>
			<li>
				<h4>주소</h4>
				<p>서울특별시 중구 남대문로 120 대일빌딩 2F, 3F (T: 1544-9970 / F: 02-722-0858)</p>
				<br>
			</li>

			<li><img src="/twoteam/images/map_subway.gif">
				<h4>지하철</h4>
				<p>지하철 2호선 을지로입구역 3번출구 100M / 1호선 종각역 4번, 5번 출구 200M</p> <br></li>

			<li><img src="/twoteam/images/map_bus.gif">
				<h4>버스</h4> <img src="/twoteam/images/map_bus2.jpg"></li>
		</ul>
	</div>
	</section>
</form>
</body>
</html>