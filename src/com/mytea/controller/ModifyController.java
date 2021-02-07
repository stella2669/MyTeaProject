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
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

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
			
			String savePath = request.getServletContext().getRealPath("img");
			
			session.setAttribute("savePath", savePath);
			session.setAttribute("products", products);
			
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

			// 파일이 저장될 서버의 경로. 되도록이면 getRealPath 이용!
			String savePath = request.getServletContext().getRealPath("img");
			
			//파일크기 15MB로 제한
			int sizeLimit = 1024*1024*15;
			
			// request객체					저장될 서버 경로				파일 최대 크기		인코딩 방식			파일명 중복방지처리
			//(HttpServletRequest request, String saveDirectory, int maxPostSize, String encoding, FileRenamePolicy policy)
			MultipartRequest multi = new MultipartRequest(request, savePath, sizeLimit, "utf-8", new DefaultFileRenamePolicy());
			
			//MultipartRequest를 통해 넘어온 입력값들 변수에 저장
			String product_fileName = multi.getFilesystemName("product_fileName");
			String product_fileFullPath = savePath + "/" + product_fileName;
			String category = multi.getParameter("category");
			String name = multi.getParameter("name");
			int price = Integer.valueOf(multi.getParameter("price"));
			String content = multi.getParameter("content");
			
			ProductDto dto = new ProductDto(product_fileFullPath,product_fileName, category, name, price, content);
			
			int result = dao.modifyProduct(dto);
			
			PrintWriter out = response.getWriter();
			
			if(result == 1) {
				out.println("<script>alert('메뉴 수정 성공!!'); location.href='/modify';</script>");
			}else {
				out.println("<script>alert('메뉴 수정 실패ㅠ 다시 돌아갈게요ㅜ'); location.href='/modify';</script>");
			}
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(nextPage);
		dispatcher.forward(request, response);		
	}
	
}
