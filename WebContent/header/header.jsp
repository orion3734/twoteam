<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>together</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 자동으로 모바일 조정  -->
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
   src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<style type="text/css">
@font-face{
font-family:'park';
src:url('../fonts/BinggraeTaom-Bold.ttf') format('truetype');
}
* {
   margin: 0;
   padding: 0;
   font-family: 'park';
}
body{
width:1920px;
}
.navbar navbar-default {
   position: relative;
}

.btnbtn-defaultnavbar-btn {
   height: 32px;
   width: 64.9px;
   position: absolute;
   right: 20px;
   top : 20px;   
}

.container-fluid {
  
   height: 130px;
}

.breadcrumb a {
   
   COLOR: #000407;
   text-decoration: NONE;
   /* font-weight :bolder; */
   font-size: 30px;
   margin-left: 150px;
   
}

.breadcrumb a:hover {
   color: #316A7A;
   text-decoration: underline;
}

.form-group {
   position: absolute;
   top: 60px;
   right: 20px;
}

.breadcrumb {
   background-color: #D5EDF6;
}

.container-fluid {
   background-color: #EFF8FB;
}
</style>
<script type="text/javascript">
$(document).ready(function(){
	$(".btnbtn-defaultnavbar-btn").click(function(){
		location.href="login.do"
	})
})
</script>
</head>
<body>
   <!-- 로고  -->
   <nav class="menu">
      <div class="container-fluid">
         <div class="navbar-header">
            <a class="navbar-brand" href="#"> <!--로고 이미지 넣는자리 id=logo-->
            </a>
            <button type="button" class="btnbtn-defaultnavbar-btn">Sign In</button>
         </div>
           <form class="navbar-form navbar-left" role="search">

         <div class="form-group">
            <input type="text" class="form-control" placeholder="Search">
            <button type="submit" class="btn btn-default">Submit</button>
            <button type="button" class="btn btn-default navbar-btn">Sign In</button>
            

         </div>

      </form>
      </div>
      <ol class="breadcrumb">
         <li><a href="#">나의 여행기</a></li>
         <li><a href="#">여행 상품?여행꿀팁?</a></li>
         <li><a href="#">광고 문의</a></li>
         <li><a href="#">고객 문의</a></li>
         <li><a href="#">마이페이지</a></li>

      </ol>
      <!-- 상단 버튼-->
    
   </nav>
</body>
</html>