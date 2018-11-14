<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
		
<%
request.setCharacterEncoding("UTF-8");
/* 1.파라미터 확인
2.검증  
3.불통
	이동(loginForm.jsp, 기존에 입력했던 아이디를 그대로 전달 할수 있는 방식.)
4.통과
	1)인증 (id==pass) true
		1)-1 인증 성공 : 웰컴 페이지로 이동(원본 요청을 제거하고 이동)
		1)-2 인증 실패 : 이동(loginForm.jsp,기존에 입력했던 아이디를 그대로 전달 할수 있는 방식. ) */
	String mem_id=request.getParameter("mem_id");
	String mem_pass=request.getParameter("mem_pass");
	RequestDispatcher rd= null;
	String goPage= null;
	boolean redirect=false;
// 	if(mem_id==null || mem_id.trim().length()==0){
// 		response.sendRedirect(request.getContextPath()+"/login/loginForm.jsp");
// 	}else if(mem_pass==null|| mem_pass.trim().length()==0){
		
// 		rd=request.getRequestDispatcher("/login/loginForm.jsp");
// 		rd.forward(request, response);
// 	}else if(mem_id.equals(mem_pass)){
// 		response.sendRedirect(request.getContextPath()+"/index.jsp");
// 	}else{
// 		rd=request.getRequestDispatcher("/login/loginForm.jsp");
// 		rd.forward(request, response);
		
// 	}
	if(mem_id==null || mem_id.trim().length()==0 || mem_pass==null||mem_pass.trim().length()==0){
		goPage="/login/loginForm.jsp";
		redirect =true;
		session.setAttribute("message", "아이디나 비밀번호가 누락됨 ㅎ");
	}else{
		if(mem_id.equals(mem_pass)){
			goPage="/";
			redirect=true;
			session.setAttribute("id", mem_id);
		}else{
		goPage="/login/loginForm.jsp";
		redirect =true;
		session.setAttribute("message", "아이디 비밀번호가 노일치!");
		
		}
	}
	if(redirect){
		response.sendRedirect(request.getContextPath()+goPage);		
	}else{
		rd=request.getRequestDispatcher(goPage);
		rd.forward(request, response);
	}
	
%>