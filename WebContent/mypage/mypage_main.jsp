<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="/header/header2.jsp" />
<link href="https://use.fontawesome.com/releases/v5.0.6/css/all.css"
   rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<style type="text/css">

#side{
	margin-top: 50px;
	margin-left: 150px;
	margin-bottom: 20px;
	width: 500px;
	height: 700px;
	float: left;
	text-align: center;
	border-radius: 40px;
	border: 1px solid #E6E6E6;
}

#write{
	width: 1000px;	
	float: right;
	margin-top: 50px;
	margin-right: 100px;
	border-radius: 40px;
	border: 1px solid #E6E6E6;
	text-align: center;
}
#writetable{
	width: 800px;
	margin: auto;
}

#writetable td{
	border: 1px solid #E6E6E6;
	font-size: 20px;
}
#account_wrap{
	width : 300px;
	height: 300px;
	float : left;
	border-radius: 40px;
	border: 1px solid #E6E6E6;
	margin-left : 180px;
	margin-top:50px;
}
#update_icon{
	font-size: 30px;
	color : black;
	
}
#mem_update_frm>button{
	width: 100px;
	height: 100px;
	float: right;
	background: none;
	border : none;
	margin-right: 50px;
}
#acc_submit{
	background: none;
	border : none;
	margin: auto;
	margin-left: 100px;
}
#submit_frm td input{
	background: none;
	border: 0px;
	border-bottom: 1px solid black;
	margin: 10px 0px 10px 10px;
}
#submit_frm td{
	padding : 20px;
}
#hiidden{
	font-size: 15px;
	background: #D358F7;
	margin-left : 100px;
 }
</style>

<script type="text/javascript">
$(document).ready(function() {
	
	$('.up').on('click', function(){
		$('form').attr('action', 'mypagepwcheck.do');
		$('form').submit();
	});
	$('#submit_frm').hide();
	$('#acc_submit').on('click',function(){
		$('#hiidden').html('');
		$('#submit_frm').show();
		
	});
	$('#submit_btn').on('click',function(){
		
		var acc = $('#account').val();
		var bank =$('#bank_name').val();
		
		if(confirm('은행명 :' + $('#bank_name').val() + '계좌번호 : ' + $('#account').val() + ' 맞습니까?')){
			$.ajax({
				url:'accountForm.do',
				type:'POST',
				data : {"acc" : acc , "bank":bank},			    
				success:function(object){
					$('#submit_frm').hide();					
					if(object.res==1){
						$('#hiidden').html('등록에 성공하셨습니다.');
						
					}else{
						$('#hiidden').html('등록에 실패하였습니다.');
					}
				}
			})
			
			
		}

	});
});//end ready

</script>

</head>
<body>
<form >
<div id="form">
	<div id="side">
		<div id="mem_update_frm">
			<button class="up">
			<h5>회원정보수정</h5>
			</button>
		</div>
		<c:choose>
			<c:when test="${empty sessionScope.faceimg }">
				<img src="../images/mypageimg.png" width="400px" height="400px" >
			</c:when>
			<c:otherwise>
				<img src="/twoteam/profiletemp/${sessionScope.faceimg }" width="400px" height="400px" >
			</c:otherwise>
		</c:choose>
		
		<!-- <img src="/twoteam/profiletemp/map_subway.gif" width="400px" height="400px" style="margin-top: 60px"> -->
		<div style="margin-top: 60px; font-size: 30px"><span>'${sessionScope.id}'</span>님 반갑습니다!</div>
		<div style="font-size: 20px; margin-bottom: 50px">'${sessionScope.email}'</div>
	</div>

	<div id="write">
      <div style="font-size: 50px; margin: 20px 0 50px">내가 쓴글</div>
      <table id="writetable">
         <c:forEach items="${requestScope.aList }" var="dto">
            <tr>
               <td>${dto.tb_num }</td>
               <td style="width: 60%">
               <c:url var="cpage" value="travel_view.do">
                  <c:param name="tb_num" value="${dto.tb_num }"/>
                  <c:param name="tb_title" value="${dto.tb_title}"/>
                  <c:param name="editordata" value="${dto.editordata}"/>
                  <c:param name="tb_dt_s" value="${dto.tb_dt_s}"/>
                  <c:param name="tb_dt_e" value="${dto.tb_dt_e }"/>
                  <c:param name="tb_readct" value="${dto.tb_readct }"/>
                  <c:param name="id" value="${dto.id }"/>
               </c:url>
               <%-- <a href="view.do?num=${dto.num }&pageNum=${pdto.currentPage}&searchKey=${pdto.searchKey}&searchWord=${pdto.searchWord}">${dto.subject }</a> --%>
               <a href="${cpage }">${dto.tb_title}</a>
               </td>               
               <td>${dto.tb_dt }</td>
               <td>${dto.tb_readct }</td>
            </tr>
         </c:forEach>
      </table>
   </div>
	
</div>
</form>

	<div id="account_wrap">
	
		<button id="acc_submit">
			<h4>계좌 등록하기</h4>
		</button>

		<!-- 등록 폼 -->
			
		<form method="post" action="accountForm.do" id="acc-frm">
		<div ><span id="hiidden"></span></div>
			<table id="submit_frm">
				<tr>
					<td>은&nbsp;행&nbsp;명&nbsp;</td>
					<td><input type="text" id="bank_name" name="bank_name" required="required"/></td>
				</tr>
				<tr>
					<td>계좌번호</td>
					<td><input type="text" id="account" name="account" required="required"/></td>
				</tr>
				<tr>
					<td><input type="button" value="등록" id="submit_btn" /></td>
				</tr>
			</table>
		</form>
		
	</div>
</body>
</html>