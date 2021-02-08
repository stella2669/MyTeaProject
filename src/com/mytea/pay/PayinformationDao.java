package com.mytea.pay;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.mytea.member.MemberDao;

public class PayinformationDao {
	public static final int MEMBER_NONEXISTENT = 0; 
	public static final int MEMBER_EXISTENT = 1; 
	
	private static PayinformationDao payInstance = new PayinformationDao();
	
	private PayinformationDao() {
		
	}
	
	public static PayinformationDao getInstance() {
		return payInstance;
	}
	
	public int confirmId(String id) {
		int result=0;
		
		Connection connection = null;
		PreparedStatement pstmt = null;
		ResultSet set = null;
		String query = "select id from tea_member where id=?";
		
		try {
			connection = getConnection();
			pstmt = connection.prepareStatement(query);
			pstmt.setString(1, id);
			set = pstmt.executeQuery();
			
			if(set.next()) {
				result = MemberDao.MEMBER_EXISTENT;
			}
			else {
				result = MemberDao.MEMBER_NONEXISTENT;
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
			set.close();
			pstmt.close();
			connection.close();
		} catch (Exception e2) {
			e2.printStackTrace();
			}
		}
		return result;
	}
	
	public PayinformationDto getinfo(String id) {
		
		Connection connection = getConnection();
		ResultSet rs = null;
		String query = "select name,phone,post,address from tea_member where id=?";
		PreparedStatement pstmt = null;
		PayinformationDto dto = null;
		
		try {
			pstmt = connection.prepareStatement(query);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery(query);
			
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
			pstmt.close();
			connection.close();
		} catch(Exception e2) {
			e2.printStackTrace();
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
