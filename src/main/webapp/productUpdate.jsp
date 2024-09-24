<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#tab1{
		width:50%;
		margin: 0 auto;
	}	
	#code1,#name1,#pri1,#sto1{
		height:30px;	
		width: 50%;	
	}	
	#btn1{
		width: 20%;
		height: 30px;
		background-color: rgb(68,68,68);
		color: white;
	}	
	h1{
		text-align: center;
		margin: 10px auto;
	}
	
</style>
<script>
	function check(){
		if(document.form.pcode.value==""){
			alert("상품코드가 입력되지 않았습니다.");
			document.form.pcode.focus();
			return false;
		}
		if(document.form.pcode.value.length > 4 
			||document.form.pcode.value.length < 4){
			alert("상품코드는 문자 4자리만 가능합니다.");
			document.form.pcode.focus();
			return false;
		}
		if(document.form.pname.value==""){
			alert("상품명이 입력되지 않았습니다.");
			document.form.pname.focus();
			return false;
		}
		if(document.form.price.value==""){
			alert("단가가 입력되지 않았습니다.");
			document.form.price.focus();
			return false;
		}
		if(document.form.stockQty.value==""){
			alert("재고수량이 입력되지 않았습니다.");
			document.form.stockQty.focus();
			return false;
		}
		form.submit();
	}
</script>
</head>
<body>
<%@include file="header.jsp" %>
<%@include file="nav.jsp" %>
<section>
<%@include file="DBConn4.jsp" %>
<%
	String pcode=request.getParameter("pcode");
	ResultSet rs=null;
	PreparedStatement pstmt=null;
	
		try{
			String sql="select * from product0919 where pcode=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, pcode);
			rs=pstmt.executeQuery();
				if(rs.next()){
					String pname=rs.getString("pname");
					String price=rs.getString("price");
					String stockQty=rs.getString("stockQty");
					%>
					
<h1>상품 등록</h1>
<form name="form" method="post" action="productUpdateProcess.jsp">
	<table border="1" id="tab1">
		<tr>
			<th>상품 코드</th>
			<td><input type="text" name="pcode" id="code1" value=<%=pcode %>></td>
		</tr>
		<tr>
			<th>상품명</th>
			<td><input type="text" name="pname" id="name1" value=<%=pname %>></td>
		</tr>
		<tr>
			<th>단가</th>
			<td><input type="text" name="price" id="pri1" value=<%=price %>></td>
		</tr> 
		<tr>
			<th>재고수량</th>
			<td><input type="text" name="stockQty" id="sto1" value=<%=stockQty %>></td>
		</tr> 		
		<tr>
			<th colspan="2">
				<input type="button" value="수정" id="btn1" onclick="check()">
				<input type="reset" value="취소" id="btn1">
			</th>			
		</tr>
	</table>
	<%
				}
			
		}catch(Exception e){
			System.out.println("수정실패");
			System.out.println(e.getMessage());
		}
%>
</form>
</section>
<%@include file="footer.jsp" %>
</body>
</html>