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
import com.mytea.member.MemberDto;

@WebServlet("/Join.do")
public class JoinController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public JoinController() {
        super();
        
    }

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		actionDo(request,response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		actionDo(request,response);
		
		
	}
	// actionDo메소드의 역할?
	protected void actionDo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html); charset=utf-8");
		
		//값 불러와서 객체에 저장
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
		
		//세션 객체 생성
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
		//dao의 insert 부르기?
		MemberDao dao = MemberDao.getInstance();
		//dao에 dto요소를 전부 db에 insert하기
		int result = dao.insertMember(dto);
		
		if(result == 1) {
			//아까 만들어 둔 id를 세션에 저장
			session.setAttribute("id", dto.getId());
			request.setAttribute("msg", "회원가입에 성공했습니다.");
		} else {
			request.setAttribute("msg", "회원가입에 실패했습니다.");
		}
		
		request.getRequestDispatcher("HyoYeon/login.jsp").forward(request, response);
		
		System.out.println();
		
	}

}
