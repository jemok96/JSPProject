package com.dongwon.controller;

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

		
		
		BoardService service = new BoardService();
		List<FreeBoardDTO> list = service.getNoticeList("title","",1);

		request.setAttribute("list", list);
		request.getRequestDispatcher("/WEB-INF/view/board.jsp").forward(request, response);
	}
}
