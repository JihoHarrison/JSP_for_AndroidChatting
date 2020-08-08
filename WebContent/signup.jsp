<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>

<%
	String email = request.getParameter("email");
	String name = request.getParameter("name");
	String password = request.getParameter("password");
	String token= request.getParameter("token");

	String driverName = "com.mysql.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/android?characterEncoding=UTF-8&useSSL=false&serverTimezone=Asia/Seoul";
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
	
	

	String sql = "INSERT INTO users VALUES('" + email + "','" + name + "','" + password + "','"+token+"')";

	try{
		int result = stmt.executeUpdate(sql);

		if (result == 1) {
			out.println("회원 가입 성공");
		} else {
			out.println("회원 가입 실패");
		}		
	} catch(Exception e) {
		out.println(e.toString());
	}

	

	stmt.close();
	conn.close();
%>

