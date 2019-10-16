<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link href="https://fonts.googleapis.com/css?family=Roboto+Mono&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Do+Hyeon|Noto+Sans+KR&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR|Saira+Stencil+One&display=swap" rel="stylesheet">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
   var didScroll;
   // 스크롤시에 사용자가 스크롤했다는 것을 알림
   $(window).scroll(function(event){
      didScroll = true;
      setInterval(function(){
         if(didScroll){
            hasCrolled();
            didScroll = false;
         }
      });
   });
   
   // 스크롤 시에 동작
   function hasCrolled(){
      var height = $(document).scrollTop();
      console.log('스크롤 높이 '+height);
      if(height >=10){
         $('.headerimg').css({
            'display':'block'
         });
      }else{
         $('.headerimg').css({
            'display':'none'
         });
      }
   }
   
});
</script>

<style type="text/css">
@font-face{
font-family:'park';
src:url('/twoteam/fonts/BinggraeTaom-Bold.ttf') format('truetype');
}
*{
   margin:0;
   padding : 0;
   font-family: 'park';
}

body {
	width: 1920px;
	background: #ECF6FA;
}
header{
width:1920px;
height: 74px;
font-size: 15px;
}
header .menubar a {
   color: black;
   padding: 10px;
   font-size:x-large;
}
header .menubar a:hover {
color:#2458FF;
text-decoration:none;
   padding: 10px;
   font-size:x-large;
}
header #btn{
   float: right;
   margin-left: 1200px;
   position:fixed;
   z-index: 6;
   margin-top: 10px;
}
header .btn{
   font-family: 'Roboto Mono', monospace; 
   font-size:medium;
   color:black;
}
header .headerimg{
   width: 100%;
   height: 20px;
   position: fixed;
   z-index: 5;
   display:none;
}

header .menubar{
width:1920px;
   text-align :center;
   font-size:large; 
   float: rigtht;
   background-color: white;
    font-family: 'Do Hyeon', sans-serif;
   font-family: 'Noto Sans KR', sans-serif;
   
}
header div ul li a{
color:black;
}
header.menubar a {
   color: black;
   padding: 10px;
   font-size:x-large; 
}
header.menubar a:hover {
   color: black;
   padding: 10px;
   font-size:x-large;
}
header #menuwrap{
   position:fixed;
   z-index: 6;
}

header .menubar li{
   list-style: none;
   float: left;
}

header ul{
   margin-left : 300px;
   margin-top: 20px;

}
header li>a{
   margin-right: 50px; 
   font-size:  large; 
}
#menuwrap > ul > li:nth-child > a{
   font-weight: lighter;
}

</style>  
</head>


<body>
<header>
   <div class="header" id="myHeader">
         <div class="headerimg">
            <img alt="" src="/twoteam/images/header2.jpg">
         </div>
          <div class="menuwrap" id="menuwrap">   
            <ul class="menubar" >
               <li><a href="travel.do">여행후기</a></li>
               <li><a href="trip2.do">여행 상품</a></li>
               <li><a href="ad.do">광고 문의</a></li>
               <li><a href="qna.do">고객 문의</a></li>
               <c:if test="${not empty sessionScope.id }">
               <li><a href="mypage.do">마이페이지</a></li>
               </c:if>
            </ul>
         </div>   
            <div class="container-fluid">
               <div class="btn" id="btn">
                  <a href="main.do"><button type="button" class="btn btn-link">Home</button></a>
                  <c:choose>
                  <c:when test="${empty sessionScope.id }">
                  <a href="login.do"><button type="button" class="btn btn-link" id="login">Log in</button></a> 
                  <a href="join.do"><button type="button" class="btn btn-link" id="singUp">Sign Up</button></a>
                  </c:when>
                  <c:when test="${not empty sessionScope.id }">
                  <a href="logout.do"><button type="button" class="btn btn-link" id="loginOut">Log Out</button></a> 
                  </c:when>
                  </c:choose>
               </div>
            </div> 
         </div>
         
      </header>
</body>
</html>