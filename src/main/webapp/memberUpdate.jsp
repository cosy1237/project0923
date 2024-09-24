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
	}	
	th,#id1,#name1,#pho1,#jo1{
		height:30px;	
		width: 20%;	
	}
	#add1{
		height:30px;	
		width: 40%;
	}
	#gra1,#code1{
		height:30px;	
		width: 10%;	
	}
	#btn1{
		width: 10%;
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
		if(document.form.custname.value==""){
			alert("성명이 입력되지 않았습니다.");
			return false;
		}
		if(document.form.phone.value==""){
			alert("번호가 입력되지 않았습니다.");
			return false;
		}
		if(document.form.address.value==""){
			alert("주소가 입력되지 않았습니다.");
			return false;
		}
		if(document.form.joindate.value==""){
			alert("가입일자가 입력되지 않았습니다.");
			return false;
		}
		if(document.form.phone.value==""){
			alert("전화번호가 입력되지 않았습니다.");
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
	String custno=request.getParameter("custno");
	ResultSet rs=null;
	PreparedStatement pstmt=null;
	
		try{
			String sql="select custno, custname, phone, address, to_char(joindate,'YYYY-MM-DD'), grade, city, goods from member0919 where custno=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, custno);
			rs=pstmt.executeQuery();
				if(rs.next()){
					String custname=rs.getString("custname");
					String phone=rs.getString("phone");
					String address=rs.getString("address");
					String joindate=rs.getString(5);
					String grade=rs.getString("grade");
					String city=rs.getString("city");
					String goods=rs.getString("goods");
					//배열로 ","로 받는다!
					String arr[]=goods.split(",");
			
%>
<h1>홈쇼핑 회원등록</h1>
<form name="form" method="post" action="memberUpdateProcess.jsp">
	<table border="1" id="tab1">
		<tr>
			<th>회원번호(자동발생)</th>
			<td><input type="text" name="custno" id="id1" value="<%=custno %>"></td>
		</tr>
		<tr>
			<th>회원성명</th>
			<td><input type="text" name="custname" id="name1" value="<%=custname %>"></td>
		</tr>
		<tr>
			<th>회원전화</th>
			<td><input type="text" name="phone" id="pho1" value="<%=phone %>"></td>
		</tr> 
		<tr>
			<th>회원주소</th>
			<td><input type="text" name="address" id="add1" value="<%=address %>"></td>
		</tr>  
		<tr>
			<th>가입일자</th>
			<td><input type="text" name="joindate" id="jo1" value="<%=joindate %>"></td>
		</tr>  
		<tr>
			<th>고객등급</th>
			<td>
				<select name="grade" id="gra1">
					<option value="A"<%if(grade.equals("A")){%>selected<%} %>>A: VIP</option>
					<option value="B"<%if(grade.equals("B")){%>selected<%} %>>B: 일반</option>
					<option value="C"<%if(grade.equals("C")){%>selected<%} %>>C: 직원</option>
				</select>			
			</td>
		</tr> 
		<tr>
			<th>도시코드</th>
			<td>
				<select name="city" id="code1">
					<option value="01"<%if(city.equals("01")){%>selected<%} %>>01:서울</option>
					<option value="02"<%if(city.equals("02")){%>selected<%} %>>02:경기</option>
					<option value="10"<%if(city.equals("10")){%>selected<%} %>>10:대전</option>
					<option value="20"<%if(city.equals("20")){%>selected<%} %>>20:부산</option>
					<option value="30"<%if(city.equals("30")){%>selected<%} %>>30:광주</option>
					<option value="40"<%if(city.equals("40")){%>selected<%} %>>40:울산</option>
					<option value="50"<%if(city.equals("50")){%>selected<%} %>>50:대구</option>
					<option value="60"<%if(city.equals("60")){%>selected<%} %>>60:강원</option>
					<option value="70"<%if(city.equals("70")){%>selected<%} %>>70:경상</option>
					<option value="80"<%if(city.equals("80")){%>selected<%} %>>80:충청</option>
					<option value="90"<%if(city.equals("90")){%>selected<%} %>>90:제주</option>			
				</select>			
			</td>
		</tr> 
		<tr>
			<th>관심상품</th>
			<td>
				<input type="checkbox" name="goods" value="프로그램"
				<%for(int i=0; i<arr.length; i++){if(arr[i].equals("프로그램")){%>checked<%}} %>>프로그램
				<input type="checkbox" name="goods" value="의류"
				<%for(int i=0; i<arr.length; i++){if(arr[i].equals("의류")){%>checked<%}} %>>의류
				<input type="checkbox" name="goods" value="식료품"
				<%for(int i=0; i<arr.length; i++){if(arr[i].equals("식료품")){%>checked<%}} %>>식료품
				<input type="checkbox" name="goods" value="컴퓨터"
				<%for(int i=0; i<arr.length; i++){if(arr[i].equals("컴퓨터")){%>checked<%}} %>>컴퓨터
				<input type="checkbox" name="goods" value="공산품"
				<%for(int i=0; i<arr.length; i++){if(arr[i].equals("공산품")){%>checked<%}} %>>공산품
				<input type="checkbox" name="goods" value="관광"
				<%for(int i=0; i<arr.length; i++){if(arr[i].equals("관광")){%>checked<%}} %>>관광
				<input type="checkbox" name="goods" value="전자제품"
				<%for(int i=0; i<arr.length; i++){if(arr[i].equals("전자제품")){%>checked<%}} %>>전자제품
				<input type="checkbox" name="goods" value="건강제품"
				<%for(int i=0; i<arr.length; i++){if(arr[i].equals("건강제품")){%>checked<%}} %>>건강제품
				<input type="checkbox" name="goods" value="운동기구"
				<%for(int i=0; i<arr.length; i++){if(arr[i].equals("운동기구")){%>checked<%}} %>>운동기구
			</td>
		</tr> 
		<tr>
			<th colspan="2">
				<input type="button" value="수정" id="btn1" onclick="check()">
				<a href="infoMember.jsp"><input type="button" value="조회" id="btn1"></a>
			</th>			
		</tr>
	</table>
	<%
	}
			
		}catch(Exception e){
			System.out.println("수정 실패");
			System.out.println(e.getMessage());
		}
	%>
</form>
</section>
<%@include file="footer.jsp" %>
</body>
</html>