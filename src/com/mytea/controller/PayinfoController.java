package com.mytea.controller;

import java.io.IOException;
//import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mytea.dao.MemberDao;
import com.mytea.dto.MemberDto;


/**
 * Servlet implementation class PayinfoController
 */
@WebServlet("/pay/*")
public class PayinfoController extends HttpServlet {
   private static final long serialVersionUID = 1L;

   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      // TODO Auto-generated method stub
      doPost(request, response);
      
   }

   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
     // TODO Auto-generated method stub
     String nextPage = null;
     String action = request.getPathInfo();
      
     request.setCharacterEncoding("utf-8");
     response.setCharacterEncoding("utf-8");
      
     HttpSession session= request.getSession();
     String id =(String) session.getAttribute("id");
      //PrintWriter out = response.getWriter();
      
     MemberDto dto = MemberDao.getInstance().getMember(id);
     
     session.setAttribute("dto", dto);
     
     if(action.equals("/mem")) {
        nextPage="/JaeHee/member_pay_info.jsp";
     }
     else if(action.equals("/nomem")) {
        nextPage="/JaeHee/nonmember_pay_info.jsp";
     }
     else if(action.equals("/payment.do")) {
    	nextPage="/SooYeon/payment.jsp";
     }
     
     //System.out.println(dto.getId());
     
     RequestDispatcher dispatcher = request.getRequestDispatcher(nextPage);
     dispatcher.forward(request, response);
   }
}
