package com.dongwon.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/login")
public class loginForm extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String chkId = "";
		String chkPw = "";
		
		Cookie[] cookies = request.getCookies();
//		전달받은 쿠키가 있다면 찾아서 저장 후 전달
		if(cookies.length>0 && cookies != null) {
			for(int i=0; i<cookies.length; i++) {
				if(cookies[i].getName().equals("rememberId")) {
					chkId =cookies[i].getValue();
				}
				if(cookies[i].getName().equals("rememberPw")) {
					chkPw =cookies[i].getValue();
				}
			}
		}

		request.setAttribute("chkPw", chkPw);
		request.setAttribute("chkId", chkId);
		request.getRequestDispatcher("WEB-INF/view/loginForm.jsp").forward(request, response);
	}
}
