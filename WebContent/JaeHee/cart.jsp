<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>cart</title>
<style>
@font-face {
   font-family: HoonSinamonR;
   src: url("../font/HoonSinamonR.ttf"); 
}

* {
   font-family: HoonSinamonR;
}

.information{
   weight : 100%;
   height : 400px;
   margin : 100px;
}

form{
   display : inline;
}

.button{
   width : 100%;
   height : 100px;
   text-align : center;
}

.decide{
   width : 75%;
   height : 180px;
   text-align : right;
}

.btn{
   width : 300px;
   height: 100px;
   font-size : 200%;
   padding: 20px 20px;
   border-radius: 10px;
   background-color: #689f38;
}

.choose{
   width : 200px;
   height: 70px;
   font-size : 200%;
   padding: 20px 20px;
   border-radius: 10px;
   background-color: #689f38;
   
}

.tea{
   width : 300px;
   height: 300px;
   display: inline-block;
   margin: 100px;

}

img.tea_img{

   width: 450px;
   height: 450px;
   float : left;
   margin-top : 0px;
   margin-right : 30px;
   margin-bottom : 30px;
   margin-left : 200px;
}

img{
   border-radius : 20px;
   width: 150px;
   height: 130px;
}

p{
   margin : 200px;
   font-size: 25px;
   text-align : center;
}
</style>
</head>
<body>

   <jsp:include page="../HyoYeon/user_navbar.jsp"></jsp:include>
   <br>
      <form action="${contextPath}/cart/delete.do" method="post">
         <div class="information">
<!--             <img class="tea_img" src="../img/default.png"/> -->
            
<!-- 				<p> -->
<%-- 				<c:forEach var="name" items="${products}"> --%>
<%-- 					${name} --%>
<%-- 				</c:forEach> --%>
<!-- 				</p> -->
            
<%-- 			<c:forEach var=""> --%>
            </div>
            <br>
         <div class="decide">
            <input type="button" class="choose" value="더 추가하기" onclick="history.back();"/> <!-- /pay/add.do -->
            <input type="submit" class="choose" value="삭제"/> <!-- /pay/delete.do -->
         </div>   
      </form>
         
         <div class="button">   
            <form action="${contextPath}/pay/mem" method="post">
            <button type="submit" class="btn">결제하기</button> <!-- /pay/member.do -->
            </form>
            
            <form action="${contextPath}/pay/nomem" method="post">
            <button type="submit" class="btn">비회원 결제하기</button> 
            </form>
         </div>
</body>