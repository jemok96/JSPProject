<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>로그인 성공!</h1>
	${userId}님 환영합니다.
	<form action="/index">
		메인페이지로 이동<br>
		<input type="submit" >
	</form>
</body>
</html>