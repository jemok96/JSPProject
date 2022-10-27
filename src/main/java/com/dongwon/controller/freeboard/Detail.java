package com.dongwon.controller.freeboard;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dongwon.entity.FreeBoardDTO;
import com.dongwon.service.DetailService;

@WebServlet("/board/detail")
public class Detail extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String getId = request.getParameter("id");
		DetailService service = new DetailService();
		FreeBoardDTO fb = service.getBoard(getId);
		int result = service.plusHit(getId);
		System.out.println(result);
		
		request.setAttribute("board", fb);
		request.getRequestDispatcher("/WEB-INF/view/boardDetail.jsp").forward(request, response);
	}
}
