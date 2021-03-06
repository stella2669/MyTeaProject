package com.mytea.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mytea.dao.MemberDao;
import com.mytea.dao.ProductDao;
import com.mytea.dto.MemberDto;
import com.oracle.jrockit.jfr.RequestDelegate;

@WebServlet("/join/*")
public class JoinController extends HttpServlet {
   private static final long serialVersionUID = 1L;

   public JoinController() {
      super();

   }

   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      doHandle(request, response);
   }

   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      doHandle(request, response);
   }

   protected void doHandle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//      String nextPage = "/EunJi/admin_Delete.jsp";
      String nextPage = null;
      request.setCharacterEncoding("utf-8");
      response.setContentType("text/html;charset=utf-8");
      
      String action = request.getPathInfo();
      
      //어떤 request에서 넘어왔는지 action값 확인
      System.out.println("action: " + action);
      
      MemberDao dao = MemberDao.getInstance();
      //회원가입 할 때의 작동
      
      
      if(action == null) {
      // 값 불러와서 객체에 저장
      String id = request.getParameter("id");
      String pw = request.getParameter("pw");
      String name = request.getParameter("name");
      String birth = request.getParameter("birth");
      String phone = request.getParameter("phone");
      String email1 = request.getParameter("email1");
      String email2 = request.getParameter("email2");
      String address1 = request.getParameter("address1");
      String address2 = request.getParameter("address2");
      String postcode = request.getParameter("postcode");

      // 세션 객체 생성
      HttpSession session = request.getSession();
      PrintWriter out = response.getWriter();

      MemberDto dto = new MemberDto();
      dto.setId(id);
      dto.setPw(pw);
      dto.setName(name);
      dto.setBirth(birth);
      dto.setPhone(phone);
      dto.setEmail1(email1);
      dto.setEmail2(email2);
      dto.setAddress1(address1);
      dto.setAddress2(address2);
      dto.setPostcode(postcode);

      // 무슨 일을 하는 부분..?
      // dao의 insert 부르기?
  
      // dao에 dto요소를 전부 db에 insert하기
      int result = dao.insertMember(dto);

      if (result == 1) {
         out.print("<script>alert('회원가입을 축하합니다.');location.href='HyoYeon/login.jsp'</script>");
      } else {
         out.print("<script>alert('회원가입에 실패했습니다.');location.href='HyoYeon/login.jsp'</script>");
      }
//id중복체크 ???
      int result2 = dao.confirmId(id);

      if (result2 == 1) {
         out.print("<script>alert('아이디가 존재합니다.');location.href='HyoYeon/login.jsp'</script>");
      } else {
         out.print("<script>alert('사용가능한 아이디입니다.');location.href='HyoYeon/login.jsp'</script>");
      }
      /*
       * RequestDispatcher dispatcher =
       * request.getRequestDispatcher("HyoYeon/login.jsp");
       * dispatcher.forward(request, response); // 수정 후 삭제 : 회원가입 후 넘길 정보 없음 굳이 사용x.
       * location.href로 바로 페이지 이동
       */
      System.out.println();

   }

   }
   }