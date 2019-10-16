<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html><jsp:include page="/header/header2.jsp" />
<head>

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
<script type="text/javascript">
	$(document)
			.ready(
					function() {
						$('#summernote').summernote(
								{
									height : 600,
									fontNames : [ '맑은고딕', 'Arial',
											'Arial Black', 'Comic Sans MS',
											'Courier New', ],
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
							$.ajax({ // ajax를 통해 파일 업로드 처리
								data : data,
								type : "POST",
								url : "../travel/travel_write_back.jsp",
								cache : false,
								contentType : false,
								processData : false,
								success : function(data) { // 처리가 성공할 경우
									// 에디터에 이미지 출력
									$(editor).summernote('editor.insertImage',
											data.url);
								}
							});
						}
						;
						$('.dropdown-toggle').dropdown()

						$('#submit')
								.click(
										function() {
											var res = $(
													'#frame > div > div.note-editing-area > div.note-editable')
													.html();

										});

						$("#tb_title").attr("disabled", false).attr("readonly",
								false);

					});
</script>
</head>
<style type="text/css">
* {
	margin: 0;
	padding: 0;
}

/* #frame {
   width: 800px;
   height: 600px;
} */

/* #frame > div.note-editor.note-frame.panel.panel-default > div.note-editing-area > div.note-editable.panel-body{


width:500px;
height: 300px;

} */
/* #summernote {
	height: 800px;
	width: 600px;
} */
.frm {
	width: 1300px;
	overflow-y: auto;
	/* margin-left: 200px; */
	margin-left: 500px;
	margin-top: 100px;
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

#frame>div>div.note-editing-area>div.note-editable {
	width: 900px;
}
</style>

<body>



	<form class="frm" name="frm" action="travel_updatePro.do" method="post">

		<input type="hidden" name="pageNum" value="${param.pageNum}" /> <input
			type="hidden" name="tb_num" value="${tdto.tb_num}" /> <br> <br>
		<br> <br> <br>
		<table class="trip_write_form">
			<tbody>
				<tr>
					<th>여행 제목 <input type="text" name="tb_title" id="tb_title"
						value="${tdto.tb_title}"/></th>

				</tr>
				<tr>
					<th>여행 기간 <input type="date" id="tb_dt_s" name="tb_dt_s"
						value="${tdto.tb_dt_s}" /> ~ <input type="date" id="tb_dt_e"
						name="tb_dt_e" value="${tdto.tb_dt_e}" /></th>
				</tr>
				<tr>

					<td>
						<div id="frame">


							<textarea id="summernote" name="editordata">
							${tdto.editordata}
							</textarea>
						</div>
					</td>


				</tr>
				<tr>
					<td><input type="file" name="tb_img" id="tb_img"
						value="${tdto.tb_img}" /></td>
				</tr>
			</tbody>
		</table>
		<input type="submit" value="수정" id="btnUpdate" />&nbsp;&nbsp;

	</form>
</body>
</html>