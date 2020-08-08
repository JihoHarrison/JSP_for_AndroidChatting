<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>

<%
	String email = request.getParameter("email");
	String password = request.getParameter("password");

	String driverName = "com.mysql.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/android?serverTimezone=Asia/Seoul";
	String id = "root";
	String pwd = "1234jh925";

	try {
		Class.forName(driverName);
	} catch (ClassNotFoundException e) {
		e.printStackTrace();
		return;
	}
	
	Connection conn = DriverManager.getConnection(url, id, pwd);

	Statement stmt = conn.createStatement();

	String sql = "SELECT upassword FROM users WHERE uemail='"+email+"'";
	ResultSet rs = stmt.executeQuery(sql);
	if(rs.next()) {
		System.out.println("id: " + email);
		System.out.println("pw: " + password + " 로그인 됨");
		
		if(rs.getString("upassword").equals(password)) {
			out.println("로그인 성공");
		} else {
			out.println("로그인 실패");
		}

	} else {
		out.println("회원가입 부탁드려요.");
	}

	stmt.close();
	conn.close();
%>

