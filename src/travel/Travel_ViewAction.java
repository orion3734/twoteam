package travel;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sun.org.apache.bcel.internal.generic.NEWARRAY;

public class Travel_ViewAction implements Travel_ActionImp {

	@Override
	public void execute(HttpServletRequest req) {

		TravelDTO tdto = new TravelDTO();
		tdto.setIp(req.getRemoteAddr());

		System.out.println(req.getParameter("tb_num"));

		int tb_num = Integer.parseInt(req.getParameter("tb_num"));

		TravelDAO dao = TravelDAO.getInstance();

		tdto.setIp(req.getRemoteAddr());
		if (dao.ipcheckMethod(tdto, tb_num) == 0) {
			dao.ipMethod(tdto, tb_num);
			dao.countMethod(tb_num);
		}

		req.setAttribute("tdto", dao.ViewMethod(tb_num));

	}

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		// TODO Auto-generated method stub

	}

}
