<%@page import="kr.or.ddit.vo.MemberVO"%>
<%@page import="kr.or.ddit.member.service.MemberServiceImpl"%>
<%@page import="kr.or.ddit.member.service.IMemberSerivce"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	IMemberSerivce serivce= MemberServiceImpl.getInstance();

	String mem_id=request.getParameter("who");
	System.out.println(mem_id);
	MemberVO member=serivce.retrieveMember(mem_id);

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<table>
	
	<% 
		
		if(member!=null){
			out.print("<tr><th>아이디</th><td>"+member.getMem_id()+"</td></tr>");
			out.print("<tr><th>비밀번호</th><td>"+member.getMem_id()+"</td></tr>");
			out.print("<tr><th>이름</th><td>"+member.getMem_id()+"</td></tr>");
			out.print("<tr><th>주민번호</th><td>"+member.getMem_id()+"</td></tr>");
			out.print("<tr><th>생일</th><td>"+member.getMem_id()+"</td></tr>");
			out.print("<tr><th>우편번호</th><td>"+member.getMem_id()+"</td></tr>");
			out.print("<tr><th>주소</th><td>"+member.getMem_id()+"</td></tr>");
			out.print("<tr><th>집전화</th><td>"+member.getMem_id()+"</td></tr>");
			out.print("<tr><th>회사</th><td>"+member.getMem_id()+"</td></tr>");
			out.print("<tr><th>휴대폰</th><td>"+member.getMem_id()+"</td></tr>");
			out.print("<tr><th>직업</th><td>"+member.getMem_id()+"</td></tr>");
			out.print("<tr><th>취미</th><td>"+member.getMem_id()+"</td></tr>");
			out.print("<tr><th>기념일</th><td>"+member.getMem_id()+"</td></tr>");
			out.print("<tr><th>기념일자</th><td>"+member.getMem_id()+"</td></tr>");
			out.print("<tr><th>마일리지</th><td>"+member.getMem_id()+"</td></tr>");
		}
	%>
	
</table>

</body>
</html>