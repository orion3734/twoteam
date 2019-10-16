<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> <jsp:include page="/header/header2.jsp" />
<jsp:include page="adv_aside.jsp" />

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css"
	type="text/css" media="all" />
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"
	type="text/javascript"></script>
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"
	type="text/javascript"></script>
		<script src="/twoteam/ad/ad_js/insert.js"></script>
		<link rel="stylesheet" href="/twoteam/ad/ad_css/insert.css">
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>

<section>
<div id="adv">
	<form id="advInsert" action="ad_updatepro.do" method="post" enctype="multipart/form-data">
	<input type="hidden" value="${ dto.adnum}" name="adnum">
					<p>
						<label>타입</label>
						<input type="radio" name="tag" value="1" checked="checked">양쪽
						<input type="radio" name="tag" value="2">세로 
						 <input type="radio" name="tag" value="3">노출
					
					</p>
					<p>
						<label for="cy">회사명</label> <input type="text" name="cy" id="cy" value="${dto.cy }">
					</p>
					<p>
						<label for="nm">담당자명</label> <input type="text" name="nm" id="nm" value="${dto.nm }">
					</p>
					<p>
						<label for="tel">담당자 연락처</label> <input type="text" name="tel"
							id="tel" value="${dto.tel }">
					</p>
					<p>
						<label for="title">제안명</label> <input type="text" name="title"
							id="title" value="${dto.title }">
					</p>
					<p>
						<label for="cont">내용</label> <input type="text" name="cont"
							id="cont" value="${dto.cont }">
					</p>
						<p>
						<label for="cont">예상 금액</label> <input type="text" name="money"
							id="money" value="${dto.money }">
					</p>
					<p>
						<label>광고기간</label> <input type="text" id="from" name="dateS" readonly="readonly" value="${dto.dateS }">
						~ <input type="text" id="to" name="dateE" readonly="readonly" value="${dto.dateE }">
					</p>
					<p>
						<label>첨부파일</label> <input type="text" id="here" disabled="disabled" placeholder="최대용량 10MB" value="${dto.img }"> 
						<label for="fe">업로드</label> <input type="file" id="fe" name="img" >
					</p>
					<p>개인정보 수집 및 이용에 대한 안내</p>
					<p>
						<textarea id="text" readonly="readonly">
제휴를 희망하는 기업 및 개인을 대상으로 아래와 같이 개인정보를 수집하고 있습니다.
1. 수집 개인정보 항목 : 회사명, 담당자명, 연락처, 메일 주소
2. 개인정보의 수집 및 이용목적 : 제휴신청에 따른 본인확인 및 원활한 의사소통 경로 확보
3. 개인정보의 이용기간 : 제휴제안 검토를 위해 정보를 수집하며, 3개월 이후 자동파기 됩니다.
그 밖의 사항은 개인정보처리방침을 준수합니다.
					</textarea>
						<br /> <input type="checkbox" id="con1">내용을 확인했으며, 동의합니다.
					</p>

					<p>유의사항</p>
					<p>
						<textarea id="text" readonly="readonly">
제안해 주신 부분에 대해서는 채택되지 않을 수 있으며, 
채택 시에는 연락을 드려 함께 진행할 수 있도록 하겠습니다. 
기입하신 정보는 3개월 이후 자동파기 됩니다.
					</textarea>
						<br /> <input type="checkbox" id="con2">내용을 확인했으며, 동의합니다.
					</p>

					<p>
						<input type="button" id="cn" value="취소">
							<input type="button" id="in" value="수정하기">
					</p>
				</form>
				</div>
		</section>
</body>
</html>