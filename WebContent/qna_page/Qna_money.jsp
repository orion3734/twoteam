<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html> <jsp:include page="/header/header2.jsp" /><jsp:include page="Qna_page_aside.jsp"/>
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
body{
	background: #ECF6FA;
}
form{
	margin-top: 150px;
	margin-left: 350px;
}
h1{
	color :#E13C3C;
}
#money_wrap{
	margin-top: 50px;
	margin-left : 50px;
}
#mon_fir,#mon_se,#mon_th{
	border : 4px solid black;
	margin: 50px;

}

</style>
</head>
<body>
<form action="">
		<h1>공유머니 받는과정</h1>
<div id="money_wrap">
		<h3>1. 마이페이지 클릭</h3>
		<div>
			<input type="image" src="/twoteam/images/mypage_click.png" id="mon_fir"/>
		</div>

		<h3>2. 회원님의 글 조회수가 일정 조회수가 되면 광고에 대한 환급을 받으실 수 있습니다.</h3>
		<div><input type="image" src="/twoteam/images/second.PNG" id="mon_se"/></div>


		<h3>3. 마이페이지에서 계좌번호를 등록해주세요</h3>
		<div><input type="image" src="/twoteam/images/thrid.PNG" id="mon_th" /></div>
</div>
	</form>
	
</body>
</html>