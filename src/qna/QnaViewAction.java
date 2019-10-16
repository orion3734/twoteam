package qna;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import qna.QnaDAO;

public class QnaViewAction implements QnaActionimp {

	@Override
	public void execute(HttpServletRequest req) {
		HttpSession session = req.getSession();
		session.getAttribute("id");
		session.getAttribute("lvl");
		
		int qa_num = Integer.parseInt(req.getParameter("qa_num"));
		QnaDAO dao = QnaDAO.getInstance();
		req.setAttribute("dto", dao.viewMethod(qa_num));
		
	}

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		
	}

}//end class 
