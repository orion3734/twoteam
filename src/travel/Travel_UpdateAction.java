package travel;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Travel_UpdateAction implements Travel_ActionImp {

	@Override
	public void execute(HttpServletRequest req) {
		TravelDTO tdto = new TravelDTO();

		int tb_num = Integer.parseInt(req.getParameter("tb_num"));

		tdto.setTb_title(req.getParameter("tb_title"));
		tdto.setEditordata(req.getParameter("editordata"));
		tdto.setTb_dt_s(req.getParameter("tb_dt_s"));
		tdto.setTb_dt_e(req.getParameter("tb_dt_e"));
		tdto.setTb_img(req.getParameter("tb_img"));
		tdto.setTb_num(tb_num);

		TravelDAO dao = TravelDAO.getInstance();
		dao.UpdateMethod(tdto);

		System.out.println("updateaction_ tb_num=" + tb_num);
	}

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {

	}

}
