package user;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class insertchk extends HttpServlet {
	@Override
	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		userDAO dao=userDAO.getInstance();
		int idchk = dao.insertcheckMethod(req.getParameter("userid"));
		req.setAttribute("idchk", idchk);
	}
}
