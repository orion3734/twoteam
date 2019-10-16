package mypage;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class MypageListAction implements MypageActionImp{
	@Override
	public void execute(HttpServletRequest req) {
		HttpSession session = req.getSession();
		mypageDAO dao = mypageDAO.getInstance();
		
		req.setAttribute("aList", dao.writeviewMethod(session.getAttribute("id").toString()));
	}
	
	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		
	}
}
