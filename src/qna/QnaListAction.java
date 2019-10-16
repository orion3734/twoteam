package qna;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class QnaListAction implements QnaActionimp{

	@Override
	public void execute(HttpServletRequest req) {
		HttpSession session = req.getSession();
		QnaDAO dao = QnaDAO.getInstance();
		String pageNum = req.getParameter("pageNum");
		System.out.println("pageNum : " + pageNum);
		if(pageNum== null || pageNum.equals("null")) {
			pageNum="1";
		}
		int currentPage=Integer.parseInt(pageNum);
		
		
		HashMap<String, String> map = new HashMap<String, String>();
		
	if(session.getAttribute("id")==null) {	
		return;
	}else{
		if((int)session.getAttribute("lvl")==1){
			int totalCount = dao.rowTotalCount(map);
			if(totalCount > 0) {
				
				PageDTO pdto = new PageDTO(currentPage, totalCount);
				/* List<QnaDTO> aList = dao.listMethod(pdto); */
				req.setAttribute("aList", dao.listMethod(pdto));
				req.setAttribute("pdto", pdto);
			}
		}else {
			int totalCount = dao.genTotalCount(session.getAttribute("id").toString(),map);
			System.out.println(totalCount);
				if(totalCount > 0) {
				PageDTO pdto = new PageDTO(currentPage, totalCount);
				List<QnaDTO> aList = dao.genViewMethod(session.getAttribute("id").toString(),pdto);
				
				req.setAttribute("aList", aList);
				req.setAttribute("pdto", pdto);
			}
		}
	}
		}//end excute
		

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		
	}
	
	
}//end class 
