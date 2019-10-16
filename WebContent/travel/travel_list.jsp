<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="/header/header2.jsp" />

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- <link
	href="https://fonts.googleapis.com/css?family=East+Sea+Dokdo&display=swap&subset=korean"
	rel="stylesheet"> -->
<link
	href="https://fonts.googleapis.com/css?family=Do+Hyeon|East+Sea+Dokdo|Yeon+Sung&display=swap&subset=korean"
	rel="stylesheet">
<!-- <link
	href="https://fonts.googleapis.com/css?family=East+Sea+Dokdo|Yeon+Sung&display=swap&subset=korean"
	rel="stylesheet"> -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<title>Qna_list</title>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<style type="text/css">
* {
	margin: 0;
	padding: 0;
}

/* form {
	border: 1px solid black;
	width: 400px;
	height: 100%;
	display: inline-block
}

th {
	width: 90px;
} */
body {
	background: #ECF6FA;
}

form {
	margin-top: 130px;
}

#main_form {
	border: 1px solod black;
	margin-right: 200px;
	margint-top: 300px;
	margin-left: 240px;
	margin-bottom: 100px;
}

#first {
	/* 	border: 1px solid black;
	border-top-width: 5px;
	border-bottom-width: 5px;
	border-left-width: 5px;
	border-right-width: 5px;
	border-radius: 4px; */
	height: 350px;
	width: 270px;
	float: left;
	margin-left: 70px;
	margin-bottom: 100px;
}

wrap {
	margin-top: 10px;
}

body>p {
	font-size: 25px;
}

#first>a {
	font-size: 30px;
}

#second {
	position: absolute;
	height: 300px;
	width: 265px;
	background-size: cover;
	overflow: hidden;
	/* border: 1px solid blue; */
	margin-top: 450px;
	background-image: url('/twoteam/images/mm.png');
	background-size: cover;
	overflow: hidden;
	/* border: 1px solid blue; */
	margin-left: 1090px;
}

#second a {
	font-size: 20px;
	margin-left: 90px;
}

#title {
	font-size: 30px;
	/* font-weight: bold; */
	/* 	height: 80px; */
	text-align: center;
	font-family: 'Do Hyeon', sans-serif;
}

#im>img {
	width: 265px;
	height: 300px;
}

a {
	font-align: center;
	color: black;
}

body>form>div.wrap>p {
	font-family: 'Do Hyeon', sans-serif;
	font-size: 36px;
	color: #1D2FB9;
	margin-bottom: 40px;
}

body>form>div.pagelist {
	position: center;
	margin-top: 700px;
	font-size: 20px;
	width: 200px;
	margin-left: 950px;
}

#prev, #next {
	color: #1D2FB9;
}

#write {
	background: #ECF6FA;
	width: 300px;
	height: 300px;
	font-size: 150px;
	color: #3F4DA6;
	width: 300px;
	border: 0;
}

#ww {
	float: bottom;
	font-size: 40px;
}
</style>
<script type="text/javascript">
	$(document).ready(function() {
		$('#write').on('click', function() {
			$('form').attr('action', '/twoteam/main/travel_writeForm.do');
		});
	});
</script>

</head>
<body>

	<form action="travel.do">
		${tdto.tb_title}
		<div class="wrap">

			<p style="text-align: center">We Travel</p>
		</div>
		<div id="main_form">
			<div class="up_btn"></div>
			<c:forEach items="${requestScope.aList}" var="tdto">
				<div id="first">
					<!-- 리슷흐..... -->



					<%-- 	${tdto.tb_num} --%>

					<c:url var="cpage" value="travel_view.do">
						<c:param name="tb_num" value="${tdto.tb_num }" />
						<c:param name="pageNum" value="${pdto.currentPage }" />
					</c:url>

					<div id="im">
						<img src="/twoteam/khtemp/${tdto.tb_img}">
					</div>
					<div id="title">
						<a href="${cpage}">${tdto.tb_title}</a>
					</div>

				</div>
			</c:forEach>

			<div id="second">
				<button id="write">
					<i class="fa fa-play"><p id="ww">글 쓰러 가기</p></i>
				</button>
			</div>

		</div>
		<div class="pagelist">
			<!-- 이전 -->
			<c:if test="${pdto.startPage >1 }">
				<a href="travle.do?pageNum=${pdto.startPage-pdto.blockPage}"
					id="prev">이전</a>
			</c:if>
			<c:forEach begin="${pdto.startPage }" end="${pdto.endPage }" var="i">
				<span> <c:choose>
						<c:when test="${i==pdto.currentPage }">
							<a href="travel.do?pageNum=${i}" class="pagecolor">${i}</a>
						</c:when>
						<c:otherwise>
							<a href="travel.do?pageNum=${i}">${i}</a>
						</c:otherwise>
					</c:choose>
				</span>
			</c:forEach>
			<!-- 다음  -->
			<c:if test="${pdto.endPage < pdto.totalPage }">
				<a href="travel.do?pageNum=${pdto.startPage+pdto.blockPage+1}"
					id="next">다음</a>
			</c:if>
		</div>



		<!-- end page list -->
	</form>
</body>
</html>