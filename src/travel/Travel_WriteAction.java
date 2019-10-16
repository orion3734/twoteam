package travel;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class Travel_WriteAction implements Travel_MultiImp {

	@Override
	public MultipartRequest executeMulti(HttpServletRequest req) {
		HttpSession session = req.getSession();
		MultipartRequest multi = null;

		String saveDirectory = req.getSession().getServletContext().getRealPath("/") + "khtemp/";
		System.out.println(saveDirectory);

		File file = new File(saveDirectory);
		if (!file.exists())
			file.mkdir();
		int maxPostSize = 1000000000;
		String encoding = "UTF-8";

		try {
			multi = new MultipartRequest(req, saveDirectory, maxPostSize, encoding, new DefaultFileRenamePolicy());
		} catch (IOException e) {

			e.printStackTrace();
		}

		TravelDAO dao = TravelDAO.getInstance();
		TravelDTO tdto = new TravelDTO();
		/* multi.getParameter("pageNum"); */
		tdto.setTb_title(multi.getParameter("tb_title"));
		tdto.setEditordata(multi.getParameter("editordata"));
		tdto.setTb_dt_s(multi.getParameter("tb_dt_s"));
		tdto.setTb_dt_e(multi.getParameter("tb_dt_e"));
		// tdto.setTb_readct(Integer.parseInt(multi.getParameter("tb_readct")));
		tdto.setId(session.getAttribute("id").toString());
		tdto.setTb_img(multi.getFilesystemName("tb_img"));
		/* tdto.setTb_dt(multi.getParameter("tb_dt")); */
		dao.insertMethod(tdto);

		return multi;
	}

}
