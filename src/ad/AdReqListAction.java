package ad;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class AdReqListAction extends HttpServlet {
	@Override
	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		adDAO dao = adDAO.getInstance();
		if(session.getAttribute("id")==null)
			return;
		String pageNum =req.getParameter("pageNum");
		if(pageNum== null || pageNum.equals("null")) {
			pageNum="1";
		}
		int currentPage=Integer.parseInt(pageNum);
		HashMap<String, String> map = new HashMap<String, String>();
	
		int totalCount = dao.rowTotalCount(map);
		List<anwDTO> alist2 = dao.anwcount();
		if((int)session.getAttribute("lvl")==1) {
			PageDTO pdto= new PageDTO(currentPage, totalCount);
			List<adDTO> alist=dao.masterlistMethod(pdto);
			
			req.setAttribute("alist", alist);
			req.setAttribute("alist2", alist2);
			req.setAttribute("pdto", pdto);
		}else {
		
			PageDTO pdto= new PageDTO(currentPage, totalCount);
			List<adDTO> alist = dao.listMethod(session.getAttribute("id").toString(), pdto);
		
			req.setAttribute("alist", alist);
			req.setAttribute("alist2", alist2);
			req.setAttribute("pdto", pdto);
		}
		/* dao.adanwcntMethod(adnum); */
	}
}
