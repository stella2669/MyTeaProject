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
		response.setContentType("text/html;charset=UTF-8"); //자바스크립트 한글깨짐 
		
		String id=request.getParameter("id");
		String pw= request.getParameter("pw");
		HttpSession session = request.getSession(); 
        PrintWriter out = response.getWriter();
		
        MemberDao dao = MemberDao.getInstance();
		int cknum = dao.userCheck(id, pw);
        
		if(id.equals("admin") && pw.equals("admin")) {
			session.setAttribute("id", id);
		//	response.sendRedirect("../EunJi/admin_Insert.jsp");  //이부분 연결이 안됨!!!
			out.print("<script>alert('관리자 페이지로 이동합니다.');</script>");
			out.print("<script> location.href='../EunJi/admin_Insert.jsp'; </script> ");
		} else {
			out.print("<script>alert('아이디와 비밀번호를 확인해주세요.');history.back();</script> ");
		}
		if(cknum == -1) { //회원이 아닐때. 
			out.print("<script>alert('아이디가 존재하지 않습니다.');</script>");
		}
		else if(cknum ==0) { //비번 틀림 
			out.print("<script>alert('비밀번호를 확인해주세요');</script>");
		} 
		else if(cknum == 1) { //로그인 성공  
			MemberDto dto = dao.getMember(id); 
		}
		
		
	}
	

}







