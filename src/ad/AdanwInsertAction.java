package ad;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AdanwInsertAction extends HttpServlet {
	@Override
public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	int ad_num= Integer.parseInt(req.getParameter("anwnum"));
	String id= req.getParameter("anwid");
	String ad_cont_aw= req.getParameter("cont");
	anwDTO dto=new anwDTO();
	adDAO dao= adDAO.getInstance();
	dto.setAd_cont_aw(ad_cont_aw);
	dto.setAd_num(ad_num);
	dto.setId(id);
	dao.anwInsertMethod(dto);
	}
}
