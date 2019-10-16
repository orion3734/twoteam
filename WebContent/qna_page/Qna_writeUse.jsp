<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html><jsp:include page="/header/header2.jsp" /><jsp:include page="Qna_page_aside.jsp"/>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<style type="text/css">
*{
	margin : 0;
	padding : 0;
	
}
h1{
	color: #E13C3C;
}
section{
margin-left: 350px;
margin-top : 150px;
height: 1300px;
}
#move{
	font-size: 20px;
	text-align: center;
	color : #000000;
}
#write_wrap{
	margin-left: 50px;
}
span{
	background: #FA58F4;
}
	
</style>

</head>
<body>
	<form action="">
	<section>
		<h1>글쓰기/ 사진첨부</h1>
		<br/>
		<br/>
	<div id="write_wrap">
		<h3>여행후기 글쓰기/ 사진첨부 방법 입니다.</h3>
		<br/>
		<br/>
		<img src="/twoteam/images/write_use.jpg">
		<br/>
		<br/>
		<span><a href="/qna_list.do" id="move">자세한 문의는 1:1게시판을 이용해주세요</a></span>
	</div>
		
	</section>
	</form>	
</body>
</html>