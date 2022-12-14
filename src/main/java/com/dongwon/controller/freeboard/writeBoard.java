package com.dongwon.controller.freeboard;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/board/write")
public class writeBoard extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		System.out.println(session.getAttribute("userId"));
		request.getRequestDispatcher("/WEB-INF/view/boardWrite.jsp").forward(request, response);
	}
}
