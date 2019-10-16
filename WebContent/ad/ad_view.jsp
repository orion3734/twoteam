<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>           <jsp:include page="/header/header2.jsp" />
<jsp:include page="adv_aside.jsp" />

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/twoteam/ad/ad_css/view.css">
<script src="/twoteam/ad/ad_js/view.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$('#co').click(function(){
		if($('#cont').val()==""){
			alert("내용입력해주세요");
			return false;
		}else{
			$('[name=cont]').val($('[name=cont]').val().replace(/\n/gi,'<br/>'));
			$('#adanw').submit();
		}
		})
})
</script>
</head>
<body>
	<section>
		<table>
			<tr>
				<td>글번호</td>
				<td>${result.adnum }</td>
			</tr>

			<tr>
				<td>제목</td>
				<td>${result.title}</td>
			</tr>

			<tr>
				<td>타입</td>
				<c:if test="${result.tag eq 1}">
					<td>양쪽 세로형</td>
				</c:if>
				<c:if test="${result.tag eq 2}">
					<td>하단 가로형</td>
				</c:if>
				<c:if test="${result.tag eq 3}">
					<td>노출형</td>
				</c:if>
			</tr>


			<tr>
				<td>시작일</td>

				<td>${result.dateS }</td>

				<td>종료일</td>

				<td>${result.dateE } </td>
				
				<td style="width:150px; text-align: center;">총기간</td>
				<td>${result.dateSE }일</td>
				
			</tr>
			<tr>
				<td>예상 금액</td>

				<td>${result.money }</td>
			</tr>
			<tr>
			<td>회사명</td>
			<td>${result.cy }</td>
			</tr>
			<tr>
				<td>신청자</td>

				<td>${result.nm }  (아이디: ${result.id })</td>

				<td>연락처</td>

				<td>${result.tel }</td>
			</tr>
			<tr>
				<td>내용</td>

				<td>${result.cont }</td>
			</tr>
			<tr class="fin">
				
				<c:forTokens var="ext" items="${result.img}" delims="." varStatus="status">
				 <c:if test="${status.last}">
				 <c:choose>
           			 <c:when test="${ext eq 'img' || ext eq 'png' || ext eq 'gif'}">
           			 <td>이미지</td>
						<td colspan="3"><img src="/twoteam/adinsertimg/${result.img }"></td>
					</c:when>
<c:otherwise>
<td>자료</td>
					<td><a href="/twoteam/adinsertimg/${result.img }">다운로드</a></td>
			</c:otherwise>	
				</c:choose>
				</c:if>
				</c:forTokens>
			</tr>
		</table>
		 <c:if test="${ result.id==sessionScope.id}">
		 <div class="update">
		 <input type="submit" value="수정" id="update">
		 <input type="submit" value="삭제" id="delete">
		 </div>
		 <form method="get" id="updateform">
		 <input type="hidden" value="${result.adnum }" name="adnum"> 
		 </form>
		 </c:if>
		<c:if test="${sessionScope.lvl==1 }">
		<form method="get" action="adanw.do" id="adanw">
		<textarea name="cont" style="width:1150px;" id="cont"></textarea><br/>
		<input type="hidden" name="anwid" value="${sessionScope.id }">
		<input type="hidden" name="anwnum" value="${param.adnum}">
		<input type="submit" value="댓글달기" id="co">
		</form>
		</c:if>
		<br/>
		<br/>
		
				<table style="width:1150px;" id="anw">
				
				<c:forEach var="result" items="${requestScope.alist }">
				
				<tr>
						<td>${result.id }</td>
						<td style="width:820px;">${result.ad_cont_aw }</td>
						<td>${result.anwdate }</td>
						<td><form method="get" action="anwdel.do" id="delsu"><input type="hidden" value="${result.num }" id="anwnum"><c:if test="${sessionScope.id==result.id  }"><input type="button" value="삭제" id="del"></c:if></form></td>
					</tr>
				</c:forEach>
				<!--  -->
			</table>
	</section>
	<script type="text/javascript">
	$('input[type=button]').click(function(){
		var trdel=$(this).closest("tr");
		var anwnum=$(this).prev().val();;
	if(confirm("정말 삭제하시겠습니까?"+anwnum)){
			$.ajax({
				url:'anwdel.do?anwnum='+anwnum,
				type:'GET',
			    dataType : "json",
				success:function(data){
				trdel.remove();
				}
			})
	}else{
		return
	}
		
	
	})
	</script>
</body>
</html>