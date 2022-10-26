package com.dongwon.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/login/check")
public class LoginCheck extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		ID , Password 값 저장
		String userId_ = request.getParameter("userId");
		String userpw_ = request.getParameter("userpw");
//		아이디,비밀번호 기억 값 저장
		String chkId = request.getParameter("rememberId");
		String chkPw = request.getParameter("rememberPw");
		
		HttpSession session = request.getSession();

		String url = "jdbc:oracle:thin:@localhost:1521:orcl";
		String sql = "SELECT * FROM DONG_USER WHERE ID=?";

		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con = DriverManager.getConnection(url,"scott","tiger");
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, userId_);
			ResultSet rs = st.executeQuery();
//			ID로 DB조회 결과 값이 있다면 입력받은 pw와 DB의 pw 비교
			if(rs.next()) {
				String userId = rs.getString("ID");
				String userPw = rs.getString("PASSWORD");
//				일치할 경우
				if(userId.equals(userId_) &&userPw.equals(userpw_)) {
//					아이디 or 비밀번호 기억하기 값이 들어왔을 경우 쿠키에 아이디값,비밀번호값 저장
					if(chkId != null) {
						Cookie cookie = new Cookie("rememberId",userId);
					
						response.addCookie(cookie);
					}
					if(chkPw !=null) {
						Cookie cookie = new Cookie("rememberPw",userPw);
						response.addCookie(cookie);
					}
//					기억하기 체크 해제했을 경우 cookie죽임
					if(chkId==null) {
						Cookie cookie = new Cookie("rememberId","");
						cookie.setMaxAge(0);
						response.addCookie(cookie);
					}
					if(chkPw==null) {
						Cookie cookie = new Cookie("rememberPw","");
						cookie.setMaxAge(0);
						response.addCookie(cookie);
					}
//					쿠키로 저장기능, 세션으로 로그인 기능 
					session.setAttribute("userId", userId);
					session.setMaxInactiveInterval(60*60*24);
					response.sendRedirect("/index");
//					비밀번호 틀렸을경우
				}else if(!userPw.equals(userpw_)){
					response.sendRedirect("/login/loginfail");
				}
//				DB조회 결과 없을경우 일치하지않음
			}else {
	
				response.sendRedirect("/login/loginfail");
			}
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
	}
}
