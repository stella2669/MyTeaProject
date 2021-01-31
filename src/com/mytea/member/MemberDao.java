package com.mytea.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class MemberDao {
	public static final int MEMBER_NONEXISTENT = 0;
	public static final int MEMBER_EXISTENT = 1;
	public static final int MEMBER_JOIN_FAIL = 0;
	public static final int MEMBER_JOIN_SUCCESS = 1;
	public static final int MEMBER_LOGIN_PW_NO_GOOD = 0;
	public static final int MEMBER_LOGIN_SUCCESS = 1;
	public static final int MEMBER_LOGIN_IS_NOT = -1;
	public static final int MEMBER_LOGIN_ADMIN = 2;

	private static MemberDao instance = new MemberDao();

	public static MemberDao getInstance() {
		return instance;
	}

	public MemberDao() {

	}


	public int userCheck(String id, String pwd) {
		int ri = 0;
		String dbPwd;

		Connection connection = null;
		PreparedStatement pstmt = null;
		ResultSet set = null;
		String query = "select pwd from user_member where id=?";

		try {
			connection = getConnection();
			pstmt = connection.prepareStatement(query);
			pstmt.setString(1, id);
			set = pstmt.executeQuery();
			
			if (set.next()) { 
				dbPwd = set.getString("pwd");
				if (dbPwd.equals(pwd)) { 
					if(id.equals("admin")) {
						ri = MemberDao.MEMBER_LOGIN_ADMIN; //2
					}else {
						ri = MemberDao.MEMBER_LOGIN_SUCCESS; // 1
					}
				} else {
					ri = MemberDao.MEMBER_LOGIN_PW_NO_GOOD; // 0
				}
			} else {
				ri = MemberDao.MEMBER_LOGIN_IS_NOT; 
			}	
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (set != null) {
					set.close();
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

		return ri;
	}


	//이건 왜 필요해??
	private Connection getConnection() {
		Context context = null;
		DataSource dataSource = null;
		Connection connection = null;

		try {
			context = new InitialContext();
			dataSource = (DataSource) context.lookup("java:comp/env/jdbc/Oracle11g");
			connection = dataSource.getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return connection;
	}
}
