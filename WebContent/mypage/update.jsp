<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
 table{  
  width:50%;
  margin: auto;
  margin-top: 150px;
  
 }
 
 table, th, td{
  border:1px solid black;
  border-collapse: collapse;
  font-size: 30px;
 }
 
 input{
 	font-size: 20px;
 } 
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>

<script type="text/javascript">
  	function updatePro() {
  		event.preventDefault();
  		if($('#pw').val()!==$('#chpw').val()) {
  			alert("비밀번호가 다릅니다.");
  			$('#pw').focus();
  		} else
  			$('form').submit();
  	}
  	function cancel() {
  		history.back();
  	}
</script>

</head>
<body>

<%--
 pageContext.setAttribute("cr", "\r"); //Space
 pageContext.setAttribute("cn", "\n"); //Enter
 pageContext.setAttribute("crcn","\r\n");//Space,Enter
--%>

<jsp:scriptlet>
pageContext.setAttribute("cr", "\r"); //Space
pageContext.setAttribute("cn", "\n"); //Enter
pageContext.setAttribute("crcn","\r\n");//Space,Enter
</jsp:scriptlet>
<form name="frm" action="updatePro.do" method="post" enctype="multipart/form-data">
	   
	    
	    <table>
			<tr>
				<td width="30%">이름</td>
				<td colspan="3"><input type="text"
					value="${dto.name}" disabled/>
					<input type="hidden" name="name"
					value="${dto.name}"/></td> 
			</tr>

			<tr>
				<td>새 비밀번호</td>
				<td colspan="3"><input type="password" name="pw" id="pw"
					required="required"/></td>
			</tr>
			
			<tr>
				<td>새 비밀번호 확인</td>
				<td colspan="3"><input type="password" name="chpw" id="chpw"
					required="required"/></td>
			</tr>
			
			<tr>
				<td>이메일</td>
				<td colspan="3"><input type="text" name="email"
					value="${dto.email}" required="required"/></td>
			</tr>

			<tr>
				<td>얼굴 이미지</td>
				<td colspan="3"><input type="file" name="face_img"/><span>${dto.faceimg}</span>
				</td>
			</tr>

			<tr><td colspan="2" style="text-align: center;">
				<button onclick="updatePro();" id="" >수정</button>&nbsp;&nbsp;
				<button onclick="history.back();" >취소</button></td>
			</tr>
		</table>

	</form>
</body>
</html>