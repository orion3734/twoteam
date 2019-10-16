<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>    
<!DOCTYPE html>
<html>
 <jsp:include page="/header/header2.jsp" /><jsp:include page="Qna_page_aside.jsp"/>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
*{
	margin: 0;
	padding : 0;
}
body{
	background: #ECF6FA;
}
 table{  
  width:80%
 }
 
 table, th, td{
  border:1px solid black;
  border-collapse: collapse;
 } 
#updateForm{
	border : 1px solid black;
}
td{
	padding: 15px;
}
a{
	font-size : 30px;
	color : black;
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$('form').on('click',function(){
			$('[name=qa_cont]').val($('[name=qa_cont]').val().replace(/\n/gi,'<br/>'))			
		});
	});
</script>
</head>
<body>

<jsp:scriptlet>
pageContext.setAttribute("cr", "\r"); //Space
pageContext.setAttribute("cn", "\n"); //Enter
pageContext.setAttribute("crcn","\r\n");//Space,Enter
</jsp:scriptlet>
	  
	  
	  
	   <form name="frm" action="qna_updatePro.do" method="post">
	   <input type="hidden" name="pageNum" value="${param.pageNum}" />
	    <input type="hidden" name="qa_num" value="${dto.qa_num}" />
	   <input type="hidden" name="qa_num" value="${dto.qa_num}" />
	    <table id="updateForm">
			<tr>

				<td width="20%">글쓴이</td>
				<td colspan="3">${dto.id}</td>

			</tr>
			<tr>
				<td width="20%" align="center">문의 종류</td>
				<td width="80%">
				<select id="qa_type" name="qa_type" value="${dto.qa_type }">
					<option>옵션을 선택해주세요</option>
					<option value="게시글문의">게시글 문의</option>
					<option value="광고문의">광고 문의</option>
					<option value="신고문의">신고 문의</option>
					<option value="공유머니문의">공유 머니 문의</option>
					<option value="기타">기타</option>
				</select></td>
			</tr>
			<tr>
				<td>제목</td>
				<td colspan="3"><input type="text" name="qa_title"
					value="${dto.qa_title}" /></td>
			</tr>

			<tr>
				<td>내용</td>
				<td colspan="3">				
                 <textarea rows="15"
						cols="25" name="qa_cont">${fn:replace(dto.qa_cont,'<br/>',crcn)}</textarea></td>
			</tr>
			<tr><td colspan="2">
				<input type="submit" value="수정" id="btnUpdate"/>&nbsp;&nbsp;
				<input type="reset" value="취소" /></td>
			</tr>
		</table>

	</form>
</body>
</html>