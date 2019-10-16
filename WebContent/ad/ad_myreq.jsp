<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="/header/header2.jsp" />
<jsp:include page="adv_aside.jsp" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/twoteam/ad/ad_css/myreq.css">
</head>
<body>
	<section>
		<c:choose>
			<c:when test="${ not empty sessionScope.id }">
				<div id="adreq">
					<table>
						<tr>
							<th>신청번호</th>
							<th>제 목</th>
							<th>시작기간</th>
							<th>끝기간</th>
							<th>댓글</th>
						</tr>
						<c:forEach var="result" items="${requestScope.alist }">
						
						
							<tr>
								<td><c:out value="${result.adnum }"></c:out></td>
								<td><c:url var="cpage" value="view.do">
										<c:param name="adnum" value="${result.adnum }" />
										<c:param name="pageNum" value="${pdto.currentPage }" />
									</c:url> <a href="${cpage }">${result.title }</a></td>
								<td><c:out value="${result.dateS }"></c:out>&nbsp;</td>
								<td><c:out value="${result.dateE }"></c:out></td>
								<td>
								<c:forEach var="result2" items="${requestScope.alist2 }">
								
								<c:choose>
								
								<c:when test="${ result2.ad_num==result.adnum}">
								<c:out value="${result2.a }"></c:out> 
								</c:when>
								
								</c:choose>
								
								</c:forEach>
								
								</td>
							</tr>
						</c:forEach>
					</table>
				</div>
				<div class="page">
				<c:if test="${pdto.startPage >1 }">
				<a href="ad_myreq.do?pageNum=${pdto.startPage-pdto.blockPage}" id="prev">이전</a>
			</c:if>
				<c:forEach begin="${pdto.startPage }" end="${pdto.endPage }" var="i">
					<span> <c:choose>
							<c:when test="${i==pdto.currentPage }">
								<a href="ad_myreq.do?pageNum=${i}" class="pagecolor">${i}</a>
							</c:when>
							<c:otherwise>
								<a href="ad_myreq.do?pageNum=${i}">${i}</a>
							</c:otherwise>
						</c:choose>
					</span>
				</c:forEach>
				<c:if test="${pdto.endPage < pdto.totalPage }">
					<a href="ad_myreq.do?pageNum=${pdto.startPage+pdto.blockPage+1}" id="next">다음</a>
				</c:if> 
				</div>
			</c:when>



			<c:when test="${ empty sessionScope.id  }">
				<div id="adreq">
					<h3>
						<a href="login.do">로그인해주세요</a>
					</h3>
				</div>
			</c:when>
			
		</c:choose>
	</section>
</body>
</html>