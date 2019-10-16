package ad;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class adCommentListAction extends HttpServlet {
	@Override
	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	int adnum= Integer.parseInt(req.getParameter("adnum"));
	adDAO dao= adDAO.getInstance();
	List<anwDTO> alist = dao.adcomment(adnum);
	req.setAttribute("alist", alist);
	}
}
