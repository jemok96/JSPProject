<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Document</title>
    <style>
      body {
        display: flex;
        justify-content: center;
      }
      input {
        width: 300px;
        padding: 10px;
      }
      .register__column {
        margin-bottom: 20px;
      }
      .register__text {
        text-align: center;
      }
      input[type="tel"] {
        width: 200px;
      }
    </style>
  </head>
  <body>
    <form class="form" action="/register/check" method="post">
      <div class="register">
        <div class="register__text">회원 정보를 입력해주세요</div>
        <div class="register__column">
          <div class="register__id">아이디</div>
          <input type="text" placeholder="아이디" required name="id"/><br>
          <span>${check}</span>
        </div>
        <div class="register__column">
          <div class="register__pw">비밀번호</div>
          <input type="password" placeholder="비밀번호" required name="password"/>
        </div>
        <div class="register__column">
          <div class="register__pwre">비밀번호 재확인</div>
          <input type="password" placeholder="비밀번호" required/>
        </div>
        <div class="register__column">
          <div class="register__name">이름</div>
          <input type="text" placeholder="이름" required name="name"/>
        </div>
        <div class="register__column">
          <div class="register__phone">휴대전화</div>
          <input type="text" name="phone"/>
          
        </div>
      </div>

      <input type="submit" value="동의하고 가입하기" />
    </form>

    <script
      src="https://kit.fontawesome.com/8cc4eb714e.js"
      crossorigin="anonymous"
    ></script>
  </body>
</html>
