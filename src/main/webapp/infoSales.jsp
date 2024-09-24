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
<h1>회원 매출 정보 목록</h1>
<%@include file="DBConn4.jsp" %>
<table border="2" id="tab1">
	<tr>
		<th>No</th>
		<th>회원번호</th>
		<th>회원성명</th>
		<th>판매번호</th>
		<th>단가</th>
		<th>수량</th>
		<th>가격</th>
		<th>상품코드</th>
		<th>판매일자</th>
	</tr>
	<%
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int no=0;
			
			try{
				String sql = "select b.custno, a.custname, saleno, pcost, amount, sum(pcost*amount), pcode, to_char(sdate,'YYYY-MM-DD') from member0919 a, money0919 b where a.custno=b.custno group by b.custno, a.custname, saleno, pcost, amount, pcode, TO_CHAR(sdate, 'YYYY-MM-DD')";
				pstmt=conn.prepareStatement(sql);
				rs=pstmt.executeQuery();
					while(rs.next()){
						String custno=rs.getString(1);
						String custname=rs.getString(2);
						String saleno=rs.getString(3);
						String pcost=rs.getString(4);
						String amount=rs.getString(5);
						String price=rs.getString(6);
						String pcode=rs.getString(7);
						String sdate=rs.getString(8);
						no++;
%>
	<tr>
		<td><%=no %></td>
		<td><%=custno %></td>
		<td><%=custname %></td>
		<td><%=saleno %></td>
		<td><%=pcost %></td>
		<td><%=amount %></td>
		<td><%=price %></td>
		<td><%if(pcode.equals("A001")){%>볼펜<%}%>
			<%if(pcode.equals("A002")){%>노트1<%}%>
			<%if(pcode.equals("A003")){%>노트2<%}%>
			<%if(pcode.equals("A004")){%>색연필<%}%>
			<%if(pcode.equals("A005")){%>지우개<%}%>
			<%if(pcode.equals("A006")){%>연필<%}%>
			<%if(pcode.equals("A007")){%>커터칼<%}%>
			<%if(pcode.equals("A008")){%>견출지<%}%>
			<%if(pcode.equals("A009")){%>테이프<%}%>
			<%if(pcode.equals("A0010")){%>수정펜<%}%></td>
		<td><%=sdate %></td>		
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