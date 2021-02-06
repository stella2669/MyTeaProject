package com.mytea.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.mytea.dto.ProductDto;

public class ProductDao {

	private static ProductDao instance = new ProductDao();
	
	public static ProductDao getInstance() {
		return instance;
	}
	
	public Connection getConnection() throws Exception {
		Context context = null;
		DataSource dataSource = null;
		Connection connection = null;
		
		try {
			context = new InitialContext();
			dataSource = (DataSource)context.lookup("java:/comp/env/jdbc/Oracle11g");
			connection = dataSource.getConnection();
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return connection;
	}
	
	// 메뉴 추가
	public int insertProduct(ProductDto dto) {
		int result = -1;
		String query = "insert into product values(?,?,?,?,?,?)";
		Connection connection = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try{
			connection = getConnection();
			pstmt = connection.prepareStatement(query);
			pstmt.setString(1, dto.getProduct_fileFullPath());
			pstmt.setString(2, dto.getProduct_fileName());
			pstmt.setString(3, dto.getCategory());
			pstmt.setString(4, dto.getName());
			pstmt.setInt(5, dto.getPrice());
			pstmt.setString(6, dto.getContent());
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				result = 1;
			}else {
				result = -1;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if (rs != null) {
					rs.close();
				}
				if (pstmt != null) {
					pstmt.close();
				}
				if (connection != null) {
					connection.close();
				}
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		
		return result;
	}
	
	// 전체 메뉴 출력
	public ArrayList<ProductDto> allProductRetrieve(){
		String query = "select * from product";
		ArrayList<ProductDto> products = new ArrayList<ProductDto>();
		Connection connection = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			connection = getConnection();
			pstmt = connection.prepareStatement(query);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				String product_fileFullPath = rs.getString("product_fileFullPath");
				String product_fileName = rs.getString("product_fileName");
				String category = rs.getString("category");
				String name = rs.getString("name");
				int price = rs.getInt("price");
				String content = rs.getString("content");
				
				//product객체 만들어 products 리스트에 하나씩 넣기.
				products.add(new ProductDto(product_fileFullPath,product_fileName, category, name, price, content));
			}	
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if (rs != null) {
					rs.close();
				}
				if (pstmt != null) {
					pstmt.close();
				}
				if (connection != null) {
					connection.close();
				}
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		
		return products;
	}
}
