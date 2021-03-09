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

@WebServlet("/updateOk")
public class UpdateOkController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public UpdateOkController() {
		super();
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doAction(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doAction(request, response);
	}
	private void doAction(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String nextPage = "HyoYeon/update.jsp";
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=UTF-8"); // 자바스크립트 한글깨짐 방지
		HttpSession session = request.getSession(); // 세션에 저장
		PrintWriter out = response.getWriter(); // 자바스크립트 쓰려고 사용

		MemberDto dto = new MemberDto();
		dto.setId(request.getParameter("id"));
		dto.setPw(request.getParameter("pw"));
		dto.setName(request.getParameter("name"));
		dto.setBirth(request.getParameter("birth"));
		dto.setPhone(request.getParameter("phone"));
		dto.setEmail1(request.getParameter("email1"));
		dto.setEmail2(request.getParameter("email2"));
		dto.setPostcode(request.getParameter("postcode"));
		dto.setAddress1(request.getParameter("address1"));
		dto.setAddress2(request.getParameter("address2"));
		
		int a = MemberDao.getInstance().updateMember(dto);
		if (a == 1) {
			System.out.println("수정성공");
		}
		out.print("<script>alert('회원정보 수정 완료!!');location.href='HyoYeon/login.jsp'</script>");
		session.setAttribute("dto", dto);
		RequestDispatcher dispatcher = request.getRequestDispatcher(nextPage);
		dispatcher.forward(request, response);

	}

}
