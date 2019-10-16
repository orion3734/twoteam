package qna;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import qna.QnaDAO;
import qna.QnaDTO;

public class QnaUpdateProAction implements QnaActionimp{

	@Override
	public void execute(HttpServletRequest req) {
		QnaDTO dto =new QnaDTO();
		
		int qa_num = Integer.parseInt(req.getParameter("qa_num"));
		
		
		dto.setQa_type(req.getParameter("qa_type"));
		dto.setQa_title(req.getParameter("qa_title"));
		dto.setQa_cont(req.getParameter("qa_cont"));
		dto.setQa_num(qa_num);
		
		QnaDAO dao = QnaDAO.getInstance();
		dao.updateMethod(dto);
		
		System.out.println("upadatePro qa_num: " +qa_num);
	}//end execute

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		
	}
	
}
