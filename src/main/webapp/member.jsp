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
			document.form.custname.focus();
			return false;
		}
		if(document.form.phone.value==""){
			alert("번호가 입력되지 않았습니다.");
			document.form.phone.focus();
			return false;
		}
		if(document.form.address.value==""){
			alert("주소가 입력되지 않았습니다.");
			document.form.address.focus();
			return false;
		}
		if(document.form.joindate.value==""){
			alert("가입일자가 입력되지 않았습니다.");
			document.form.joindate.focus();
			return false;
		}
		if(document.form.phone.value==""){
			alert("전화번호가 입력되지 않았습니다.");
			document.form.phone.focus();
			return false;
		}
		form.submit();
	}
</script>
</head>
<%@include file="DBConn4.jsp" %>
<%
	ResultSet rs=null;
	PreparedStatement pstmt=null;
	int next_id=0;
		try{				//젤 큰 번호를 찾는다.
			String sql="select max(custno) from member0919";
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
				if(rs.next()){
					next_id=rs.getInt(1)+1;
				}else{
					next_id=1;
				}
		}catch(Exception e){
			System.out.println("오류");
			System.out.println(e.getMessage());
		}
		
%>
<body>
<%@include file="header.jsp" %>
<%@include file="nav.jsp" %>
<section>
<h1>홈쇼핑 회원등록</h1>
<form name="form" method="post" action="memberProcess.jsp">
	<table border="1" id="tab1">
		<tr>
			<th>회원번호(자동발생)</th>
			<td><input type="text" name="custno" id="id1" value="<%=next_id %>"></td>
		</tr>
		<tr>
			<th>회원성명</th>
			<td><input type="text" name="custname" id="name1"></td>
		</tr>
		<tr>
			<th>회원전화</th>
			<td><input type="text" name="phone" id="pho1"></td>
		</tr> 
		<tr>
			<th>회원주소</th>
			<td><input type="text" name="address" id="add1"></td>
		</tr>  
		<tr>
			<th>가입일자</th>
			<td><input type="text" name="joindate" id="jo1"></td>
		</tr>  
		<tr>
			<th>고객등급</th>
			<td>
				<select name="grade" id="gra1">
					<option value="A">A: VIP</option>
					<option value="B">B: 일반</option>
					<option value="C">C: 직원</option>
				</select>			
			</td>
		</tr> 
		<tr>
			<th>도시코드</th>
			<td>
				<select name="city" id="code1">
					<option value="01">01:서울</option>
					<option value="02">02:경기</option>
					<option value="10">10:대전</option>
					<option value="20">20:부산</option>
					<option value="30">30:광주</option>
					<option value="40">40:울산</option>
					<option value="50">50:대구</option>
					<option value="60">60:강원</option>
					<option value="70">70:경상</option>
					<option value="80">80:충청</option>
					<option value="90">90:제주</option>			
				</select>			
			</td>
		</tr> 
		<tr>
			<th>관심상품</th>
			<td>
				<input type="checkbox" name="goods" value="프로그램">프로그램
				<input type="checkbox" name="goods" value="의류">의류
				<input type="checkbox" name="goods" value="식료품">식료품
				<input type="checkbox" name="goods" value="컴퓨터">컴퓨터
				<input type="checkbox" name="goods" value="공산품">공산품
				<input type="checkbox" name="goods" value="관광">관광
				<input type="checkbox" name="goods" value="전자제품">전자제품
				<input type="checkbox" name="goods" value="건강제품">건강제품
				<input type="checkbox" name="goods" value="운동기구">운동기구
			</td>
		</tr> 
		<tr>
			<th colspan="2">
				<input type="button" value="등록" id="btn1" onclick="check()">
				<a href="infoMember.jsp"><input type="button" value="조회" id="btn1"></a>
			</th>			
		</tr>
	</table>
</form>
</section>
<%@include file="footer.jsp" %>
</body>
</html>