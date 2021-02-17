package com.mytea.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mytea.dao.CartDao;
import com.mytea.dao.ProductDao;
import com.mytea.dto.CartDto;
import com.mytea.dto.ProductDto;

@WebServlet("/cart/*")
public class CartController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHandle(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHandle(request, response);
	}

	protected void doHandle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String nextPage = null;
		HttpSession session = request.getSession(); 
		
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		
		String action = request.getPathInfo();
		
		//어떤 request에서 넘어왔는지 acrtion값 확인
		System.out.println("action: " + action);
		
		ProductDao productDao = ProductDao.getInstance();
		CartDao cartDao = CartDao.getInstance();
		
		if(action==null) { //navi에서 장바구니 클릭 시 
			
			//로그인된 id값에 해당되는 cart table의 목록 가져와서 출력시키기.
			ArrayList<CartDto> carts = cartDao.allCartRetrieve();
			request.setAttribute("carts", carts);
			
			nextPage = "/JaeHee/cart.jsp";
			
		}else if(action.equals("/addCart.do")){ // cart로 보내기 전 productList.jsp에서 체크된 product들을 session에 저장시켜 cartController로 보내기.
			//form태그를 통해 넘어온 값들을 products안에 저장하고 id, amount, totalprice, products를 request.setAttribute("item",products)로 저장해서 dispatcher로 /cart로 이동 cart테이블에 저장시켜야함(/cart 서블릿으로 넘겨서 insert)
			ArrayList<ProductDto> item = new ArrayList<ProductDto>();
			int perprice = 0;
			
			String[] products = request.getParameterValues("product");
			
			String id = (String)session.getAttribute("id");
			String names = Arrays.toString(products);
			for(String name: products) {
				ProductDto dto = productDao.getProduct(name);
				item.add(dto);
				perprice += dto.getPrice();
			}
			int amount = Integer.valueOf(request.getParameter("amount"));
			int totalprice = perprice * amount;
			
			CartDto cartDto = new CartDto(id, names, perprice, amount, totalprice);
			cartDao.insertCart(cartDto);
			
			ArrayList<CartDto> carts = cartDao.allCartRetrieve();
			request.setAttribute("carts", carts);
//			request.setAttribute("cartDto", cartDto);
			
			nextPage = "/JaeHee/cart.jsp";
			
		}else if(action.equals("/delete.do")) {
			
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(nextPage);
		dispatcher.forward(request, response);
	}
}
