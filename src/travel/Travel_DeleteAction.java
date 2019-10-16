package travel;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



public class Travel_DeleteAction implements Travel_ActionImp {

	@Override
	public void execute(HttpServletRequest req) {
		TravelDAO dao = TravelDAO.getInstance();
		int tb_num = Integer.parseInt(req.getParameter("tb_num"));

		dao.DeleteMethod(tb_num);

	}

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		// TODO Auto-generated method stub

	}

}
