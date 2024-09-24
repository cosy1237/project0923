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
<h1>회원목록 조회/수정/삭제</h1>
<%@include file="DBConn4.jsp" %>
<table border="2" id="tab1">
	<tr>
		<th>No</th>
		<th>회원번호</th>
		<th>회원성명</th>
		<th>전화번호</th>
		<th>주소</th>
		<th>가입일자</th>
		<th>고객등급</th>
		<th>거주지역</th>
		<th>관심상품</th>
		<th>구분</th>
	</tr>
	<%
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int no=0;
			
			try{
				String sql = "select custno, custname, phone, address, to_char(joindate,'YYYY-MM-DD'), grade, city, goods from member0919 order by custno";
				pstmt=conn.prepareStatement(sql);
				rs=pstmt.executeQuery();
					while(rs.next()){
						String custno=rs.getString("custno");
						String custname=rs.getString("custname");
						String phone=rs.getString("phone");
						String address=rs.getString("address");
						String joindate=rs.getString(5);
						String grade=rs.getString("grade");
						String city=rs.getString("city");
						String goods=rs.getString("goods");
						no++;
%>
	<tr>
		<td><%=no %></td>
		<td><a href="memberUpdate.jsp?custno=<%=custno %>"><%=custno %></a></td>
		<td><%=custname %></td>
		<td><%=phone %></td>
		<td><%=address %></td>
		<td><%=joindate %></td>
		<td><%if(grade.equals("A")){%>VIP<%} %>
			<%if(grade.equals("B")){%>일반<%} %>
			<%if(grade.equals("C")){%>직원<%} %></td>
		<td><%=city %></td>
		<td><%=goods %></td>
		<td><a href="memberDelete.jsp?custno=<%=custno %>" 
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