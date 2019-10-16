package main;

import java.util.List;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import travel.TravelDAO;
import travel.TravelDTO;

public class MainAction extends HttpServlet {
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		TravelDAO dao = TravelDAO.getInstance();
		List<TravelDTO> aList = dao.top3listMethod();

		for (int i = 0; i < aList.size(); i++) {
			System.out.println(aList.get(i).getTb_title());
		}
		HttpSession session = req.getSession();
		session.setAttribute("iuList", aList);
		req.setAttribute("aList", aList);
	}
}
