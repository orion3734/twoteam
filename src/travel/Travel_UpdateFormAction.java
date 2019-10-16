package travel;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import qna.QnaDTO;

public class Travel_UpdateFormAction implements Travel_ActionImp {

	@Override
	public void execute(HttpServletRequest req) {
		System.out.println("업데이트폼액션");
		String tb_num = null;
		if (req.getParameter("tb_num") != null) {

			tb_num = req.getParameter("tb_num");

		}

		TravelDAO dao = TravelDAO.getInstance();
		System.out.println(tb_num);
		System.out.println("변환" + Integer.parseInt(tb_num));
		TravelDTO tdto = dao.ViewMethod(Integer.parseInt(tb_num));
		req.setAttribute("tdto", tdto);

		System.out.println(tb_num);
	}

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {

	}

}
