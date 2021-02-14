package com.mytea.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.mytea.dao.MemberDao;
import com.mytea.dto.MemberDto;

/**
 * Servlet implementation class update
 */
@WebServlet("/update")
public class UpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doAction(request,response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doAction(request,response);
	}

	private void doAction(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=UTF-8"); //자바스크립트 한글깨짐 

		MemberDao dao = MemberDao.getInstance();
		
		/*
		 * MemberDto dto= new MemberDto(); 
		 * MemberDto dto = dao.updateMember(dto);
		 */
//		String id=(String)session.getAttribute("id"); 
//		MemberDao dao = MemberDao.getInstance();
//		
//		int ri= dao.updateMember(dto);  
		
		
	}

	
	
	
}
