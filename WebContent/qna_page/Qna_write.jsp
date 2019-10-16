<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>           <jsp:include page="/header/header2.jsp" /><jsp:include page="Qna_page_aside.jsp"/>
<head>
<meta charset="UTF-8">
<title>QnA write</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
  		$('form').on('submit',function(){
  			$('[name=qa_cont]').val($('[name=qa_cont]').val().replace(/\n/gi,'<br/>'));
  		});
  	
	});
	
</script>
<style type="text/css">
*{
	margin: 0;
	padding : 0;
}
#writeForm{
	margin-left: 70px;
	border : 1px solid #D8D8D8;
	margin-top : 150px;
	height: 100%;
	width: 70%
}
td{
	padding: 15px;
	border-bottom: 1px solid #D8D8D8;
}
#back a{
	font-size : 30px;
	color : black;
}
#qa_cont{
	width : 100%;
	height: 100%;
	border: 1px solid #D8D8D8;
}
#back{
	margin: 50px;
}
#caution{
	/* background : #9FF781; */
	margin-top: 300px;
	margin-left : 600px;
	align-items:center; 
	color: #FF0000;
}
/* #btn_can{
	width: 200px;
	height: 200px;
	float: right;
}
#btn_submit{
	width: 200px;
	height: 200px;
	float: right;
	margin-right : 300px;
} */
#back a{
	float : right;
	margin-right: 300px;
	color : #0B2161
}
</style>
</head>
<body>
	<c:choose>
		<c:when test="${not empty sessionScope.id }">
			<form name="frm" method="post" action="qna_write.do">

				<!-- 답변글이면  -->
				<c:if test="${!empty param.qa_num }">
					<input type="hidden" name="pageNum" value="${param.pageNum}"/>
					<input type="hidden" name="qa_num" value="${param.qa_num }" />
					<input type="hidden" name="qa_ref" value="${param.qa_ref }" />
					<input type="hidden" name="qa_reStep" value="${param.qa_reStep}" />
					<input type="hidden" name="qa_reLevel" value="${param.qa_reLevel}"/>
				</c:if>
				<table id="writeForm">
					<tr>
						<td width="20%" align="center">글쓴이</td>
						<td width="80%"><p>${sessionScope.id }</p></td>
					</tr>

					<tr>
						<td width="20%" align="center">문의 종류</td>
						<td width="80%"><select id="qa_type" name="qa_type">
								<option value="옵션을선택하세요" selected="selected">옵션을 선택해주세요</option>
								<option value="게시글문의">게시글 문의</option>
								<option value="광고문의">광고 문의</option>
								<option value="신고문의">신고 문의</option>
								<option value="공유머니문의">공유 머니 문의</option>
								<option value="기타">기타</option>
						</select></td>
					</tr>

					<tr>
						<td width="20%" align="center">제목</td>
						<td width="80%"><c:choose>
								<c:when test="${!empty param.qa_num }">
									<span id="reply">[답변]</span>
									<input type="text" name="qa_title" value="${param.qa_title }"
										readonly="readonly" required="required"/>
										<script type="text/javascript">
										$('#qa_type').val('${param.qa_type}').prop("selected",true);
										</script>
								</c:when>
								<c:otherwise>
									<input type="text" name="qa_title" value="${param.qa_title}" required="required"/>
								</c:otherwise>
							</c:choose></td>
					</tr>

					<tr>
						<td width="20%" align="center">내용</td>
						<td width="80%"><textarea id="qa_cont" name="qa_cont"
								rows="13" cols="40" required="required"></textarea></td>
					<tr>
						<td colspan="2" align="center">
						<input type="submit" value="등록" id="btn_submit" />&nbsp;&nbsp;&nbsp;<input type="reset" value="취소" id="btn_can" />
						</td>
					</tr>

				</table>
					 
				<div id="back">
					<a href="qna_list.do">목록으로 돌아가기</a>
				</div>
			</form>
		</c:when>
		
	<c:otherwise>
		<div id="caution"><h1>로그인이 필요한 서비스 입니다.</h1></div>
	</c:otherwise>
	</c:choose>
</body>
</html>