<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
   String cp = request.getContextPath();

	//로그아웃은 세션에 저장된 것을 지우면 된다.
	session.removeAttribute("id");
	session.removeAttribute("name");
	
	// 세션에 저장된 모든 것을 지우고 세션을 초기화
	session.invalidate();
	
	response.sendRedirect("login.jsp");
%>
