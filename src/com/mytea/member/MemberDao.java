package com.mytea.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class MemberDao {
	public static final int MEMBER_NONEXISTENT = 0;  //멤버 존재 x
	public static final int MEMBER_EXISTENT = 1;	//멤버 있음
	public static final int MEMBER_JOIN_FAIL = 0;	//회원가입 실패
	public static final int MEMBER_JOIN_SUCCESS = 1;	//가입성공
	public static final int MEMBER_LOGIN_PW_NO_GOOD = 0;	//비번 틀림
	public static final int MEMBER_LOGIN_SUCCESS = 1;	//로그인성공
	public static final int MEMBER_LOGIN_IS_NOT = -1;	//로그인실패
	public static final int LOGIN_ADMIN = 2;		//어드민 로그인

	private static MemberDao instance = new MemberDao();

	public static MemberDao getInstance() {
		return instance;
	}

	public MemberDao() {

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


	public int userCheck(String id, String pw) {  //회원 체크
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
				dbPwd = set.getString("pw");
				if (dbPwd.equals(pw)) { 
					if(id.equals("admin")) {
						result = MemberDao.LOGIN_ADMIN; //2
					}else {
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
	
	  //회원 추가시 
//	  public int insertMember(MemberDto dto) { 
//		  int ri = 0;
//	  }
//	  
//	  Connection connection = null; 
//	  PreparedStatement pstmt = null; 
//	  String query ="insert into tea_member values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
//	  
//	  try { connection = getConnection(); 
//	  pstmt = connection.prepareStatement(query);
//	  
//	  pstmt.setString(1, dto.getName()); pstmt.setString(2, dto.getId());
//	  pstmt.setString(3, dto.getPwd()); pstmt.setString(4, dto.getAddress1());
//	  pstmt.setString(5, dto.getAddress2()); pstmt.setString(6, dto.getEmail1());
//	  pstmt.setString(7, dto.getEmail2()); pstmt.setString(8, dto.getBirthdate());
//	  pstmt.setString(9, dto.getTel()); pstmt.setString(10, dto.getPostcode());
//	  pstmt.setString(11, dto.getBankname()); pstmt.setString(12,
//	  dto.getAccount_no()); pstmt.setString(13, dto.getCardname());
//	  pstmt.setString(14, dto.getCard_no1()); pstmt.setString(15,
//	  dto.getCard_no2()); pstmt.setString(16, dto.getCard_no3());
//	  pstmt.setString(17, dto.getCard_no4()); pstmt.setString(18,
//	  dto.getExp_month()); pstmt.setString(19, dto.getExp_year());
//	  pstmt.setString(20, dto.getOrder_list());
//	  
//	  pstmt.executeUpdate(); 
//	  ri = MemberDao.MEMBER_JOIN_SUCCESS; // 1 
//	  } catch(Exception e) {
//		  e.printStackTrace(); 
//		  } 
//	finally
//	{
//		try {
//			if (pstmt != null) {
//				pstmt.close();
//			}
//			if (connection != null) {
//				connection.close();
//			}
//		} catch (Exception e2) {
//			e2.printStackTrace();
//		}
//	}return ri;
//}
	
	
	//멤버 가져올때
//	public MemberDto getMember(String id) {
//		MemberDto dto = null;
//		Connection connection = null;
//		PreparedStatement pstmt = null;
//		ResultSet set = null;
//		String query = "select * from user_member where id=?";
//
//		try {
//			connection = getConnection();
//			pstmt = connection.prepareStatement(query);
//			pstmt.setString(1, id);
//			set = pstmt.executeQuery();
//
//			//set���� ��蹂닿� ���ㅻ㈃ ���μ��耳���
//			if (set.next()) {
//				dto = new MemberDto();
//				dto.setName(set.getString("name"));
//				dto.setId(set.getString("id"));
//				dto.setPwd(set.getString("pwd"));
//				dto.setAddress1(set.getString("address1"));
//				dto.setAddress2(set.getString("address2"));
//				dto.setEmail1(set.getString("email1"));
//				dto.setEmail2(set.getString("email2"));
//				dto.setBirthdate(set.getString("birthdate"));
//				dto.setTel(set.getString("tel"));
//				dto.setPostcode(set.getString("postcode"));
//				dto.setBankname(set.getString("bankname"));
//				dto.setAccount_no(set.getString("account_no"));
//				dto.setCardname(set.getString("cardname"));
//				dto.setCard_no1(set.getString("card_no1"));
//				dto.setCard_no2(set.getString("card_no2"));
//				dto.setCard_no3(set.getString("card_no3"));
//				dto.setCard_no4(set.getString("card_no4"));
//				dto.setExp_month(set.getString("exp_month"));
//				dto.setExp_year(set.getString("exp_year"));
//				dto.setOrder_list(set.getString("order_list"));
//			}
//
//		} catch (Exception e) {
//			e.printStackTrace();
//		}finally {
//			try {
//				set.close();
//				pstmt.close();
//				connection.close();
//			}catch(Exception e2) {
//				e2.printStackTrace();
//			}
//			
//		}
//		return dto;
//	}



}