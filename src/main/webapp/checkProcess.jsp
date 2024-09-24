<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	//체크박스 여러가지 받기 때문
	String lang[]=request.getParameterValues("lang");
	String chk="";
	if(lang != null){// 하나도 체크안되면 안되니
	//for(int i=0; i<lang.length; i++){ 같은것
	for(int i=0; i<lang.length; i++){
		if(i==(lang.length-1)){
			chk=chk+lang[i];
		}else{
			chk=chk+lang[i]+",";
		}
	}
	System.out.println("chk : "+chk);
	String v1[]=chk.split(",");
	
	for(int i=0;i<lang.length; i++){
		System.out.println("v1 : "+v1[i]);
	}
}
%>
</body>
</html>