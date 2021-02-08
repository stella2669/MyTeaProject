package com.mytea.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class MemberDao {
	public static final int MEMBER_NONEXISTENT = 0; // 멤버 존재 x
	public static final int MEMBER_EXISTENT = 1; // 멤버 있음
	public static final int MEMBER_JOIN_FAIL = 0; // 회원가입 실패
	public static final int MEMBER_JOIN_SUCCESS = 1; // 가입성공
	public static final int MEMBER_LOGIN_PW_NO_GOOD = 0; // 비번 틀림
	public static final int MEMBER_LOGIN_SUCCESS = 1; // 로그인성공
	public static final int MEMBER_LOGIN_IS_NOT = -1; // 로그인실패
	public static final int LOGIN_ADMIN = 2; // 어드민 로그인

	private static MemberDao instance = new MemberDao();

	public static MemberDao getInstance() {
		return instance;
	}

	public MemberDao() {

	}

	// 커넥션 풀 쓸때 사용.
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

	public int userCheck(String id, String pw) { // 회원 체크
		int result = 0;
		String dbPwd;

		Connection connection = null;
		PreparedStatement pstmt = null;
		ResultSet set = null;
		String query = "select pw from tea_member where id=?";

		try {
			connection = getConnection();
			pstmt = connection.prepareStatement(query);
			pstmt.setString(1, id);
			set = pstmt.executeQuery();

			if (set.next()) {
				dbPwd = set.getString("pw"); // 디비에 pw
				if (dbPwd.equals(pw)) {
					if (id.equals("admin")) {
						result = MemberDao.LOGIN_ADMIN; // 2
					} else {
						result = MemberDao.MEMBER_LOGIN_SUCCESS; // 1
					}
				} else {
					result = MemberDao.MEMBER_LOGIN_PW_NO_GOOD; // 0
				}
			} else {
				result = MemberDao.MEMBER_LOGIN_IS_NOT; // -1
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

		return result;
	}
	
	// id중복체크
		public int confirmId(String id) {
			int ri = 0;

			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet set = null;
			String query = "select id from tea_member where id=?";

			try {
				conn = getConnection();
				pstmt = conn.prepareStatement(query);
				pstmt.setString(1, id);
				set = pstmt.executeQuery(); 
				if (set.next()) {
					ri = MemberDao.MEMBER_EXISTENT; 
				} else {
					ri = MemberDao.MEMBER_NONEXISTENT;
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				try {
					set.close();
					pstmt.close();
					conn.close(); 
				} catch (Exception e2) {
					e2.printStackTrace();
				}
			}

			return ri; 
		}

	// 회원 추가
	public int insertMember(MemberDto dto) {
		int ri = 0;

		Connection conn = null;
		PreparedStatement pstmt = null;
		String query = "insert into tea_member values(?,?,?,?,?,?,?,?,?,?,?,?)";

		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(query);

			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getPw());
			pstmt.setString(3, dto.getName());
			pstmt.setString(4, dto.getBirth());
			pstmt.setString(5, dto.getPhone());
			pstmt.setString(6, dto.getEmail1());
			pstmt.setString(7, dto.getEmail2());
			pstmt.setString(8, dto.getAddress1());
			pstmt.setString(9, dto.getAddress2());
			pstmt.setString(10, dto.getPostcode());

			pstmt.executeUpdate();
			ri = MemberDao.MEMBER_JOIN_SUCCESS; // 1

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null) {
					pstmt.close();
				}
				if (conn != null) {
					conn.close();
				}
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}

		return ri;

	}

	public MemberDto getMember(String id) {

		MemberDto dto = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet set = null;
		String query = "select * from tea_member where id=?";

		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, id);
			set = pstmt.executeQuery();

			if (set.next()) {
				dto = new MemberDto();
				dto.setId(set.getString("id"));
				dto.setPw(set.getString("pw"));
				dto.setName(set.getString("name"));
				dto.setBirth(set.getString("birth"));
				dto.setPhone(set.getString("phone"));
				dto.setEmail1(set.getString("email1"));
				dto.setEmail2(set.getString("email2"));
				dto.setPostcode(set.getString("postcode"));
				dto.setPw(set.getString("pw"));
				dto.setPw(set.getString("pw"));

			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				set.close();
				pstmt.close();
				conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}

		}
		return dto;
	}

	// 멤버 가져올때

}