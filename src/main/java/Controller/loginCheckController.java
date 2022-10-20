package Controller;

import java.io.IOException;

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
		String userId = request.getParameter("userId");
		String userpw = request.getParameter("userpw");
		HttpSession session = request.getSession();
		session.setAttribute("userId", userId);

		request.getRequestDispatcher("/WEB-INF/view/loginCheck.jsp")
		.forward(request, response);
	}
}
