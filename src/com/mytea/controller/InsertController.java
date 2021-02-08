package com.mytea.controller;

import java.io.IOException;
import java.io.PrintWriter;

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

@WebServlet("/insert.do")
public class InsertController extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");

		// 파일이 저장될 서버의 경로. 되도록이면 getRealPath 이용!
		String savePath = request.getServletContext().getRealPath("img");
		
		//파일크기 15MB로 제한
		int sizeLimit = 1024*1024*15;
		
		// request객체					저장될 서버 경로				파일 최대 크기		인코딩 방식			파일명 중복방지처리
		//(HttpServletRequest request, String saveDirectory, int maxPostSize, String encoding, FileRenamePolicy policy)
		MultipartRequest multi = new MultipartRequest(request, savePath, sizeLimit, "utf-8", new DefaultFileRenamePolicy());
		
		//MultipartRequest를 통해 넘어온 입력값들 변수에 저장
		String fileName = multi.getFilesystemName("fileName");
		String fileFullPath = savePath + "/" + fileName;
		String category = multi.getParameter("category");
		String name = multi.getParameter("name");
		int price = Integer.valueOf(multi.getParameter("price"));
		String content = multi.getParameter("content");
		
		ProductDto dto = new ProductDto(fileFullPath,fileName, category, name, price, content);
		
//		dto.setfileFullPath(fileFullPath);
//		dto.setfileName(fileName);
//		dto.setCategory(category);
//		dto.setName(name);
//		dto.setPrice(price);
//		dto.setContent(content);
		
		ProductDao dao = ProductDao.getInstance();
		int result = dao.insertProduct(dto);
		
		PrintWriter out = response.getWriter();
		if(result == 1) {
			out.println("<script>alert('메뉴 추가 성공!!'); location.href='EunJi/admin_Insert.jsp';</script>");
		}else {
			out.println("<script>alert('메뉴 추가 실패ㅠ 다시 돌아갈게요ㅜ'); location.href='EunJi/admin_Insert.jsp';</script>");
			
		}
		
		
		
	}

}
