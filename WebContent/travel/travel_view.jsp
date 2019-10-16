<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html>
<head>
<jsp:include page="/header/header2.jsp" />

<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
* {
	margin: 0;
	padding: 0;
}

section {
	margin-top: 90px;
}

#view {
	width: 60%;
	height: 80%;
	float: left;
	margin-left: 250px;
}

#view_link {
	margin: 20px 0 20px;
}

#view_link a {
	text-decoration: none;
}

#view_top {
	height: 30px;
	background-color: #CEE3F6;
}

#view_table {
	border-top: 1px solid #848484;
	border-bottom: 1px solid #848484;
}

#area {
	width: 100%;
	height: 100%;
}

#aside {
	width: 160px;
	height: 600px;
	/* border: 1px solid blue; */
	display: inline-block;
	float: left;
}

#aside2 {
	width: 160px;
	height: 600px;
	/* border: 1px solid blue; */
	
	
	display: inline-block;
	float: right;
}

#foot>img {
	width: 968px;
	height: 88px;
	display: inline-block;
	/* border: 1px solid blue; */
	/* margin-left: 360px;
	margin-top: 10px; */
	margin: auto;
	margin-left: 20%;
	bottom: 3%;
	
    position: fixed;
}

#foot {
	width: 968px;
	height: 88px;
	display: inline-block;
	/* border: 1px solid blue; */
	/* margin-left: 360px;
	margin-top: 10px; */
	margin: auto;
}

#view_headline {
	display: block;
	border-bottom: 3px solid #eee;
	height: 30px;
}

#view_time {
	float: left;
}

#view_time span {
	margin-right: 10px;
}

#view_cnt {
	float: right;
}

#view_main {
	clear: both;
}

#list_group {
	width: 110;
	height: 80px;
	float: right;
	margin-top: 3;
}

#list, #updt, #del {
	background: white;
}
</style>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<script type="text/javascript">
	$(document).ready(function() {

		$('#list').on('click', function() {
			$('form').attr('action', 'travel.do');
		});
		$('#updt').on('click', function() {
			/* 'form[name=frm]' */
			$('form').attr('action', 'travel_updateForm.do');
		});
		$('#del').on('click', function() {

			var chk = confirm("정말로 삭제하시겠습니까?")
			if (!chk) {
				return false
			} else {
				$('form').attr('action', 'tavel_delete.do');
			}

		});
	});
</script>
</head>
<body>


	<form name="frm" method="post" action=" ">
		<section>
			<div id="aside">
				<img src="/twoteam/images/adv_side.png">
			</div>

			<div id="aside2">
				<img src="/twoteam/images/adv_side.png">
			</div>

			<div id="view">
				${tdto.tb_dt}
				<div id="view_top">
					작성자:<span>${tdto.id}</span>
					<!--목록 / 답변/ 수정 -->
					<div id="list_group">

						<input type="submit" class="view_btn" id="list" value="목록" />
						<c:choose>
							<c:when test="${tdto.id==sessionScope.id || sessionScope.lvl==1}">


								<input type="submit" class="view_btn" id="updt" value="수정" />
								<input type="submit" class="view_btn" id="del" value="삭제" />
							</c:when>
						</c:choose>
					</div>

				</div>
				<div id="view_table">
					<div id="view_header">
						<h2>${tdto.tb_title}</h2>
					</div>
					<div id="view_headline">
						<div id="view_time">
							<span>여행 기간 </span> <span>${tdto.tb_dt_s} ~
								${tdto.tb_dt_e}</span>
						</div>
						<div id="view_cnt">
							<span>조회수 ${tdto.tb_readct}</span>
						</div>
					</div>
					<div id="view_main">
						<div>${tdto.editordata}</div>
					</div>
				</div>
			</div>
			<div id="foot">
				<img src="/twoteam/images/add_test2.png">
			</div>

			<%-- <table id="view">

			<tbody>
				<tr>
					<th height=30px>여행 제목</th>
					<td colspan="3">${tdto.tb_title}</td>
				</tr>
				<tr>
					<th height=30px>여행 기간</th>
					<td colspan="3">${tdto.tb_dt_s}~${tdto.tb_dt_e}</td>
				</tr>
				<tr>
					<th height=500px>여행 내용</th>
					<td colspan="3">${tdto.editordata}</td>
				</tr>
			</tbody>
		</table> --%>





		</section>

		<input type="hidden" name="pageNum" value="${param.pageNum}" /> <input
			type="hidden" name="tb_num" value="${tdto.tb_num }" placeholder="글번호" />
		<input type="hidden" name="tb_title" value="${tdto.tb_title}" />



	</form>



</body>
</html>