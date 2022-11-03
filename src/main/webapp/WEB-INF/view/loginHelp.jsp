<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	아이디찾기
	<form action="/login/help/id" method="get">
	<input type="text" name="email"><input type="submit"  value="보내기"/>
	</form>

	<input id="userNum" type="text" placeholder="인증번호"/><input id="check" type="submit" value="체크"/>

	<script type="text/javascript">
		const num = ${num};
		
		console.log(num);
		
		document.getElementById("check").addEventListener('click',function(){
			const userNum = document.getElementById("userNum").value;
			if(num == userNum){
				console.log("인증 성공!!");
			}
			else{
				console.log("인증 실패!");
			}
		})
	</script>
</body>
</html>