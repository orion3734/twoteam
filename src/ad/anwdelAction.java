package ad;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class anwdelAction extends HttpServlet {
	@Override
	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String anwnum= req.getParameter("anwnum");
		adDAO dao= adDAO.getInstance();
		dao.anwdel(Integer.parseInt(anwnum));
req.setAttribute("adnum", req.getParameter("adnum"));
	}
}
