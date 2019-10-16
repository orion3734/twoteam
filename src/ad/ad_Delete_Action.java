package ad;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ad_Delete_Action extends HttpServlet {
	@Override
	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String ad_num= req.getParameter("adnum");
		adDAO dao= adDAO.getInstance();
		dao.ad_deleteMethod(Integer.parseInt(ad_num));
	}
}
