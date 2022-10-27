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

@WebServlet("/board/detail")
public class Detail extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "jdbc:oracle:thin:@localhost:1521:orcl";
		String sql = "SELECT * FROM FREE_BOARD WHERE ID =?";
		String getId = request.getParameter("id");
		FreeBoardDTO fb = null;
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con = DriverManager.getConnection(url,"scott","tiger");
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, getId);

			ResultSet rs = st.executeQuery();
			if(rs.next()) {
				int id = rs.getInt("ID");
				String title = rs.getString("TITLE");
				String writer_id = rs.getString("WRITER_ID");
				Date regdate = rs.getDate("REGDATE");
				String content = rs.getString("CONTENT");
				int hit = rs.getInt("HIT");
				fb = new FreeBoardDTO(id, title, writer_id, regdate, content, hit);
			}
		
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		request.setAttribute("board", fb);
		request.getRequestDispatcher("/WEB-INF/view/boardDetail.jsp").forward(request, response);
	}
}
