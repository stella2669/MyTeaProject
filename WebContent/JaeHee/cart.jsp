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
   font-size : 100%;
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

table {
  width: 100%;
  border-top: 1px solid #444444;
  border-collapse: collapse;
  text-align: center;
}

th, td {
  border-bottom: 1px solid #444444;
  padding: 20px;
}

</style>
<script type="text/javascript">
function del() {
  if (confirm("정말 삭제하시겠습니까?") == true){
     document.getElementById('cart').submit();
  }else{
     return;
  }
}

function pay(){
   document.getElementById('cart').submit();
}
</script>
</head>
<body>

   <jsp:include page="../HyoYeon/user_navbar.jsp"></jsp:include>
   <br>
      <form id = "cart" action="${contextPath}/cart/delete.do" method="post">
      <div style="margin: 100px 100px 0px 100px; font-size:25px; ">
         <table>
            <tr>
               <th>선택</th>
               <th>품목</th>
               <th>수량(ea)</th>
               <th>상품가(원)</th>
            </tr>
            <c:forEach var="dto" items="${carts}">
               <tr>
                  <td><input type="checkbox" name="selected" value="${dto.cart_id}"></td>
                  <td>${dto.names}</td>
                  <td>${dto.amount}</td>
                  <td>${dto.totalprice}</td>
               </tr>
         </c:forEach>
         <tr>
            <td colspan="2">예상 결제 금액</td>
            <td colspan="2">${total}</td>
        </tr>
         </table>
      
         <div class="decide">
            <input type="button" class="choose" value="더 추가하기" onclick="location.href='${contextPath}/product'"/> <!-- /pay/add.do -->
            <input type="button" class="choose" value="삭제" onclick="del()"/> <!-- /pay/delete.do -->
         </div> 
         </div>  
      
         <div class="button">   
            <input type="button" class="btn" value="결제하기" onclick="pay()"/> <!-- /pay/member.do -->
            <input type="button" class="btn" value="비회원 결제하기" onclick="pay()"/>
         </div>
       </form>
</body>

</html>