<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>02/jspSrandard.jsp</title>
</head>
<body>
<h4>JSP(Java Server Page)</h4>
<a href="<%=request.getContextPath() %>/02/numberTest.jsp?minDan=1&maxDan=9">테스트용 구구단 요청</a>
<pre>
	: 자바 기반의 확장 CGI 방식의 스크립트 언어, 템플릿을 작성하는 과정에서 사용.
	표준 구성 요소
	1. 정적 텍스트 : HTML, Javascript, text....
	2. 스크립트 구성요소: <% %>
		1) 지시자(Directive): &lt;%@지시자명 속성명="속성값" %&gt;
				-> JSP 페이지에 대한 기본(환경)설정에 사용. 전처리에 사용.
				page 	: JSP 페이지 환경설정에 사용
				taglib	: JSTL과 같은 추가 커스텀 태그를 로딩할때 사용.
				include	: 정적 include에 사용.
		2) 스크립틀릿(Scriptlet):
		<% //자바코드
			//표현식안에 코드는 지역코드임
			//그러므로 test는 지역변수.
			String test = "테스트";
			
		%>
		3) 표현식(Expression):<%=new Date()%>(out print),<%=test %>,
		<%sample();%>
		4) 선언부(Declareation):
		<%!
			void sample(){
				System.out.println( "이부분?");	
			}
		%>
		5) 주석(Comment):<%-- --%>
			client side 주석
			<!--HTML 주석-->
			<script type="text/javascript">
// 			JavaScript 주석
			</script>
			server side 주석(****)
			<% 
// 			Java 주석
			%>
			<%--JSP 주석 --%>
			
	3. 기본 객체(내장 객체)
	4. Action tag
	5. EL(표현언어, Expression Language)
	6. JSTL(JSP Standard Tag Library)

</pre>
</body>
</html>