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
			
			String sql="update member0919 set custname=?, phone=?, address=?, joindate=?, grade=?, city=?, goods=? where custno=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, custname);
			pstmt.setString(2, phone);
			pstmt.setString(3, address);
			pstmt.setString(4, joindate);
			pstmt.setString(5, grade);
			pstmt.setString(6, city);
			pstmt.setString(7, goods);
			pstmt.setString(8, custno);
			pstmt.executeUpdate();
			System.out.println("회원정보가 수정이 완료되었습니다.");	
			
			%>
			<script>
				alert("회원정보가 수정되었습니다.");
				location.href="infoMember.jsp"
			</script>
			<%
			
		}catch(Exception e){
			System.out.println("회원정보가 수정실패");
			System.out.println(e.getMessage());
		}
%>
</body>
</html>