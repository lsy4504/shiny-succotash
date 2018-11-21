<%@page import="java.text.ParseException"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="javax.sound.midi.SysexMessage"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="kr.or.ddit.ServiceResult"%>
<%@page import="org.apache.commons.lang3.StringUtils"%>
<%@page import="kr.or.ddit.member.service.MemberServiceImpl"%>
<%@page import="kr.or.ddit.member.service.IMemberSerivce"%>
<%@page import="kr.or.ddit.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
1.파라미터 확보 ( 특수문자 고려) 
2.검증(룰: member 테이블의 스키마를 확인) 
3.통과 
1) 의존 형성... 
2)로직선택 피케이중복 (중복된 아이디만 죽이고 나머지 살림 리퀘스트스코프에 해주면되겠네 포워드로하면될듯)(메시지) 오케이
멤버리스트.jsp 페일드 : 사과와 등록버튼으로 가시오..... 
4.불통 멤버폼으로가시오... 왜 검증에 실패했는지...(검증
결과 메시지 공유 이넘으로하래)
<%! 
	private boolean validate(MemberVO member, Map<String,String> errors){
		boolean valid= true;
		System.out.print("비번검증");
		
		//검증 룰..
		if(StringUtils.isBlank(member.getMem_id())){
		valid=false;
		errors.put("mem_id", ">회원아이디 미입력 .... <");
		}
		if(StringUtils.isBlank(member.getMem_pass())){
		valid=false;
		System.out.print("비번검증");
		errors.put("mem_pass", ">비밀번호 미입력 .... <");
		}
		if(StringUtils.isBlank(member.getMem_name())){
		valid=false;
		errors.put("mem_name", ">회원명 미입력 .... <");
		}
		if(StringUtils.isNotBlank(member.getMem_bir())){
			SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
			//formatting : 특정타입의 데이터를 일정 형식의 문자열로 변환.
			//parsing: 일정한 형식의 문자열을 특정 타입의 데이터로 변환.
			try{
			formatter.parse(member.getMem_bir());
			}catch(ParseException e){
				valid=false;
				errors.put("mem_bir", ">날짜형식 확인<");
			}
		}
// 		if(StringUtils.isBlank(member.getMem_pass())){
// 			message="비밀번호 미입력.";
// 		}else if(StringUtils.isBlank(member.getMem_name())){
// 			message="이름 미입력..";
// 		}else{
// 			System.out.print("aa");
// 			ServiceResult serviceResult= serivce.registMember(member);
// 			if(ServiceResult.OK==serviceResult){
// 				redirect=true;
// 				gopage=request.getContextPath()+"/member/memberList.jsp";
				
// 			}else if(ServiceResult.INVALIDPASSWORD==serviceResult){
// 				message="아이디가 중복됩니다?";
// 			}
// 		}
		
		return valid;
}
%>
<jsp:useBean id="member" class="kr.or.ddit.vo.MemberVO" scope="request"></jsp:useBean>
<jsp:setProperty property="*" name="member" />
<%
	IMemberSerivce serivce=MemberServiceImpl.getInstance();
	String message=null;
	boolean redirect=false;
	String gopage="/member/memberForm.jsp";
	Map<String,String> errors=new HashMap<>();
	request.setAttribute("errors", errors);
	boolean valid= validate(member,errors);
	System.err.println(errors.size());
	if(valid){
		ServiceResult result=serivce.registMember(member);
		switch(result){
		case PKDUPLICATED:
			message="아이디 중복, 바꿔용";
			break;
		case FAILED:
			message="서버 오류입니다..";
			break;
		case OK:
			redirect=true;
			gopage=request.getContextPath()+"/member/memberList.jsp";
			break;
		}
		request.setAttribute("message", message);
	}else{
		
	}

	
	if(redirect){
		response.sendRedirect(gopage);
	}else{
		request.setAttribute("message", message);
		request.setAttribute("member", member);
		RequestDispatcher rd=request.getRequestDispatcher(gopage);
		rd.forward(request, response);
		
	}
	
%>