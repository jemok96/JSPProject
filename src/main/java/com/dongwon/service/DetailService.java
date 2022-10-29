package com.dongwon.service;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.dongwon.entity.FreeBoardDTO;

public class DetailService {
	String getId;
	String url;
	String sql;
	public FreeBoardDTO getBoard(String getId) {
		url = "jdbc:oracle:thin:@localhost:1521:orcl";
		sql = "SELECT * FROM FREE_BOARD WHERE ID =?";
		this.getId = getId;
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
		return fb;
	}
	public int plusHit(String id) {
		int result =0;
		url = "jdbc:oracle:thin:@localhost:1521:orcl";
		sql = "UPDATE FREE_BOARD SET HIT = HIT+1 WHERE ID = ?";

		FreeBoardDTO fb = null;
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con = DriverManager.getConnection(url,"scott","tiger");
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, id);
			result = st.executeUpdate();
			
		
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
}
