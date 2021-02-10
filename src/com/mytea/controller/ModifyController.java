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

import com.mytea.dao.ProductDao;
import com.mytea.dto.ProductDto;

/**
 * Servlet implementation class ModifyController
 */
@WebServlet("/modify/*")
public class ModifyController extends HttpServlet {
	private static final long serialVersionUID = 1L;

//	@Override
//	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//
//	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHandle(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHandle(request, response);
	}

	protected void doHandle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String nextPage = null;
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		
		String action = request.getPathInfo();
		
		//어떤 request에서 넘어왔는지 acrtion값 확인
		System.out.println("action: " + action);
		
		ProductDao dao = ProductDao.getInstance();
		
		if(action == null) {
			ArrayList<ProductDto> products = dao.allProductRetrieve();
			HttpSession session = request.getSession();
			
//			String savePath = request.getServletContext().getRealPath("img");
//			
//			session.setAttribute("savePath", savePath);
			request.setAttribute("products", products);
			for(ProductDto dto: products) {
				System.out.println(dto.getName());
			}
			nextPage = "/EunJi/admin_Modify.jsp";
			
		}else if(action.equals("/selected.do")) {
			String _name = (String)request.getParameter("name");
			
			//url통해 넘어온 name값 확인
			System.out.println(_name);
			
			ProductDto dto = dao.findSelected(_name);
			request.setAttribute("dto", dto);
			
			nextPage = "/EunJi/admin_ModifySelected.jsp";
			
		}else if(action.equals("/modifySelected.do")) {
			response.setContentType("text/html; charset=UTF-8");
			
			
			String category = request.getParameter("category");
			String name = request.getParameter("name");
			System.out.println(category);
			System.out.println(name);
			int price = Integer.parseInt(request.getParameter("price"));
			String content = request.getParameter("content");
			
			ProductDto dto = new ProductDto(category, name, price, content);
			
			int result = dao.modifyProduct(dto);
			System.out.println(result);
			PrintWriter out = response.getWriter();
			
			if(result == 1) {
				out.println("<script>alert('메뉴 수정 성공!!');");
				out.println("location.href = '/MyTea/modify';</script>");
			}else {
				out.println("<script>alert('메뉴 수정 실패ㅠ 다시 돌아갈게요ㅜ');location.href='/MyTea/modify'</script>");
			}
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(nextPage);
		dispatcher.forward(request, response);		
	}
	
}
