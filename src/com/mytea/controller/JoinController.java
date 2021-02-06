package com.mytea.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mytea.member.MemberDao;

@WebServlet("/Join.do")
public class JoinController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public JoinController() {
        super();
        
    }

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doAction(request,response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doAction(request,response);
		
		
	}
	// doAction메소드의 역할?
	protected void doAction(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html); charset=utf-8");
		
		//값 불러오기?
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
		
		//세션에 저장하기?
		HttpSession session = request.getSession();
		PrintWriter out = response.getWriter();
		
		// 무슨 일을 하는 부분..? + 오류
		MemberDao dao = MemberDao.getInstance();
		int insertMember = dao.insertMember(id,pw,name,birth,phone,email1,email2,address1,address2,postcode);
		
		System.out.println();
		
	}

}
