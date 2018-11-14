<%@page import="java.io.FilenameFilter"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	File folder = (File)application.getAttribute("contentFolder");
	String names[] = folder.list((dir, name) -> {
		if (application.getMimeType(name) != null) {

			return application.getMimeType(name).startsWith("text");
		}
		return false;
	});
%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<meta charset="UTF-8">
<script type="text/javascript">
	$(function() {
		var songForm = $("#songForm");
		var resultArea = $("#resultArea");
		$("[name='music']").on("change", function() {
			var song = $(this).val();
			var url = songForm.attr("action");
			var method = songForm.attr("method");
			$.ajax({
				url : url,
				method : method,
				data : {
					song : song
				},
				dataType : "html", //accept : text/html
				success : function(resp) {
					resultArea.html(resp);
				},
				error : function(resp) {
					console.log(resp.responseText);
				}
			});
		});
	});
</script>
<title>Insert title here</title>
</head>
<body>
	<form id="songForm" action="<%=request.getContextPath()%>/song"
		method="post">
		<select name="music">
			<option value="">가사 선택</option>
			<%
				String partten = "<option>%s</option>";
				for (String name : names) {
					out.print(String.format(partten, name));
				}
			%>
		</select>
	</form>
	<div id="resultArea"></div>
</body>
</html>