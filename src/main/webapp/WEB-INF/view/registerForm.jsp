<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Document</title>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"
	integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ="
	crossorigin="anonymous"></script>
<style>
body {
	display: flex;
	justify-content: center;
}

input {
	width: 400px;
	padding: 10px;
}

.register__column {
	margin-bottom: 20px;
}

.register__text {
	text-align: center;
}
</style>
</head>
<body>
	<form class="form" action="/register/check" method="post">
		<div class="register">
			<div class="register__text">회원 정보를 입력해주세요</div>
			<div class="register__column">
				<div class="register__id">아이디</div>
				<input type="text" placeholder="아이디" required name="id" id="id" /><br>
				
				<div>
					<span id="message"></span>
				</div>
			</div>
			<div class="register__column">
				<div class="register__pw">비밀번호</div>
				<input type="password" id="pw1" id=placeholder=
					"비밀번호"  name="password" />
			</div>
			<div class="register__column">
				<div class="register__pwre">비밀번호 재확인</div>
				<input type="password" id="pw2" placeholder="비밀번호" />
				<div id="checkPw"></div>
			</div>

			<div class="register__column">
				<div class="register__name">이름</div>
				<input type="text" placeholder="이름" name="name" />
			</div>
			<div class="register__column">
				<div class="register__phone">휴대전화</div>
				<input type="text" name="phone" />

			</div>
		</div>

		<input type="submit" value="동의하고 가입하기" id="sub" />
	</form>

	<script>
	 $('#id').on("change", (e) => {
	        const id = $('#id').val();
	        e.preventDefault()
	        console.log('btn click')
	        
	        $.ajax({
	            type:'post',
	            url:'/register/checkId',
	            dataType:'text',
	            data:{id:id},
	            success: function(data, textStatus) {
	                if(data === 'usable') {
	                    $('#message').text('사용할 수 있는 ID입니다.')      
	                  //$('#checkBtn').prop('disabled', true) // 사용할 수 있는 ID면 버튼을 비활성화 시킨다.
	                } else {
	                    $('#message').text('이미 사용 중인 아이디입니다.')
	                }
	            },
	            error:function (data, textStatus) {
	                console.log('error');
	            }
	        })    //ajax

	    })
		let pwN = false;
		document.getElementById("pw1").addEventListener('change', function() {
			const pw1 = document.getElementById("pw1").value;
			const pw2 = document.getElementById("pw2").value;
			if (pw1 != pw2) {
				document.getElementById("checkPw").innerHTML = "같지 않아요";
				document.getElementById("checkPw").style.color = "red";
				pwN = false;
			} else {
				document.getElementById("checkPw").innerHTML = "같습니다";
				document.getElementById("checkPw").style.color = "black";
				pwN = true;
			}
		})

		document.getElementById("pw2").addEventListener('change', function() {
			const pw1 = document.getElementById("pw1").value;
			const pw2 = document.getElementById("pw2").value;
			if (pw1 != pw2) {
				document.getElementById("checkPw").innerHTML = "같지 않아요";
				document.getElementById("checkPw").style.color = "red";
				pwN = false;
			} else {
				document.getElementById("checkPw").innerHTML = "같습니다";
				document.getElementById("checkPw").style.color = "black";
				pwN = true;
			}
		})
		document.getElementById("sub").addEventListener('click', function(e) {
			if (pwN == false) {
				e.preventDefault();
				alert("비밀번호가 같지않습니다.")
			}
		})
	</script>
	<script src="https://kit.fontawesome.com/8cc4eb714e.js"
		crossorigin="anonymous"></script>
</body>
</html>
