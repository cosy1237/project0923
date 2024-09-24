<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%
	Connection conn=null;
	try{
		String jdbcUrl="jdbc:oracle:thin:@//localhost:1521/xe";
		String jdbcDriver="oracle.jdbc.OracleDriver";
		String user="system";
		String pass="1234";
		Class.forName(jdbcDriver);
		conn=DriverManager.getConnection(jdbcUrl,user,pass);
		System.out.println("database 연결 성공");
	}catch(Exception e){
		System.out.println("database 연결 실패");
		System.out.println(e.getMessage());
	}
%>