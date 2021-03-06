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
import com.mytea.dto.MemberDto;

@WebServlet("/update")
public class UpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public UpdateController() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		doAction(request,response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		doAction(request,response);
	}
	private void doAction(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException{

		String nextPage = "HyoYeon/update.jsp";
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=UTF-8"); //자바스크립트 한글깨짐 방지
	    HttpSession session = request.getSession();   //세션에 저장
        PrintWriter out = response.getWriter();    //자바스크립트 쓰려고 사용

        String id =(String) session.getAttribute("id");
        MemberDto dto = MemberDao.getInstance().getMember(id);

        session.setAttribute("dto", dto);
        
        RequestDispatcher dispatcher = request.getRequestDispatcher(nextPage);
		dispatcher.forward(request, response);
	}

	
	
	
}
