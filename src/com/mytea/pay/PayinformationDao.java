package com.mytea.pay;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class PayinformationDao {
	
	private static PayinformationDao payInstance = new PayinformationDao();
	
	private PayinformationDao() {
		
	}
	
	public static PayinformationDao getInstance() {
		return payInstance;
	}
	
	public int confirmId(String id) {
		int result=0;
		
		Connection connection = getConnection();
		PreparedStatement pstmt = null;
		ResultSet set = null;
		String query = "select id from tea_member where id=?";
		
		try {
			pstmt = connection.prepareStatement(query);
			pstmt.setString(1, id);
			set = pstmt.executeQuery();
			
			if(set.next()) {
				result = 1;
			}
			else {
				result = 0;
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
			set.close();
			pstmt.close();
			connection.close();
		} catch (Exception e) {
			e.printStackTrace();
			}
		}
		return result;
	}
	
	public PayinformationDto getinfo(String id) {
		
		Connection connection = getConnection();
		ResultSet rs = null;
		String query = "select name,phone,post,address from tea_member where id=?";
		Statement stmt = null;
		PayinformationDto dto = null;
		
		try {
			stmt = connection.createStatement();
			rs = stmt.executeQuery(query);
			
			if(rs.next()) {
				dto = new PayinformationDto();
				dto.setName(rs.getString("name"));
				dto.setName(rs.getString("phone"));
				dto.setName(rs.getString("post"));
				dto.setName(rs.getString("address"));
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
			rs.close();
			stmt.close();
			connection.close();
		} catch(Exception e) {
			e.printStackTrace();
		 }
		}
		
		return dto;
	}
	
	private Connection getConnection() {
	      Connection connection = null;
	      try {
	         Context context = new InitialContext();
	         DataSource dataSource = (DataSource) context.lookup("java:comp/env/jdbc/Oracle11g");
	         connection = dataSource.getConnection();
	      } catch (Exception e) {
	         e.printStackTrace();
	      }
	      return connection;
	   }

}
