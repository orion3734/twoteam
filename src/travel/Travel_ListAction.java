package travel;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Travel_ListAction implements Travel_ActionImp {

	@Override
	public void execute(HttpServletRequest req) {
		HttpSession session = req.getSession();

		TravelDAO dao = TravelDAO.getInstance();
		String pageNum = req.getParameter("pageNum");

		if (pageNum == null || pageNum.equals("null")) {
			pageNum = "1";
		}

		int currentPage = Integer.parseInt(pageNum);

		HashMap<String, String> map = new HashMap<String, String>();

		int cnt = dao.rowTotalCount(map);
		if (cnt > 0) {
			System.out.println(currentPage);
			PageDTO pdto = new PageDTO(currentPage, cnt);
			req.setAttribute("aList", dao.listMethod(pdto));
			req.setAttribute("pdto", pdto);
		}

	}

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {

	}

}
