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
 * Servlet implementation class ModifyController
 */
@WebServlet("/modify.do")
public class ModifyController extends HttpServlet {
	private static final long serialVersionUID = 1L;

//	@Override
//	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//
//	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ProductDao dao = ProductDao.getInstance();
		ArrayList<ProductDto> products = dao.allProductRetrieve();
		HttpSession session = request.getSession();
		
		String savePath = request.getServletContext().getRealPath("img");
		
		session.setAttribute("savePath", savePath);
		session.setAttribute("products", products);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/EunJi/admin_Modify.jsp");
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
