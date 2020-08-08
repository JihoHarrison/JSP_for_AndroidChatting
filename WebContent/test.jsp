<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ page import = "java.sql.*" %>
    
<%
Connection conn = null;
try{
	String url = "jdbc:mysql://localhost:3306/test?serverTimezone=UTC";
	String id = "root";
	String pw = "1234jh925";
	
	Class.forName("com.mysql.jdbc.Driver");
	conn = DriverManager.getConnection(url, id, pw);
	
	String str1 = request.getParameter("str1");
	String str2 = request.getParameter("str2");
	
	System.out.println(str1);
	System.out.println(str2);
	
	out.println(str1);
	out.println(str2);
	
} catch (Exception e) {
	e.printStackTrace();
}
%>