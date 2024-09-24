<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@include file="DBConn4.jsp" %>
<%
	String custno=request.getParameter("custno");
	String custname=request.getParameter("custname");
	String phone=request.getParameter("phone");
	String address=request.getParameter("address");
	String joindate=request.getParameter("joindate");
	String grade=request.getParameter("grade");
	String city=request.getParameter("city");
	String[] val=request.getParameterValues("goods");
	String goods="";
		if(val !=null){
			for(int i=0; i<val.length; i++){
				if(i==(val.length-1)){
				goods+=val[i];
			}else{
				goods+=val[i]+",";
			}
		}
	}
	System.out.println("goods"+goods);
	
	PreparedStatement pstmt=null;
		try{
			
			String sql="insert into member0919 values(?,?,?,?,?,?,?,?)";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, custno);
			pstmt.setString(2, custname);
			pstmt.setString(3, phone);
			pstmt.setString(4, address);
			pstmt.setString(5, joindate);
			pstmt.setString(6, grade);
			pstmt.setString(7, city);		
			pstmt.setString(8, goods);
		
					
			pstmt.executeUpdate();
			System.out.println("저장성공");	
			
			%>
			<script>
				alert("회원등록되었습니다.");
				location.href="member.jsp"
			</script>
			<%
			
		}catch(Exception e){
			System.out.println("저장실패");
			System.out.println(e.getMessage());
		}
%>
</body>
</html>