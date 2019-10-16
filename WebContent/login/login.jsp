<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet" type="text/css" href="../css/util.css">
<link rel="stylesheet" type="text/css" href="../css/loginmain.css">
<meta charset="UTF-8">
<title>Insert title here</title>

<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$('#inbtn').click(function(){
		var userid=$('#first-name').val();
		var userpw=$('#pw').val();
		$.ajax({
			url:'loginaction.do',
			type:'post',
			data:({"id":userid,"pw":userpw}),
		    dataType : "json",
			success:function(object){
				if(object.res==1){
					$("#log").text("아이디와 비밀번호를 확인하세요");
					$("#log").css("color", "red");
				}else{
					location.href="main.do";
				}
			}
		})
	});
})
function loginok(){
	
} 
</script>
</head>
<body>

   <div class="limiter">
      <div class="container-login100">
         <div class="wrap-login100">
            <form class="login100-form validate-form" action="loginaction.do" method="post"
            >
               <span class="login100-form-title p-b-34" id="log"> Account Login </span>

               <div class="wrap-input100 rs1-wrap-input100 validate-input m-b-20"
                  data-validate="Type user name">
                  <input id="first-name" class="input100" type="text"
                     name="id" placeholder="User id"> <span
                     class="focus-input100"></span>
               </div>
               <div class="wrap-input100 rs2-wrap-input100 validate-input m-b-20"
                  data-validate="Type password">
                  <input class="input100" type="password" name="pw" id="pw"
                     placeholder="Password"> <span class="focus-input100"></span>
               </div>

               <div class="container-login100-form-btn">
                  <input type="button" class="login100-form-btn" value="sign in"
                     id="inbtn">
               </div>

               <div class="w-full text-center p-t-27 p-b-239">
                  <span class="txt1"> Forgot </span> <a href="#" class="txt2">
                     User name / password? </a>
               </div>
               <div class="w-full text-center">
                  <a href="join.do" class="txt3"> Sign Up </a>
               </div>
			</form>
		

            <div class="login100-more"
               style="background-image: url('../images/trip5.jpg');"></div>
         </div>
      </div>
   </div>



   <div id="dropDownSelect1"></div>

</body>
</html>