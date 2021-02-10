package com.mytea.controller;

import java.io.IOException;
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
 * Servlet implementation class ProductController
 */
@WebServlet("/product/*")
public class ProductController extends HttpServlet {
	private static final long serialVersionUID = 1L;

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
		
		//MainTea.jsp에서 만들러가기 눌렀을 때
		if(action == null) {
			ArrayList<ProductDto> products = dao.allProductRetrieve();
			HttpSession session = request.getSession();
			
//			String savePath = request.getServletContext().getRealPath("img");
			
//			for(ProductDto dto : products) {
//				System.out.println(dto.getName());
//			}
			
//			session.setAttribute("savePath", savePath);
			request.setAttribute("products", products);
			
			nextPage = "/EunJi/productList.jsp";
			
		}
		
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(nextPage);
		dispatcher.forward(request, response);
	}
}
