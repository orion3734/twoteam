<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html id="list_background">   <jsp:include page="/header/header2.jsp" /> <jsp:include page="Qna_page_aside.jsp"/>
<link href="https://fonts.googleapis.com/css?family=Sunflower:300,500,700&display=swap&subset=korean" rel="stylesheet">
<head>        

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<title>Qna_list</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$('#write').on('click',function(){
		var id = ${sessionScope.id}
		if(id == "null"){
			alert('로그인 후 이용하실 수 있습니다.')
			$(location).attr('action', '/main.do');
		}
	});
});
</script>
<style type="text/css">
*{
	margin : 0;
	padding: 0;
	font-size: 15px;
}
/* 배경색  */
body{
	background: #ECF6FA;
}
form{
	width: 70%;
	height: 100%;
	display : inline-block;
	margin-left: 50px;
	margin-top: 150px;
}
.table{
	margin-bottom: 100px;
}
	
th{
	width : 90px;
}
.pagelist a{
	text-decoration: none;
	color : black;
}

.pagelist a:hover, .pagelist .pagecolor{
	text-decoration: underline;
	color : red;
	
}
#write_btn_wrap{
	background: #D0FA58
}

#write_btn{
	font-size: 20px;
	color : #000000;
}
#list_login_box{
	width: 500px;
	height: 500px;
	margin-top:300px;
	margin-left: 300px; 
}
#list_login{
	color: #D41414;
	font-size: 30px;
}
</style>
<script type="text/javascript">
</script>

</head>
<body>
	<form action ="qna_list.do">
			
	<c:choose>
		<c:when test="${not empty sessionScope.id }">
		
			<span id="write_btn_wrap"><a href="qna_writeForm.do" id="write_btn">글쓰기</a></span>
	<table class="table">
		<thead>
			<tr>
			<th> 글 번호</th>
			<th> 타입 </th>
			<th> 제목 </th>
			<th> 날짜 </th>
			<th> 글쓴이</th>
			</tr>		
		</thead>
		<tbody>
			<!-- 리슷흐..... -->
			<c:forEach items="${requestScope.aList}" var="dto">
			<tr>
				<td>${dto.qa_num}</td>
				<td>${dto.qa_type}</td>
				<td>
					<c:if test="${dto.qa_reLevel !=0 }">
						<img src="/twoteam/images/level.gif" width="${dto.qa_reLevel*10}"/>
						<img src="/twoteam/images/re.gif"/>
					</c:if>
					<c:url var="cpage" value="qna_view.do">
						<c:param name="qa_num" value="${dto.qa_num }"/>
						<c:param name="pageNum" value="${pdto.currentPage }"/>
					</c:url>
				 <a href="${cpage}">${dto.qa_title}</a>
				 <input type="hidden" name="qa_ref" id="qa_ref" value="${dto.qa_ref}" />
				 </td>
				<td>${dto.qa_date}</td>
				<td>${dto.id}</td>
			</tr>
			</c:forEach>
		</tbody>
	</table>
	</c:when>
	<c:otherwise>
		<div id="list_login_box">
		<h1 id="list_login">로그인이 필요한 서비스 입니다.</h1>
		</div>
	</c:otherwise>
	</c:choose>
		<!-- 페이지 -->	
	
	<div class="pagelist">
	<!-- 이전 -->
			<c:if test="${pdto.startPage >1 }">
				<a href="qna_list.do?pageNum=${pdto.startPage-pdto.blockPage}" id="prev">이전</a>
			</c:if>
			<c:forEach begin="${pdto.startPage }" end="${pdto.endPage }" var="i" >
				<span>
					<c:choose>
						<c:when test="${i==pdto.currentPage }">
						<a href="qna_list.do?pageNum=${i}" class="pagecolor" id="pagelist_fir">${i}</a>
						</c:when>
						<c:otherwise>
							<a href="qna_list.do?pageNum=${i}">${i}</a>
						</c:otherwise>
							</c:choose>
						</span>
				</c:forEach>
				<!-- 다음  -->
			 	<c:if test="${pdto.endPage < pdto.totalPage }">
					<a href="qna_list.do?pageNum=${pdto.startPage+pdto.blockPage+1}" id="next">다음</a>
				</c:if> 
			</div> <!-- end page list -->
	</form>
</body>
</html>