<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="../css/util.css">
<link rel="stylesheet" type="text/css" href="../css/loginmain.css">
<meta charset="UTF-8">
<title>password check</title>
<style type="text/css">
* {
   padding: 0;
   margin: 0;
}

body>div>div>div>div {
   width: 514px;
   height: 837px;
}

#push {
   border: 1px solid blue;
}

body>div>div>div>form>div.wrap-input100.rs2-wrap-input100.validate-input.m-b-20
   {
   width: 400px;
   height: 50px;
   margin-top: -150px;
   margin-left: 25px;
}

.login100-form-title {
   font-family: Poppins-Regular;
   font-size: 20px;
   color: #555555;
   line-height: 1.2;
   text-transform: uppercase;
   letter-spacing: 2px;
   text-align: center;
   width: 100%;
   height: 100px;
   display: block;
}

.login100-form-btn {
   display: -webkit-box;
   display: -webkit-flex;
   display: -moz-box;
   display: -ms-flexbox;
   display: flex;
   justify-content: center;
   align-items: center;
   padding: 0 20px;
   width: 100%;
   margin-top: -200px;
   height: 50px;
   border-radius: 3px;
   background: #00ad5f;
   font-family: Montserrat-Bold;
   font-size: 12px;
   color: #fff;
   line-height: 1.2;
   text-transform: uppercase;
   letter-spacing: 1px;
   -webkit-transition: all 0.4s;
   -o-transition: all 0.4s;
   -moz-transition: all 0.4s;
   transition: all 0.4s;
}
</style>
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<script type="text/javascript">
   $(document).ready(function() {
      $(".login100-form-btn").on('click', function() {
         var userpw = $('.input100').val();

         $.ajax({
            type : "POST", //전송방식을 지정한다 (POST,GET)
            url : "mypagepw.do", //호출 URL을 설정한다. GET방식일경우 뒤에 파라티터를 붙여서 사용해도된다.
            data : ({
               "pw" : userpw
            }),
            dataType : "json", //호출한 페이지의 형식이다. xml,json,html,text등의 여러 방식을 사용할 수 있다.
            error : function() {
               alert("통신실패!!!!");
            },
            success : function(object) {
               if (object.res == 1) {
                  $("#log").text(" 비밀번호를 확인하세요");
                  $("#log").css("color", "red");
               } else {
                  location.href = "updateForm.do";
               }
            }
         });
      });
   });
</script>

</head>
<body>

   <div class="limiter">
      <div class="container-login100">
         <div class="wrap-login100">
            <form class="login100-form validate-form">
               <span class="login100-form-title p-b-34" id="pc"> Password
                  Check </span>


               <div class="wrap-input100 rs2-wrap-input100 validate-input m-b-20">
                  <input class="input100" type="password" id="check">
               </div>


               <div id="log"></div>
               
               <div class="container-login100-form-btn">
                  <input type="button" class="login100-form-btn" value="sign in"
                     id="push">
               </div>

            </form>


            <div class="login100-more"
               style="background-image: url('../images/trip5.jpg');"></div>
         </div>
      </div>
   </div>




</body>
</html>