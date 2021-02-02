package com.mytea.controller;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/getImg.do")
public class GetImgController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	
	public void getImg(String product_fileName, HttpServletResponse response) throws ServletException, IOException {
		
		ServletOutputStream imgout = response.getOutputStream();

		response.setContentType("image/jpg");
		ServletOutputStream output = response.getOutputStream();
	
//		String imgpath = 
//		FileInputStream input = new FileInputStream(imgPath);
		int length;
		byte[] buffer = new byte[10];
//		while((length = input.read(buffer)) != -1) {
//			imgout.write(buffer, 0, length);
//		}
	}
}
