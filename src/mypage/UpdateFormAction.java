package mypage;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class UpdateFormAction implements MypageActionImp{
	@Override
	public void execute(HttpServletRequest req) {
		HttpSession session = req.getSession();
		mypageDAO dao = mypageDAO.getInstance();
		/* userDTO dto = dao.viewMethod(num); */
		req.setAttribute("dto", dao.viewMethod(session.getAttribute("id").toString()));		
		
	}
	
	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		// TODO Auto-generated method stub
		
	}
	
}
