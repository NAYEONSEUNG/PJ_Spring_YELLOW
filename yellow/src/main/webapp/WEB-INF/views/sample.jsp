<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="include/include.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>sample.jsp</title>
</head>
<body>				<!-- 물음표 뒤는 데이터 영역 -->
	<a href="${path}/sample/view?user=배뚱&pass=1234">GET</a>
	
	<form action="${path}/sample/view"  method="post">
		<!-- input, textarea, selecet,radio,check... -->
		<input type="text" name="user"><!-- 네임만 받을수 있다. id값은 못받음 절대로  -->
		<input type="password" name="pass">
		<button type="submit" >POST</button>
	</form>
</body>
</html>