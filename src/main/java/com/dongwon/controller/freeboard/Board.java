package com.dongwon.controller.freeboard;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dongwon.entity.FreeBoardDTO;
import com.dongwon.service.BoardService;

@WebServlet("/board")
public class Board extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String page_ = request.getParameter("p");
		String field_ = request.getParameter("f");
		String query_ = request.getParameter("q");
		
		int page =1;
		String field ="title"; 
		String query = "";
		if(page_!=null && !page_.equals("")) page = Integer.parseInt(page_);
		if(field_ != null && !field_.equals("")) field = field_;  
		if(query_ != null && !query_.equals("")) query = query_;  
		
		
		BoardService service = new BoardService();
		List<FreeBoardDTO> list = service.getNoticeList(field,query,page);
		
		int count = service.getNoticeCount(field,query);
		System.out.println(count);
		request.setAttribute("count", count);
		request.setAttribute("list", list);
		request.getRequestDispatcher("/WEB-INF/view/board.jsp").forward(request, response);
	}
}