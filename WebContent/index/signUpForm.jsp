<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Font Icon -->
<link rel="stylesheet"
   href="../fonts/material-icon/css/material-design-iconic-font.min.css">

<!-- Main css -->
<link rel="stylesheet" href="../css/style.css">
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
   $(document).ready(function() {
      $('input[type=submit]').click(function(){
           
         var idReg = /^[A-za-z0-9]{5,13}$/g;
         var pwReg = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{6,13}$/;
         var regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
         if($('#id').val()==""){
            alert("아이디를 입력해주세요");
            return false;
         }
         else if ($('#id').val().length<6 || $('#id').val().length>13){
            alert("아이디는 6자에서 12자 사이로 입력해주세요");
            return false;
         }
         else if(!(idReg.test($('#id').val()))){
            alert("아이디는 영문 및 숫자만 됩니다.");
            return false;
         }
         else if($('#name').val()==""){
            alert("이름 입력해라");
            return false;
         }
         //이메일 =================================================
         else if($('#email').val()==""){
            alert("이메일을 입력해주세요");
            return false;
         }
         else if(!(regExp.test($('#email').val()))){
            alert("이메일 형식이 아니에요 ");
            return false;
         }
         ///// 비번 부분=======================================
         else if($('#pass').val()==""){
            alert("비밀번호를 입력해주세요");
            return false;
         }
         else if($('#pass').val()!=$('#re_pass').val()){
            alert("입력한 비밀번호가 동일하지 않습니다. ");
            return false;
         }
         else if($('#pass').val().length<6 || $('#pass').val().length>13){
            alert("비밀번호는 6자 이상 12자 이하로 작성해주세요 ");
            return false;
         
         }
         
         return true;
      });
      $("#id").blur(function() {
         var userid = $('#id').val();
         if (!(userid == "")) {
            $.ajax({
               url:'idchk.do?userid='+userid,
               type:'GET',
                dataType : "json",
               success:function(object){
                  console.log("1중복 0중복아님"+object.res);
                  if(object.res==1){
                     $("#id_check").text("사용중인 아이디입니다");
                     $("#id_check").css("color", "red");
                     $("#signup").attr("disabled", true);
                  }else{
                     $("#id_check").text("사용가능한 아이디입니다.");
                     $("#id_check").css("color", "blue");
                  }
               }
            })
         }
      })
   })
</script>
</head>
<body>
   <div class="main">

      <!-- Sign up form -->
      <section class="signup">
         <div class="container">
            <div class="signup-content">
               <div class="signup-form">
                  <h2 class="form-title">Sign up</h2>
                  <form method="POST" class="register-form" id="register-form"
                     action="insert.do">
                     <div class="form-group">
                        <label for="id"><i
                           class="zmdi zmdi-account material-icons-name"></i></label> <input
                           type="text" name="id" id="id" placeholder="Your Id" />
                        <div id="id_check"></div>
                     </div>
                     <div class="form-group">
                        <label for="name"><i
                           class="zmdi zmdi-account material-icons-name"></i></label> <input
                           type="text" name="name" id="name" placeholder="Your Name" />
                     </div>
                     <div class="form-group" style="width: 50px; float: left;">
                        <label for="gender">남</label> <input type="radio" name="gender"
                           id="gender" value="0" style="width: 55px;" checked="checked" />
                     </div>
                     <div class="form-group" style="width: 50px;">
                        <label for="gender">여</label> <input type="radio" name="gender"
                           id="gender" value="1" style="width: 55px;" />
                     </div>
                     <div class="form-group">
                        <label for="email"><i class="zmdi zmdi-email"></i></label> <input
                           type="email" name="email" id="email" placeholder="Your Email" />
                     </div>
                     <div class="form-group">
                        <label for="pass"><i class="zmdi zmdi-lock"></i></label> <input
                           type="password" name="pw" id="pass" placeholder="Password" />
                     </div>
                     <div class="form-group">
                        <label for="re-pass"><i class="zmdi zmdi-lock-outline"></i></label>
                        <input type="password" name="re_pass" id="re_pass"
                           placeholder="Repeat your password" />
                     </div>
                  
                     <div class="form-group form-button">
                        <input type="submit" name="signup" id="signup"
                           class="form-submit" value="Register" />
                     </div>
                  </form>
               </div>
               <div class="signup-image">
                  <figure>
                     <img src="../images/trip5.jpg" alt="sing up image">
                  </figure>
                  <a href="login.do" class="signup-image-link">I am already member</a>
               </div>
            </div>
         </div>
      </section>


   </div>

   <!-- JS -->
   <script src="../vendor/jquery/jquery.min.js"></script>
   <script src="../js/main.js"></script>
</body>
</html>