package Controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/login/check")
public class loginCheckController extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userId_ = request.getParameter("userId");
		String userpw_ = request.getParameter("userpw");
		HttpSession session = request.getSession();
		
		String url = "jdbc:oracle:thin:@localhost:1521:orcl";
		String sql = "SELECT * FROM DONG_USER WHERE ID=?";
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con = DriverManager.getConnection(url,"scott","tiger");
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, userId_);
			ResultSet rs = st.executeQuery();
			if(rs.next()) {
				String userId = rs.getString("ID");
				String userpw = rs.getString("PASSWORD");
				if(userId.equals(userId_) &&userpw.equals(userpw_)) {
					session.setAttribute("userId", userId);
					response.sendRedirect("/index");;
				}else {
					request.getRequestDispatcher("/WEB-INF/view/loginFail.jsp");
				}
			}
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
	}
}
