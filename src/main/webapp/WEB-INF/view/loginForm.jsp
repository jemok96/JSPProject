<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Login</title>
    <style>
      .loginform {
        display: flex;
        height: 200px;
        flex-direction: column;
        justify-content: center;
        align-items: center;
      }
      input[type="text"] {
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
    <form action="" class="loginForm">
      <div class="loginform">
        <h2>동원</h2>
        <div class="loginform__id">
          <input type="text" placeholder="ID" />
        </div>
        <div class="loginform__pw">
          <input type="text" placeholder="pasword" />
        </div>
        <div class="loginForm__remember">
          아이디기억
          <input type="checkbox" name="" id="" />
          비밀번호기억
          <input type="checkbox" />
        </div>
      </div>
      <input type="submit" value="로그인" />
    </form>
  </body>
</html>
