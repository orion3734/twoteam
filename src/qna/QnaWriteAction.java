package qna;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class QnaWriteAction implements QnaActionimp {

	@Override
	public void execute(HttpServletRequest req) {
		HttpSession session = req.getSession(); 
		QnaDAO dao = QnaDAO.getInstance();
		QnaDTO dto = new QnaDTO();
		dto.setId(session.getAttribute("id").toString());
		dto.setQa_title(req.getParameter("qa_title"));
		dto.setQa_type(req.getParameter("qa_type"));
		dto.setQa_cont(req.getParameter("qa_cont"));
		
	
	//답변 글이면
	if(req.getParameter("qa_reLevel")!= null) {
		HashMap<String, Integer> map =new HashMap<String, Integer>();
		map.put("qa_ref",Integer.parseInt(req.getParameter("qa_ref"))); 
		map.put("qa_reStep",Integer.parseInt(req.getParameter("qa_reStep")));
		
		dao.reStepMethod(map);
		
		dto.setQa_ref(Integer.parseInt(req.getParameter("qa_ref")));
		dto.setQa_reStep(Integer.parseInt(req.getParameter("qa_reStep"))+1);
		dto.setQa_reLevel(Integer.parseInt(req.getParameter("qa_reLevel"))+1);
		req.setAttribute("pageNum", req.getParameter("pageNum"));
	}
	dao.insertMethod(dto);
	
	}//end executeMethod()
	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		
	}
	
	
}//end class 
