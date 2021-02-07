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
	private Connection connection = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
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

		
		try{
			connection = getConnection();
			pstmt = connection.prepareStatement(query);
			pstmt.setString(1, dto.getFileFullPath());
			pstmt.setString(2, dto.getFileName());
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
		String query = "select * from product order by name";
		ArrayList<ProductDto> products = new ArrayList<ProductDto>();
		
		
		try {
			connection = getConnection();
			pstmt = connection.prepareStatement(query);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				String fileFullPath = rs.getString("fileFullPath");
				String fileName = rs.getString("fileName");
				String category = rs.getString("category");
				String name = rs.getString("name");
				int price = rs.getInt("price");
				String content = rs.getString("content");
				
				//product객체 만들어 products 리스트에 하나씩 넣기.
				products.add(new ProductDto(fileFullPath,fileName, category, name, price, content));
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
	
//Modify.jsp 페이지의 전체 product목록 중 하나를 선택했을 때 선택한 정보만 출력
	public ProductDto findSelected(String _name) {
		ProductDto dto = null;
		String query = "select * from product where name=?";	
		
		try {
			connection = getConnection();
			pstmt = connection.prepareStatement(query);
			pstmt.setString(1, _name);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				String fileFullPath = rs.getString(1);
				String fileName = rs.getString(2);
				String category = rs.getString(3);
				String name = rs.getString(4);
				int price = rs.getInt(5);
				String content = rs.getString(6);
				
				dto = new ProductDto(fileFullPath, fileName, category, name, price, content);
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
		
		return dto;
	}
	
	public int modifyProduct(ProductDto dto) {
		int result = 0;
		String query = "update product set category=?, price=?, content=? where name=?";

		try{
			connection = getConnection();
			pstmt = connection.prepareStatement(query);
			pstmt.setString(1, dto.getCategory());
			pstmt.setInt(2, dto.getPrice());
			pstmt.setString(3, dto.getContent());
			pstmt.setString(4, dto.getName());
			
			//이부분이 에러가 나는것같다..
			int num = pstmt.executeUpdate();
			
			if(num > 0) {
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
}
