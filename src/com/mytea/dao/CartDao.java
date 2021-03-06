package com.mytea.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.mytea.dto.CartDto;

public class CartDao {
   private Connection connection = null;
   private PreparedStatement pstmt = null;
   private ResultSet rs = null;
   private static CartDao instance = new CartDao();
   
   public static CartDao getInstance() {
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
   
   //productsList.jsp 에서 선택된 product들을 cart테이블로 insert할 때
   public void insertCart(CartDto dto) {
      String query = "insert into cart values(?,?,?,?,?,seq_cart.nextval)";
      
      try {
         connection = getConnection();
         pstmt = connection.prepareStatement(query);
         
         pstmt.setString(1, dto.getId());
         pstmt.setString(2, dto.getNames());
         pstmt.setInt(3, dto.getPerprice());
         pstmt.setInt(4, dto.getAmount());
         pstmt.setInt(5, dto.getTotalprice());
         pstmt.executeQuery();
         
         
      }catch(Exception e) {
         e.getStackTrace();
      }finally {
         try {
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
      
   }
   
   // 전체 카트 출력
   public ArrayList<CartDto> allCartRetrieve(String _id){
	   // 해당 id의 최근에 넣은 cart가 상단에 오도록 정렬해서 select함
      String query = "select * from cart where id = ? order by cart_id desc";
      ArrayList<CartDto> carts = new ArrayList<CartDto>();
      
      try {
         connection = getConnection();
         pstmt = connection.prepareStatement(query);
         pstmt.setString(1, _id);
         rs = pstmt.executeQuery();
         
         while(rs.next()) {
            String id = rs.getString(1);
            String names = rs.getString(2);
            int perprice = rs.getInt(3);
            int amount = rs.getInt(4);
            int totalprice = rs.getInt(5);
            int cart_id = rs.getInt(6);
            
            carts.add(new CartDto(id, names, perprice, amount, totalprice, cart_id));
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
      
      return carts;
   }
   
   //선택된 목록 카트 삭제
   public void deleteCart(int cart_id) {
      String query = "delete from cart where cart_id = ?";
      
      try {
         connection = getConnection();
         pstmt = connection.prepareStatement(query);
         pstmt.setInt(1, cart_id);
         
         pstmt.executeUpdate();
         
      }catch(Exception e) {
         e.getStackTrace();
      }finally {
         try {
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
      
   }

}

