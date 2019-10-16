package qna;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import qna.QnaDAO;
import qna.QnaDTO;

public class QnaUpdateFormAction implements QnaActionimp{

	@Override
	public void execute(HttpServletRequest req) {
		String qa_num=null;
		if(req.getParameter("qa_num")!=null)
		{
			qa_num=req.getParameter("qa_num");
		}
		
		QnaDAO dao = QnaDAO.getInstance();
		QnaDTO dto = dao.viewMethod(Integer.parseInt(qa_num));
		req.setAttribute("dto", dto);
		
	}

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		
	}
	

}
