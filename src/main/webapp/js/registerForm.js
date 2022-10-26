let pwN = false;
	let idN =false;
	 $('#id').on("change", (e) => {
	        const id = $('#id').val();

	        
	        $.ajax({
	            type:'post',
	            url:'/register/checkId',
	            dataType:'text',
	            data:{id:id},
	            success: function(data, textStatus) {
	                if(data === 'usable') {
	                    $('#message').text('사용할 수 있는 ID입니다.');
	                    $('#message').css('color',"black");
	                    idN = true;
	                  //$('#checkBtn').prop('disabled', true) // 사용할 수 있는 ID면 버튼을 비활성화 시킨다.
	                } else {
	                    $('#message').text('이미 사용 중인 아이디입니다.')
	                    $('#message').css('color',"red")
	                    idN =false;
	                }
	            },
	            error:function (data, textStatus) {
	                console.log('error');
	            }
	        })    //ajax

	    })
		document.getElementById("pw1").addEventListener('change', function() {
			const pw1 = document.getElementById("pw1").value;
			const pw2 = document.getElementById("pw2").value;
			if (pw1 != pw2) {
				document.getElementById("checkPw").innerHTML = "비밀번호가 같지 않습니다";
				document.getElementById("checkPw").style.color = "red";
				pwN = false;
			} else {
				document.getElementById("checkPw").innerHTML = "비밀번호가 같습니다";
				document.getElementById("checkPw").style.color = "black";
				pwN = true;
			}
		})

		document.getElementById("pw2").addEventListener('change', function() {
			const pw1 = document.getElementById("pw1").value;
			const pw2 = document.getElementById("pw2").value;
			if (pw1 != pw2) {
				document.getElementById("checkPw").innerHTML = "비밀번호가 같지 않습니다";
				document.getElementById("checkPw").style.color = "red";
				pwN = false;
			} else {
				document.getElementById("checkPw").innerHTML = "비밀번호가 같습니다";
				document.getElementById("checkPw").style.color = "black";
				pwN = true;
			}
		})
		document.getElementById("sub").addEventListener('click', function(e) {
			if (pwN == false) {
				e.preventDefault();
				alert("비밀번호가 같지않습니다.")
			}
			else if(idN ==false){
				e.preventDefault();
				alert("아이디 중복체크 해주세요.")
			}
		})