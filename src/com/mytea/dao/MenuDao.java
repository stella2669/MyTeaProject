package com.mytea.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.mytea.dto.MenuDto;

public class MenuDao {

	private static MenuDao instance = new MenuDao();
	
	public static MenuDao getInstance() {
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
	public int insertMenu(MenuDto dto) {
		int result = -1;
		String query = "insert into menu values(?,?,?,?,?,?)";
		ResultSet rs = null;
		
		try{
			Connection connection = getConnection();
			PreparedStatement pstmt = connection.prepareStatement(query);
			pstmt.setString(1, dto.getMenu_fileFullPath());
			pstmt.setString(2, dto.getMenu_fileName());
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
		}
		
		return result;
	}
}
