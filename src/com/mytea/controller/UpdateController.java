package com.mytea.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

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

		String nextPage = null;
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=UTF-8"); //자바스크립트 한글깨짐 
		
		
        MemberDao dao = MemberDao.getInstance();
        MemberDto dto = new MemberDto();
        PrintWriter out = response.getWriter();    //자바스크립트 쓰려고 

//        int ri= dao.updateMember(dto);
        
//        request.setAttribute("name", dto.getName());
//        request.setAttribute("birth", dto.getBirth());
//        request.setAttribute("phone", dto.getPhone());
//        request.setAttribute("email1", dto.getEmail1());
//        request.setAttribute("email2", dto.getEmail2());
//        request.setAttribute("postcode", dto.getPostcode());
        
        
        HttpSession session = request.getSession();   //세션에 저장
        
        
        RequestDispatcher dispatcher = request.getRequestDispatcher(nextPage);
		dispatcher.forward(request, response);
		
	}

	
	
	
}
