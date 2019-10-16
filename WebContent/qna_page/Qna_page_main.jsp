<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="../css/Qna_page_main.css">
<jsp:include page="/header/header2.jsp" />
<jsp:include page="Qna_page_aside.jsp"/>


<head>
<meta charset="UTF-8">
<!-- <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet"> -->

<title>Insert title here</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
 $(document).ready (function(){
	 
	$('#qna').on('click',function(){
		$('form').attr('action','qna_list.do');
		$('form').submit();
	});
	$('#comon').on('click',function(){
		
		$('form').attr('action','qna_comon.do');
		$('form').submit();
	})
	$('#uselimit').on('click',function(){
		$('form').attr('action','qna_terms_service.do');
		$('form').submit();
	});
	$('#money').on('click',function(){
		$('form').attr('action','qna_money.do');
		$('form').submit();
	});
	$('#write').on('click',function(){
		$('form').attr('action','qna_writeUse.do');
		$('form').submit();
	});
 });
</script>
<style type="text/css">

</style>
</head> 

<body id="qna_main">
<form>
	<section id="center">
		<h2 id="h2">고객 문의 바로가기</h2>
			<div class="main_button">
				<button id="write">
					<i class="glyphicon glyphicon-pencil" id="write_icon"></i>
					<h3>글쓰기/ 사진첨부</h3>
				</button>
			</div>
			<div class="main_button">
				<button id="money">
					<i class="glyphicon glyphicon-usd" id="money_icon"></i>
					<h3>공유머니 환급</h3>
				</button>
			</div>
			<div class="main_button">
				<button id="Terms">
				<i class="glyphicon glyphicon-list-alt" id="terms_icon"></i>
				<h3>이용 및 제한안내</h3>
				</button>
			</div>
			<div class="main_button">
				<button id="qna">
				<i class="glyphicon glyphicon-question-sign" id="qna_icon"></i>
				<h3>1:1 문의</h3>
				</button>
			</div>
			<div class="main_button">
				<button id="comon">
					<i class="glyphicon glyphicon-map-marker" id="comon_icon"></i>
					<h3>오시는 길</h3>
				</button>
			</div>
		</section>
</form>


</body>
</html>