package qna;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import qna.QnaDAO;

public class QnaDeleteAction implements QnaActionimp{

	@Override
	public void execute(HttpServletRequest req) {
		QnaDAO dao = QnaDAO.getInstance();
		int qa_num= Integer.parseInt(req.getParameter("qa_num"));
		
		dao.deleteMethod(qa_num);
	}
	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		
	}

}//end class
