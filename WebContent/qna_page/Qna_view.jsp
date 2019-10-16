<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html> <jsp:include page="/header/header2.jsp" /><jsp:include page="Qna_page_aside.jsp"/>
<head>          
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
*{
	margin: 0;
	padding :0 
}
body{
	background: #ECF6FA;
}
table{
	width: 70%;
	height: 80%;
	margin-top: 150px;
}
table th{
	font-size: 20px; 
	font-weight: 200;
}
table td{
	text-align: justify;
	border: 1px solid #D8D8D8;
	font-size: 15px;
}
table,th {
	border: 1px solid #D8D8D8;
	text-align: center;
}
/* 버튼  */
#list {
  background-color: white; 
  color: black; 
  border: 2px solid #008CBA;
  margin-left: 300px;
}
#list:hover{
  background-color: #008CBA;
  color: white;
}
#reply {
  background-color: white; 
  color: black; 
  border: 2px solid #008CBA;
}
#reply:hover {
  background-color: #008CBA;
  color: white;
}

#update {
  background-color: white; 
  color: black; 
  border: 2px solid #008CBA;
}
#update:hover {
  background-color: #008CBA;
  color: white;
}
#th_cont{
	border: 0px;
}
#td_cont{
	height: 500px;
}
#del{
  background-color: white;
  color: black;
  border: 2px solid #008CBA;
}
#del:hover {
background-color: #008CBA;
color : white;
}
.view_btn{
	width: 40px;
	height: 30px;
	margin-left: 15px;
	 margin-top :30px;
}
#caution_view{
	color:#F5194D;
	line-height: 80%
	
}

</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$('#list').on('click',function(){
		$('form').attr('action','/twoteam/main/qna_list.do');
	});
	$('#reply').on('click',function(){
		$('form').attr('action','qna_writeForm.do');
	});
	$('#update').on('click',function(){
		$('form').attr('action','qna_updateForm.do');
	});
	$('#del').on('click',function(){
		var chk = confirm("정말로 삭제하시겠습니까?")
		if(!chk){
			return false
		}else{
		$('form').attr('action','qna_delete.do');
		}
		
	});
	
	
});
</script>
</head>
	<body id="view_body">

<table id="view_tab">
		<tr>
			
			<th width="20%">글&nbsp;&nbsp;쓴&nbsp;&nbsp;이</th>
			<td>${dto.id}</td>
		</tr>
		<tr>
			<th>작성 날짜</th>
			<td colspan="2">${dto.qa_date }</td>
		</tr>
		<tr>
			<th>제&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;목</th>
			<td colspan="2">${dto.qa_title}</td>
		</tr>
      
		<tr>
			<th>문의 종류</th>
			<td colspan="2">${dto.qa_type}</td>
		</tr>

		<tr>
			<th id="th_cont">내&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;용</th>
		</tr>
		<tr>
			<td id="td_cont" colspan="2" rowspan="100">${dto.qa_cont }</td>
		</tr>
	

<!-- 		<tr>
			<td align="right" colspan="2"><a href="list.do">목록으로 돌아가기</a></td>
		</tr> -->
	</table>
	
	<form name="frm" method="post" action="">
		<input type="hidden" name="pageNum" value="${param.pageNum}" />
		<input type="hidden" name="qa_num" value="${dto.qa_num }" placeholder="글번호"/>
		<input type="hidden" name="qa_ref" value="${dto.qa_ref}"/>
		<input type="hidden" name="qa_reStep" value="${dto.qa_reStep }"/>
		<input type="hidden" name="qa_reLevel" value="${dto.qa_reLevel }" placeholder="답글이면1"/>
		<input type="hidden" name="qa_title" value="${dto.qa_title}" />
		<input type="hidden" name="qa_type" value="${dto.qa_type}" />
		<!-- 목록 / 답변/ 수정-->
		<input type="submit" class="view_btn" id="list" value="목록"/>
		<c:if test="${sessionScope.lvl=='1'}">
			<input type="submit" class="view_btn" id="reply" value="답변"/>
		</c:if>
		<input type="submit" class="view_btn" id="update" value="수정"/>
		<input type="submit" class="view_btn" id="del" value="삭제"/>
	</form>

</body>
</html>