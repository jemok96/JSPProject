package com.dongwon.service;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.dongwon.entity.FreeBoardDTO;

public class BoardService {
	public List<FreeBoardDTO> getNoticeList(){
		return getNoticeList("title","",1);
	}
	public List<FreeBoardDTO> getNoticeList(int page){
		return getNoticeList("title","",page);
	}
	public List<FreeBoardDTO> getNoticeList(String field, String query, int page){
		String url = "jdbc:oracle:thin:@localhost:1521:orcl";
		String sql = "SELECT * FROM ( "
				+ "    SELECT ROWNUM NUM , F.* FROM( "
				+ "        SELECT * FROM FREE_BOARD WHERE "+field+" LIKE ? ORDER BY REGDATE DESC) F "
				+ " )WHERE NUM BETWEEN ? AND ?";
		List<FreeBoardDTO> list = new ArrayList<>();
		FreeBoardDTO fb = null;
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con = DriverManager.getConnection(url,"scott","tiger");
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, "%"+query+"%");
			st.setInt(2, 1+(page-1)*10);
			st.setInt(3, page*10);
			ResultSet rs = st.executeQuery();
			while(rs.next()) {
				int id = rs.getInt("ID");
				String title = rs.getString("TITLE");
				String writer_id = rs.getString("WRITER_ID");
				Date regdate = rs.getDate("REGDATE");
				String content = rs.getString("CONTENT");
				int hit = rs.getInt("HIT");
				fb = new FreeBoardDTO(id, title, writer_id, regdate, content, hit);
				list.add(fb);
			}
		
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		return list;

		
	}
}