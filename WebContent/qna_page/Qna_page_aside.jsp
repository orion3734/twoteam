<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Insert title here</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
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
aside{
	float:left;
	width:300px;
}
aside .one{
	margin-top:150px;
	list-style: none;
	font-size: 30px;
	margin-left: 100px;
}

aside .two{
	margin-top:20px;
	margin-left:130px;
	list-style: none;
}
aside ul li a{
	text-decoration: none;
}


li a{
	color: #5882FA;
	text-decoration: none;
	font-size: 20px;
}
li a:hover{
	text-decoration: underline;
	color :#FE2E64;
}
</style>

</head>
<body>
<aside>
			<ul class="menu">
				<li class="one">자주 묻는 질문</li>
				<li class="two"><a href="qna_writeUse.do" class="write">글쓰기/사진첨부</a></li>
				<li class="two"><a href="qna_money.do" class="money">공유머니 받는 과정</a></li><!--미완-->
				<li class="two"><a href="qna_terms_service.do" class="use_limit">이용 및  제한 안내</a></li><!-- 완 -->
				<li class="two"><a href="qna_comon.do" class="map">오시는 길</a></li>
				
				<li class="one">직접 질문하기</li>
				<li class="two"><a href="qna_list.do" class="QnA">QnA</a></li>
			</ul>
		</aside>
</body>
</html>