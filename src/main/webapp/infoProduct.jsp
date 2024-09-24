<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#tab1{
		width:70%;
		margin: 0 auto;
		text-align: center;
	}
	h1{
		text-align: center;
		margin: 10px auto;
	}
	
</style>
</head>
<body>
<%@include file="header.jsp" %>
<%@include file="nav.jsp" %>
<section>
<h1>상품 목록 조회</h1>
<%@include file="DBConn4.jsp" %>
<table border="2" id="tab1">
	<tr>
		<th>No</th>
		<th>상품번호</th>
		<th>상품명</th>
		<th>단가</th>
		<th>재고</th>
		<th>구분</th>
	</tr>
	<%
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int no=0;
			
			try{
				String sql="select * from product0919 order by pcode";
				pstmt=conn.prepareStatement(sql);
				rs=pstmt.executeQuery();
				
					while(rs.next()){
						String pcode=rs.getString("pcode");
						String pname=rs.getString("pname");
						String price=rs.getString("price");
						String stockQty=rs.getString("stockQty");
						no++;
%>
	<tr>
		<td><%=no %></td>
		<td><%=pcode %></td>
		<td><%=pname %></td>
		<td><%=price %></td>
		<td><%=stockQty %></td>		
		<td><a href="productUpdate.jsp?pcode=<%=pcode %>">수정 / 
		<a href="productDelete.jsp?pcode=<%=pcode %>"
			onclick="if(!confirm('정말로 삭제하시겠습니까?'))return false;">삭제</a></td>
	</tr>
<%
}			
				
			}catch(Exception e){
				System.out.println("데이터베이스 읽기 실패");
				System.out.println(e.getMessage());
			}
	%>	
	
</table>
</section>
<%@include file="footer.jsp" %>
</body>
</html>