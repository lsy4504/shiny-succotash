<%@page import="org.apache.commons.lang3.StringUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<%
		String mem_id=(String)session.getAttribute("id");
	
	%>
<meta charset="UTF-8">
<title>/index.jsp</title>
<script type="text/javascript">
<%-- 	<% --%>
// 		if(StringUtils.isNotBlank(mem_id)){
<%-- 	%> --%>
<%-- 		document.getElementById("id").innerHTML="<%=mem_id%>"; --%>
<%-- 	<% --%>
// 		}
<%-- 	%> --%>
</script>
</head>
<body>
<h4>웰컴 페이지</h4>
<pre>
	처음부터 웰컴 페이지로 접속하거나,
	로그인에 성공해서 웰컴 페이지로 접속하는 경우의 수가 있음.
	<%
	if(StringUtils.isNotBlank(mem_id)){
		out.println(mem_id+"님 환영합니다");
		out.print(String.format("<a href='%s'>로그아웃</a>", request.getContextPath()+"/login/logout.jsp"));
	}else{
		out.print(String.format("<a href='%s'>로그인 하러가기</a>", request.getContextPath()+"/login/loginForm.jsp"));
	}
	%>
	
	
</pre>
</body>
</html>