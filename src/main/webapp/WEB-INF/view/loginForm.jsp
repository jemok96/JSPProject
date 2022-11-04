<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.net.URLEncoder"%>
<%@ page import="java.security.SecureRandom"%>
<%@ page import="java.math.BigInteger"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Login</title>
<script type="text/javascript"
	src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js"
	charset="utf-8"></script>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<style>
.loginform {
	display: flex;
	height: 200px;
	flex-direction: column;
	justify-content: center;
	align-items: center;
}

input[type="text"], input[type="password"] {
	width: 230px;
	padding: 10px;
}

input[type="checkbox"] {
	margin: 10px 10px 0px 0px;
}

input[type="submit"] {
	width: 20%;
	height: 40px;
	background-color: antiquewhite;
	border: none;
	border-radius: 5px;
}

.loginForm {
	display: flex;
	flex-direction: column;
	align-items: center;
}
</style>
</head>
<body>

	<form action="/login/check" class="loginForm" method="POST">
		<div class="loginform">
			<h2>동원</h2>
			<div class="loginform__id">
				<input type="text" name="userId" value=${(empty chkId)?"":chkId}>
			</div>
			<div class="loginform__pw">
				<input type="password" name="userpw" value=${(empty chkPw)?"":chkPw}>
			</div>
			<div class="loginForm__remember">
				아이디기억 <input type="checkbox" ${(empty chkId)?"":"checked"}
					name="rememberId" value="chkId" /> 비밀번호기억 <input type="checkbox"
					${(empty chkPw)?"":"checked"} name="rememberPw" value="chkPw" />
			</div>
		</div>
		
	</form>
	<div><a href="/login/help"><input type="submit" value="아이디 찾기" /></a></div>
	
	<%
	String clientId = "cyLayBKUvNpVzIYWagMY";//애플리케이션 클라이언트 아이디값";
	String redirectURI = URLEncoder.encode("http://localhost:8080/login/checkNaver", "UTF-8");
	SecureRandom random = new SecureRandom();
	String state = new BigInteger(130, random).toString();
	String apiURL = "https://nid.naver.com/oauth2.0/authorize?response_type=code" + "&client_id=" + clientId
			+ "&redirect_uri=" + redirectURI + "&state=" + state;
	session.setAttribute("state", state);
	%>

	<a href="<%=apiURL%>"><img height="50"
		src="http://static.nid.naver.com/oauth/small_g_in.PNG" /></a>
	<script>
		let chkId = "${chkId}";
		let chkPw = '${chkPw}'
	</script>
</body>
</html>
