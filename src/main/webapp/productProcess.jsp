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
	String pcode=request.getParameter("pcode");
	String pname=request.getParameter("pname");
	String price=request.getParameter("price");
	String stockQty=request.getParameter("stockQty");
	
	
	PreparedStatement pstmt=null;
		try{
			
			String sql="insert into product0919 values(?,?,?,?)";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, pcode);
			pstmt.setString(2, pname);
			pstmt.setString(3, price);
			pstmt.setString(4, stockQty);
			pstmt.executeUpdate();
			System.out.println("저장성공");	
			
			%>
			<script>
				alert("상품등록되었습니다.");
				location.href="product.jsp"
			</script>
			<%
			
		}catch(Exception e){
			System.out.println("저장실패");
			System.out.println(e.getMessage());
		}
%>
</body>
</html>