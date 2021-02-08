package com.mytea.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mytea.pay.PayinformationDao;

/**
 * Servlet implementation class PayinfoController
 */
@WebServlet("/payinfo.do")
public class PayinfoController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		String id = request.getParameter("id");
		PrintWriter out = response.getWriter();
		PayinformationDao dao = PayinformationDao.getInstance();
		int result = dao.confirmId(id);
		
		if(result == 1){
			dao.getinfo(id);
			out.print("<script>location.href='/MyTea/JaeHee/member_pay_info.jsp';</script>");
		}
		
		if(result == 0){
			out.print("<script>location.href='/MyTea/JaeHee/nonmember_pay_info.jsp';</script>");
		}
		
		else {
			out.print("<script>location.href='/MyTea/EunJi/productList.jsp';</script>");
		}
	}
}


