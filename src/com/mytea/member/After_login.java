package com.mytea.member;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

/**
 * Servlet implementation class After_login
 */
@WebServlet("/login")
public class After_login extends HttpServlet {
	private static final long serialVersionUID = 1L;
      

    public After_login() {
        super();
        
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doAction(request,response);
	
	
	}
 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doAction(request,response);

	
	}
	protected void doAction(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
//		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=UTF-8");
		String id=request.getParameter("id");
		String pw= request.getParameter("pw");
		HttpSession session = request.getSession();
        PrintWriter out = response.getWriter();
		
		if(id.equals("admin") && pw.equals("admin")) {
			session.setAttribute("id", id);
			response.sendRedirect("../EunJi/admin_Insert.jsp");
		} else {
			out.print("<script>alert('아이디와 비밀번호를 확인해주세요.');history.back();</script> ");
		}
		
		
		
	}
	

}







