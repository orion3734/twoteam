<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>




<!DOCTYPE html>
<html>
<jsp:include page="/header/header2.jsp" />
<head>
<!-- include libraries(jQuery, bootstrap) -->
<link
	href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css"
	rel="stylesheet">
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
<script
	src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>

<!-- include summernote css/js -->
<link
	href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote.css"
	rel="stylesheet">
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript">
	$(document).ready(
			function() {

				$('#summernote').summernote(
						{
							height : 600,
							fontNames : [ '맑은고딕', 'Arial', 'Arial Black',
									'Comic Sans MS', 'Courier New', ],
							fontNamesIgnoreCheck : [ '맑은고딕' ],
							focus : true,

							callbacks : {
								onImageUpload : function(files, editor,
										welEditable) {
									sendFile(files[0], this);
								}
							}
						});
				function sendFile(file, editor) {
					// 파일 전송을 위한 폼생성
					data = new FormData();
					data.append("uploadFile", file);
					$
							.ajax({ // ajax를 통해 파일 업로드 처리
								data : data,
								type : 'POST',
								url : '../travel/travel_write_back.jsp',
								cache : false,
								contentType : false,
								processData : false,
								success : function(data) { // 처리가 성공할 경우
									// 에디터에 이미지 출력
									console.log(data);
									/* 	if (data != null) {
											alert("data != null 데이터 있음" + data);
										}
										else {
											alert("데이타 없음");
										} */

									$(editor).summernote('editor.insertImage',
											data.url);

									console.log(data);
								}
							});
				}

				$('.dropdown-toggle').dropdown();

				$('#write').click(function() {
					/* var res = $('#frame > div > div.note-editing-area > div.note-editable').html(); */

				});

			});
</script>
<style type="text/css">
* {
	margin: 0;
	padding: 0;
}

body {
	font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
	font-size: 14px;
	line-height: 1.42857143;
	color: #333;
	background-color: #ECF6FA;
}
/* #frame {
   width: 800px;
   height: 600px;
} */

/* #frame > div.note-editor.note-frame.panel.panel-default > div.note-editing-area > div.note-editable.panel-body{


width:500px;
height: 300px;

} */
.trip_write {
	border: 1px solid blue;
}

table, tr td {
	border: 2px solid blue;
	border: 0;
}

#tb_title {
	width: 600px;
	border: 2px solid #D8D8D8;
}

#tb_dt_s, #tb_dt_e {
	width: 300px;
	border: 2px solid #D8D8D8;
}

th {
	border: 1px bold red;
	width: 100px;
	font-size: 17px;
	/* text-align: center; */
	padding-top: 10px;
	padding-bottom: 10px;
	margin-right: 20px;
}

.frm {
	width: 1300px;
	overflow-y: auto;
	/* margin-left: 200px; */
	margin-left: 500px;
	margin-top: 100px;
}

#frame>div>div.note-editing-area>div.note-editable {
	width: 900px;
}

#submit {
	margin-left: 450px;
}
/* input[type="file"] {
   display: block;
   margin-top: 680px;
} */
#write_icon {
	font-size: 50px;
	color: red;
}

#write {
	margin-left: 420px;
	width: 100px;
	
	background: #ECF6FA;
}

#ww {
	float: bottom;
	font-size: 20px;
}

body>form>table>tbody>tr:nth-child(4)>th {
	color: deepblue;
}
</style>
</head>
<body>
	<c:choose>
		<c:when test="${not empty sessionScope.id }">
			<form class="frm" name="frm" method="post" action="travel_write.do"
				enctype="multipart/form-data">

				<!-- 	<input type="text" name="value" id="value"> -->
				<table class="trip_write_form">
					<tbody>
						<tr>
							<th>여행 제목 <input type="text" name="tb_title" id="tb_title"
								required="required" /></th>

						</tr>
						<tr>
							<th>여행 기간 <input type="date" id="tb_dt_s" name="tb_dt_s"
								value="" required="required" /> ~ <input type="date"
								id="tb_dt_e" name="tb_dt_e" value="" required="required" /></th>
						</tr>
						<tr>

							<td>
								<div id="frame">


									<textarea id="summernote" name="editordata" required="required"></textarea>
								</div>
							</td>


						</tr>
						<tr>
							<th>썸네일 선택<input type="file" name="tb_img" id="tb_img"
								required="required" /></th>

						</tr>
					</tbody>
				</table>
				<button type="submit" id="write">
				
					<p id="ww">글 등록</p>

				</button>

			</form>
		</c:when>


		<c:otherwise>
			<div id="caution">

				<h1>로그인이 필요한 서비스 입니다.</h1>

			</div>
		</c:otherwise>
	</c:choose>
</body>
</html>