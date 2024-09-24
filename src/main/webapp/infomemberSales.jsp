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
<h1>회원 매출 정보 조회(회원번호별 집계)</h1>
<%@include file="DBConn4.jsp" %>
<table border="2" id="tab1">
	<tr>
		<th>No</th>
		<th>회원번호</th>
		<th>회원성명</th>
		<th>고객등급</th>
		<th>매출</th>
	</tr>
	<%
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int no=0;
			
			try{
				String sql = "select b.custno, a.custname, a.grade, sum(pcost*amount) from member0919 a, money0919 b where a.custno = b.custno group by b.custno, a.custname, a.grade";
				pstmt=conn.prepareStatement(sql);
				rs=pstmt.executeQuery();
					while(rs.next()){
						String custno=rs.getString(1);
						String custname=rs.getString(2);
						String grade=rs.getString(3);
						String salse=rs.getString(4);
						no++;
%>
	<tr>
		<td><%=no %></td>
		<td><%=custno %></td>
		<td><%=custname %></td>
		<td><%if(grade.equals("A")){%>VIP<%}%>
			<%if(grade.equals("B")){%>일반<%}%>
			<%if(grade.equals("C")){%>직원<%}%></td>
		<td><%=salse %></td>		
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