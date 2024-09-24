<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form name="form" method="post" action="checkProcess.jsp">
관심있는 프로그램 언어는?<br><br>
	<input type="checkbox" name="lang" value="java">java
	<input type="checkbox" name="lang" value="JSP">JSP
	<input type="checkbox" name="lang" value="C++">C++
	<input type="checkbox" name="lang" value="JavaScript">JavaScript
	<input type="checkbox" name="lang" value="C#">C#<br><br>
	<input type="submit" value="저장"> 
</form>
</body>
</html>