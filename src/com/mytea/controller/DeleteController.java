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

import com.mytea.dao.ProductDao;
import com.mytea.dto.ProductDto;

@WebServlet("/delete/*")
public class DeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHandle(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHandle(request, response);
	}

	protected void doHandle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		String nextPage = "/EunJi/admin_Delete.jsp";
		String nextPage = null;
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		
		String action = request.getPathInfo();
		
		//어떤 request에서 넘어왔는지 action값 확인
		System.out.println("action: " + action);
		
		ProductDao dao = ProductDao.getInstance();
		
		if(action == null) {
			ArrayList<ProductDto> products = dao.allProductRetrieve();
			request.setAttribute("products", products);
			
			nextPage = "/EunJi/admin_Delete.jsp";
			
		}else if(action.equals("/selected.do")) {
			String _name = (String)request.getParameter("name");
			
			//url통해 넘어온 name값 확인
			System.out.println(_name);
			
			ProductDto dto = dao.findSelected(_name);
			request.setAttribute("dto", dto);
			
			nextPage = "/EunJi/admin_DeleteSelected.jsp";
			
		}else if(action.equals("/deleteSelected.do")) {
			response.setContentType("text/html; charset=UTF-8");
			
			String _name = (String)request.getParameter("name");
			ProductDto dto = dao.findSelected(_name);
			
			int result = dao.deleteProduct(dto);
		
			PrintWriter out = response.getWriter();
			
			if(result == 1) {
				out.println("<script>alert('메뉴 삭제 성공!!');location.href='/MyTea/delete';</script>");
			}else {
				out.println("<script>alert('메뉴 삭제 실패ㅠ 다시 돌아갈게요ㅜ');location.href='/MyTea/delete';</script>");
			}
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(nextPage);
		dispatcher.forward(request,  response);
	}
}
